import sqlite3
import json
import base64
import os
from pathlib import Path
import argparse

def build_db(db_path: str, in_dir: str = "tables", schema_path: str = "schema.sql"):
    if os.path.exists(db_path):
        os.remove(db_path)
        print(f"Removed existing {db_path}")

    conn = sqlite3.connect(db_path)

    with open(schema_path, 'r', encoding='utf-8') as f:
        schema_sql = f.read()
    conn.executescript(schema_sql)

    for file_path in sorted(Path(in_dir).glob("*.ndjson")):
        table = file_path.stem  # File name without .ndjson

        cur = conn.cursor()
        # Use double quotes for SQLite-compatible escaping
        cur.execute(f"PRAGMA table_info(\"{table}\");")
        columns_info = cur.fetchall()
        if not columns_info:
            print(f"Warning: No columns found for table {table} – skipping")
            continue

        columns = [info[1] for info in columns_info]
        type_map = {info[1]: info[2].upper() for info in columns_info}

        placeholders = ', '.join(['?' for _ in columns])
        insert_sql = f"INSERT INTO \"{table}\" ({', '.join(columns)}) VALUES ({placeholders});"

        rows = []
        with open(file_path, 'r', encoding='utf-8') as f:
            for line_num, line in enumerate(f, 1):
                line = line.strip()
                if not line:
                    continue
                try:
                    row_dict = json.loads(line)
                except json.JSONDecodeError as e:
                    print(f"Error parsing line {line_num} in {file_path}: {e}")
                    continue

                row = []
                for col in columns:
                    val = row_dict.get(col)
                    if val is not None and 'BLOB' in type_map.get(col, ''):
                        try:
                            val = base64.b64decode(val)
                        except Exception as e:
                            print(f"Error decoding BLOB in {table}.{col} line {line_num}: {e}")
                    row.append(val)
                rows.append(tuple(row))

        if rows:
            try:
                conn.executemany(insert_sql, rows)
                print(f"Imported {len(rows)} rows into {table} from {file_path}")
            except sqlite3.Error as e:
                print(f"Error inserting into {table}: {e}")
                # Optional: rollback or continue – here we continue to next table

        conn.commit()  # Commit per table for better error isolation

    conn.close()
    print(f"Built {db_path} successfully")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Build SQLite DB from schema and NDJSON files")
    parser.add_argument("--db_path", default="output/cdclient.sqlite", help="Path to the output .sqlite file")
    parser.add_argument("--in_dir", default="tables", help="Input directory with .ndjson files")
    parser.add_argument("--schema", default="tables/schema.sql", help="Path to schema.sql")
    args = parser.parse_args()
    build_db(args.db_path, args.in_dir, args.schema)