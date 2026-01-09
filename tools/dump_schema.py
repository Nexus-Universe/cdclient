import sqlite3
import argparse
import os

def dump_schema(db_path: str, schema_path: str = "tables/schema.sql"):
    if os.path.exists(schema_path):
        print(f"Overwriting existing {schema_path}")

    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    cur.execute("""
        SELECT sql || ';'
        FROM sqlite_master
        WHERE sql IS NOT NULL
          AND type IN ('table', 'index', 'trigger', 'view')
          AND name NOT LIKE 'sqlite_%'
        ORDER BY type, name;
    """)

    with open(schema_path, 'w', encoding='utf-8') as f:
        for row in cur.fetchall():
            sql = row[0].strip()
            if sql:
                f.write(sql + '\n\n')

    conn.close()
    print(f"Schema dumped to {schema_path} (system tables excluded)")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Dump schema from SQLite DB")
    parser.add_argument("--db_path", default="dev/cdclient.sqlite", help="Path to the source .sqlite file")
    parser.add_argument("--schema", default="tables/schema.sql", help="Output schema file")
    args = parser.parse_args()
    dump_schema(args.db_path, args.schema)