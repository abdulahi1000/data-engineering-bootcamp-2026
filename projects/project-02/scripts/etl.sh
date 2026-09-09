#!/bin/bash

# ==========================================================
# CoreDataEngineers ETL Pipeline
# Step 1: Extract
# ==========================================================

# Stop the script immediately if a command fails
set -e

echo "======================================"
echo "Starting CoreDataEngineers ETL Process"
echo "======================================"

# ----------------------------------------------------------
# Check that the DATA_URL environment variable exists
# ----------------------------------------------------------

if [ -z "${DATA_URL}" ]; then
    echo "ERROR: DATA_URL environment variable is not set."
    echo "Please set DATA_URL before running this script."
    exit 1
fi

echo "DATA_URL environment variable found."

# ----------------------------------------------------------
# Create the raw directory if it does not already exist
# ----------------------------------------------------------

mkdir -p raw

echo "Raw directory is ready."

# ----------------------------------------------------------
# Get the filename from the URL
# ----------------------------------------------------------

FILE_NAME=$(basename "${DATA_URL}")

RAW_FILE="raw/${FILE_NAME}"

echo "Source file name: ${FILE_NAME}"

# ----------------------------------------------------------
# Download the CSV file
# ----------------------------------------------------------

echo "Extracting data..."

curl -fL "${DATA_URL}" -o "${RAW_FILE}"

# ----------------------------------------------------------
# Confirm that the file exists in the raw directory
# ----------------------------------------------------------

if [ -f "${RAW_FILE}" ]; then
    echo "Extract completed successfully."
    echo "File saved to: ${RAW_FILE}"
else
    echo "ERROR: File was not saved to the raw directory."
    exit 1
fi

echo "======================================"
echo "Extract step completed."
echo "======================================"

# ==========================================================
# Step 2: Transform
# ==========================================================    

echo "======================================"
echo "Starting Transform step..."       
echo "======================================"

mkdir -p Transformed

TRANSFORMED_FILE="Transformed/2023_year_finance.csv"
# Transform the CSV:
# 1. Rename Year to year in the output
# 2. Rename Variable_code to variable_code
# 3. Select only Year, Value, Units and Variable_code

awk -F',' '
BEGIN {
    OFS=","
}

NR==1 {
    for (i=1; i<=NF; i++) {

        if ($i=="Year")
            year_col = i

        if ($i=="Variable_code")
            variable_code_col = i

        if ($i=="Value")
            value_col = i

        if ($i=="Units")
            units_col = i
    }

    print "year", "Value", "Units", "variable_code"
    next
}

{
    print $year_col, $value_col, $units_col, $variable_code_col
}
' "$RAW_FILE" > "$TRANSFORMED_FILE"

#  confirm that the transformed file exists
if [ -f "${TRANSFORMED_FILE}" ]; then
    echo "Transform completed successfully."
    echo "File saved to: ${TRANSFORMED_FILE}"
else
    echo "ERROR: Transformed file was not saved."
    exit 1
fi

# ----------------------------------------------------------
# LOAD STEP
# ----------------------------------------------------------

echo "======================================"
echo "Starting Load step..."
echo "======================================"

# Create Gold directory if it does not exist
mkdir -p Gold

# Define destination file
GOLD_FILE="Gold/2023_year_finance.csv"

# Copy transformed file into Gold
cp "$TRANSFORMED_FILE" "$GOLD_FILE"

# Confirm the file was loaded successfully
if [ -f "$GOLD_FILE" ]; then
    echo "Load completed successfully."
    echo "File saved to: $GOLD_FILE"
else
    echo "ERROR: File was not loaded into the Gold folder."
    exit 1
fi

echo "======================================"
echo "ETL process completed successfully."
echo "======================================"
