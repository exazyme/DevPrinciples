#!/bin/bash

# This script consolidates all development guideline markdown files
# from the GUIDELINES directory into a single AGENT.md file.
# This creates a comprehensive prompt for AI code generation agents.

set -e

OUTPUT_FILE="AGENT.md"
GUIDELINES_DIR="GUIDELINES"

# Check if the guidelines directory exists
if [ ! -d "$GUIDELINES_DIR" ]; then
  echo "Error: Directory '$GUIDELINES_DIR' not found."
  exit 1
fi

# Start with a clean file
> "$OUTPUT_FILE"

echo "--- AGENT DEVELOPMENT GUIDELINES ---" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Please adhere strictly to the following development principles and guidelines for all code generation and modification tasks." >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Loop through all markdown files in the guidelines directory
for file in "$GUIDELINES_DIR"/*.md; do
  if [ -f "$file" ]; then
    # Add a separator and the filename as a header
    echo "" >> "$OUTPUT_FILE"
    echo "========================================" >> "$OUTPUT_FILE"
    echo "## From $(basename "$file")" >> "$OUTPUT_FILE"
    echo "========================================" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # Append the content of the file
    cat "$file" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
  fi
done

echo "Successfully generated '$OUTPUT_FILE' from the guidelines in '$GUIDELINES_DIR'."
