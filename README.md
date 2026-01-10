# Collaborative Database Editing for CDClient

This repository houses the cdclient used by the [Nexus Universe](https://nexusuniverse.online/) server. The intention is to allow multiple people to collaboratively add content to the game's database without constant manual merging of binary files, while also allowing for version control.

We version the database as human readable text files (NDJSON – one JSON object per row, one per line) in the `tables/` folder. Git handles merges and diffs best with text, so this method allows for a smoother experience when it comes to adding content.

**.sqlite and .fdb files are not tracked by the repo. Database must be built after every pull and exported before every push** 


## Prerequisites

1. **Git**  
	- **Terminal** (assumed in this README) 
	  - Download from https://git-scm.com/downloads
	- **GUI**
		- There are many Git/Github GUIs to choose from. Pick one that works for you.

2. **Python 3**  
   - **Windows (recommended)**: 
	   - Open the Microsoft Store → search "Python 3.12" (or latest 3.x) → install. This version works directly in PowerShell.  
   - **Direct**: 
	   - https://www.python.org/downloads/
	  
3. **DB Browser for SQLite** (GUI for editing database)  
   Download from https://sqlitebrowser.org/dl/
<br>

## Repository Structure
```
.
├── dev/					  # Where you will place the cdclient.sqlite that you will be working on. This is also where the scripts expect it to be by default.
│ 
├── output/
│           				  # This is where the generated cdclient.sqlite will be placed by the scripts 
├── tables/					  # Contains all the files for building the database. You can generally ignore this folder
│   ├── fdb_template.fdb      # Template file for FDB conversion
│   └── *.ndjson              # One NDJSON file per database table (versioned data)
├── tools/
│   ├── dump_schema.py        # One-time schema dumper (Ignore)
│   ├── sqlite-to-fdb.exe     # Conversion tool: SQLite → FDB
│   └── template-fdb.exe      # For regenerating template, can ignore
├── .gitignore
├── build_db.py               # Rebuilds output/cdclient.sqlite from the ndjson in tables/
├── export_db.py              # Exports dev/cdclient.sqlite → tables/*.ndjson
└── README.md
```

<br>

## Initial Setup

1. Open PowerShell (Windows) or terminal (Linux).
2. Clone the repository:
	-	Run `git clone https://github.com/Nexus-Universe/cdclient.git`
	-	Run `cd cdclient/`
3. Get the latest changes:
	-	`git pull`
4. Generate the database:
	-	Run `python build_db.py`
	-	You should now see a `cdclient.sqlite` in `output/`
5. Copy the generated database in `output/` to the working folder `dev`
6. Open `dev/cdclient.sqlite` in DB Browser.

<br>

## Daily Workflow

⚠️ **.sqlite and .fdb files are not tracked by the repo. You must export your working database before commiting.** ⚠️

### 1. Start New Work (Create a Branch)
**Always work on a branch.**
Open a terminal in the repo root (`cdclient/`)

Run the following commands in order
```
git fetch
git checkout master
git pull
git checkout -b your-branch-name
```
Branch names should be short, simple and descriptive of what changes are being made on the branch. 

### 2. Get the Latest Database State
After pulling you should regenerate the database to make sure you are editing the most recent version.
1. Run `python build_db.py`
2. Copy the generated database in `output/` to `dev/`

### 3. Edit the Database

Open `dev/cdclient.sqlite` in DB Browser for SQLite.
- Add your new rows/content.
- **Avoid ID conflicts**:  
	- Check the current highest ID in a table.  
	- Coordinate with the team to avoid editing the same rows.

### 4. Save Your Changes to Git
After you have made a lot of changes or you are done for the day, it is good practice to commit your changes to git. To do so, run the following commands in order:
```
python export_db.py 
git add tables/ 
git commit -m "Describe your changes here, e.g. Add new weapons and enemy stats"
git push
```
> *If this is the first time you are pushing on your branch, you may need to run `git push origin your-branch-name`*

Repeat steps 3–4 as needed.

### 5. Bring in Updates from Master
This shouldn't need to be done often. Would recommend using a GUI for easy resolving of merge conflicts.
> Most likely overkill, but VS code with the git graph extension is nice for git diffs and merge conflicts
1. Merge master into your branch
2. Resolve any conflicts
	- Commit any changes made
3. Then rebuild your database (step 2 again).

### 6. Finish and Merge
Once you are done with your development and want to add your changes to the production database, you will need to merge your branch into master.
The process for this generally is as follows
1. Make sure your branch is pushed 
		- Run `git push`
2. Open a Pull Request on GitHub
3. Once approved, it will be merged into the `master` branch

### 7. Generate Game-Ready File
Converting to a `.fdb` file requires the use of the [Assembly RS conversion tool](https://assembly.lu-dev.net/)
> *Due to the table constraints added to the database, [assembly.lu-dev.net](https://assembly.lu-dev.net/ "https://assembly.lu-dev.net/") is unable to convert from .sqlite -> .fdb*

For convenience the tool has been added to `tools/`
1. Make sure you have a recent generation of the database
		- `python build_db.py`
2. Run the convertion tool
	- Run `.\tools\sqlite-to-fdb.exe tables\fdb_template.fdb output\cdclient.sqlite output\cdclient.fdb`
3. A new `cdclient.fdb` should now be in `output/`

<br>

## Tips to Avoid Problems

- Commit often with clear messages.
- Pull and rebuild frequently.
- Use unique ID ranges.

<br>

## Script Explanations

Run these from the repository root.  
**Preferred**: No arguments needed – they use default paths (`dev/`, `output/`, `tables/`).

- **`export_db.py`**  
  Takes your edited `dev/cdclient.sqlite` and writes the data to `tables/*.ndjson` for Git to track.

- **`build_db.py`**  
  Builds a clean `output/cdclient.sqlite` from the versioned `tables/` data.

- **`tools\sqlite-to-fdb.exe`**
	Converts .sqlite -> .fdb

- **`dump_schema.py`**  
  One-time tool (already done) to create the schema file.

Run any script with `--help` for options if you need custom paths.
