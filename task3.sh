awk -F',' 'NR > 1 && $3 == 2 && substr($13, 1, 1) == "S" { print }' titanic.csv |  # Skip header, filter 2nd class & Southampton
sed 's/,male/,M/; s/,female/,F/' |             # Replace gender labels
awk -F',' '{ if ($7 != "") { total += $7; count++ } }
           END { if (count > 0) print "Average Age is", total / count; 
                 else print "Average Age is N/A" }'  # Calculate average age
