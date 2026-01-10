import sqlite3
import json
import base64
import os
from pathlib import Path
import argparse

def export_db(db_path: str, out_dir: str = "tables"):
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    cur = conn.cursor()

    cur.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = [row[0] for row in cur.fetchall()]

    Path(out_dir).mkdir(parents=True, exist_ok=True)

    for table in tables:
        # Sort by rowid for stable, reproducible order (helps Git diffs)
        cur.execute(f"SELECT * FROM [{table}] ORDER BY rowid;")
        rows = cur.fetchall()

        file_path = Path(out_dir) / f"{table}.ndjson"
        with open(file_path, 'w', encoding='utf-8') as f:
            for row in rows:
                row_dict = {}
                for key, value in dict(row).items():
                    if isinstance(value, bytes):
                        row_dict[key] = base64.b64encode(value).decode('ascii')
                    else:
                        row_dict[key] = value
                f.write(json.dumps(row_dict, ensure_ascii=False, default=str) + '\n')

        print(f"Exported {len(rows)} rows from {table} to {file_path}")

    conn.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Export SQLite DB tables to NDJSON")
    parser.add_argument("--db_path", default="dev/cdclient.sqlite", help="Path to the source .sqlite file")
    parser.add_argument("--out_dir", default="tables", help="Output directory for .ndjson files")
    args = parser.parse_args()
    export_db(args.db_path, args.out_dir)