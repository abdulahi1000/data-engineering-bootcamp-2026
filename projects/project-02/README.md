# CoreDataEngineers Bash ETL Project

## Project Overview

This project is part of my Data Engineering Bootcamp exercises.

The objective is to use **Linux and Bash scripting** to build a simple ETL pipeline that:

1. Extracts a CSV file from an external URL.
2. Transforms the downloaded data.
3. Loads the transformed data into a Gold directory.
4. Schedules the ETL pipeline using a cron job.
5. Moves CSV and JSON files between directories using Bash.
6. Versions all work using Git.

---

## Project Structure

```text
project-02/
│
├── Gold/
│   └── 2023_year_finance.csv
│
├── raw/
│   └── annual-enterprise-survey-2023-financial-year-provisional.csv
│
├── scripts/
│   └── etl.sh
│
├── Transformed/
│   └── 2023_year_finance.csv
│
├── config.env
└── README.md
```

---

## ETL Process

The ETL pipeline is written using Bash and standard Linux command-line tools.

### Extract

The source CSV is downloaded from Statistics New Zealand.

The URL is stored as an environment variable instead of being hardcoded directly into the ETL logic.

Example:

```bash
export DATA_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
```

The Bash script:

- Creates the `raw` directory if it does not exist.
- Gets the filename dynamically from the URL.
- Downloads the file using `curl`.
- Saves the downloaded CSV in the `raw` directory.
- Confirms that the file was successfully downloaded.

Example output:

```text
Extract completed successfully.
File saved to: raw/annual-enterprise-survey-2023-financial-year-provisional.csv
```

---

## Transform

The transformation is performed using `awk`.

The script dynamically identifies the positions of the required columns from the CSV header instead of relying on fixed column positions.

The required columns are:

```text
Year
Value
Units
Variable_code
```

The output contains:

```text
year
Value
Units
variable_code
```

The following column names are changed:

```text
Year          -> year
Variable_code -> variable_code
```

Only the required columns are written to the transformed dataset.

The resulting file is:

```text
Transformed/2023_year_finance.csv
```

Example output:

```text
Transform completed successfully.
File saved to: Transformed/2023_year_finance.csv
```

---

## Load

The final stage copies the transformed dataset into the `Gold` directory.

The final dataset is stored as:

```text
Gold/2023_year_finance.csv
```

The script also checks that the file exists after loading.

Example output:

```text
Load completed successfully.
File saved to: Gold/2023_year_finance.csv
```

---

## Running The ETL Pipeline

Make the script executable:

```bash
chmod +x scripts/etl.sh
```

Run the ETL pipeline:

```bash
./scripts/etl.sh
```

A successful execution should display messages for each stage:

```text
Starting CoreDataEngineers ETL Process

Extract completed successfully.

Transform completed successfully.

Load completed successfully.

ETL process completed successfully.
```

---

## Bash Concepts Used

This project demonstrates the use of several Bash and Linux concepts, including:

- Environment variables
- `curl`
- `awk`
- `mkdir`
- `basename`
- `cp`
- Bash variables
- Bash conditionals
- File existence checks
- Command substitution
- Exit codes
- Directory management

---

## Cron Scheduling

The ETL pipeline is intended to run automatically every day at **12:00 AM** using cron.

The required cron expression is:

```cron
0 0 * * *
```

The fields represent:

```text
Minute        0
Hour          0
Day           Every day
Month         Every month
Day of Week   Every day of the week
```

The cron service has been confirmed to be running on the Linux environment.

Cron configuration and testing are still being completed.

---

## CSV And JSON File Movement

Another requirement of the project is to create a Bash script that moves one or more `.csv` and `.json` files into a directory called:

```text
json_and_CSV
```

This part of the project is still in progress.

---

## Version Control

Git is used to version the project.

Useful Git commands include:

```bash
git status
```

Stage changes:

```bash
git add .
```

Commit changes:

```bash
git commit -m "Build Bash ETL pipeline"
```

Push changes:

```bash
git push
```

---

## Current Project Status

| Task | Status |
|---|---|
| Create Bash ETL script | Completed |
| Extract CSV into `raw` | Completed |
| Use URL environment variable | Completed |
| Transform required columns | Completed |
| Rename required columns | Completed |
| Save transformed CSV | Completed |
| Load file into `Gold` | Completed |
| Confirm each ETL stage | Completed |
| Configure cron for midnight execution | In Progress |
| Test cron execution | In Progress |
| CSV/JSON movement script | Pending |
| Git version control | In Progress |

---

## Next Steps

The next stages of the project are:

1. Finish configuring the cron job.
2. Test the cron job.
3. Create the CSV and JSON file movement script.
4. Add sample CSV and JSON files for testing.
5. Complete the final Git commit and push.

