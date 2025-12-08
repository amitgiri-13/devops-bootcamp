# CLI-Fundamentals.md

## Text Processing

1. **grep** Search Tool
```bash
grep "pattern" file            #Search for a pattern
grep -i "pattern" file         #Case-insensitive search
grep -v "pattern" file         #Show lines NOT matching
grep -r "pattern" dir/         #Recursive search
grep -n "pattern" file         #Show line numbers
grep -c "pattern" file         #Count matches
grep -w "word" file            #Match whole word
grep -E "regex" file           #Extended regex (egrep)
grep -A 3 "pattern" file       #Show 3 lines after match
grep -B 3 "pattern" file       #Show lines before match
grep -C 3 "pattern" file       #Show 3 lines around match
grep -q "pattern" file         #Quite mode
```

2. **sed** Stream Editor
```bash
sed 's/old/new/' file                   #Replace first occurrence per line
sed 's/old/new/g' file                  #Replace globally in line
sed -i 's/old/new/g' file               #Replace in file (in-place)

sed '/pattern/d' file                   #Delete lines with pattern

# Addressing
sed '1s/old/new/' file                  #Replace only in line 1
sed '1,5d' file                         #Delete lines 1 to 5
sed -n '5p' file                        #Print only line 5
sed -n '/start/,/end/p' file            #Print range between patterns
sed 's/[0-9]//g' file                   #Remove all digits
sed 's/^/# /' file                      # Add # at start of every line
```

3. **gawk** Advanced Processing
```bash
gawk '{print $1}' file                     # Print first column
gawk '{print $1, $3}' file                 # Print multiple columns
gawk -F ":" '{print $1}' /etc/passwd       # Set field separator
gawk 'NR==2' file                          # Print second row
gawk '/pattern/ {print}' file              # Print lines matching a pattern
gawk 'NR>1 {print $2}' file                # Skip header (start from line 2)
gawk '{sum += $2} END {print sum}' file    # Sum values in 2nd column
gawk '{if ($3 > 50) print $1, $3}' file    # Conditional print
gawk 'BEGIN {print "Start"} {print} END {print "End"}' file  # BEGIN + END blocks
````

4. **sort** Command
```bash
sort file.txt                               # Sort alphabetically
sort -n file.txt                            # Numeric sort
sort -r file.txt                            # Reverse (descending) sort
sort -k 2 file.txt                          # Sort by 2nd column (text)
sort -k 2n file.txt                         # Sort by 2nd column (numeric)
sort -u file.txt                            # Remove duplicates (unique sort)
sort -f file.txt                            # Case-insensitive sort
sort -h file.txt                            # Sort human-readable sizes (1K, 2M, 3G)
sort -t ":" -k 3n file.txt                  # Custom delimiter (sort by 3rd field)
sort -c file.txt                            # Check if file is sorted
sort file.txt -o sorted.txt                 # Save sorted output to a file
sort -V versions.txt                        # Natural version sorting (v1 < v2 < v10)
sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n ips.txt   # Sort IP addresses
```

5. **wc** Command
```bash
wc file.txt                                 # Show lines, words, and bytes
wc -l file.txt                              # Show only line count
wc -w file.txt                              # Show only word count
wc -c file.txt                              # Show only byte count
wc -m file.txt                              # Show only character count
wc -L file.txt                              # Show length of the longest line
```

6. **uniq** Command
```bash
uniq file.txt                               # Remove consecutive duplicates
uniq -c file.txt                            # Count occurrences of each line
uniq -d file.txt                            # Show only duplicate lines
uniq -u file.txt                            # Show only unique lines
sort file.txt | uniq                         # Remove all duplicates (unsorted input needs sort)
```

7. **strings** Command
```bash
strings binaryfile                          # Show printable strings from a binary
strings -n 4 binaryfile                      # Show strings of minimum length 4
strings binaryfile | less                    # View strings with pager
```

8. **cut** Command
```bash
cut -c 1-5 file.txt                          # Extract characters 1 to 5
cut -c 1,3,5 file.txt                        # Extract characters 1, 3, and 5
cut -f 1 file.txt                             # Extract first tab-delimited field
cut -f 1,3 file.txt                           # Extract first and third fields
cut -d ":" -f 1 /etc/passwd                   # Extract first field using ":" delimiter
cut -d "," -f 2 file.csv                      # Extract second column from CSV
```

---