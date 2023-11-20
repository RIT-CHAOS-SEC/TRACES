#!/bin/bash

# Check if a filename is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Input filename
input_file="$1"

# Output filename
output_file="filtered_$input_file"

# Remove lines containing @ or :
grep -vE '@|:' "$input_file" > "$output_file"

sed -i '/\..*L/! s/\..*//g' "$output_file"

sed -i '/^\s*$/d' "$output_file"

line_count=$(wc -l < "$output_file")
echo "Number of assembly instructions in $input_file: $line_count"

rm $output_file