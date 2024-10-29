awk -F',' 'NR > 1 && $3 == 2 && substr($13, 1, 1) == "S" { print }' titanic.csv |  # Skip header, filter 2nd class & Southampton
sed 's/,female/,F/; s/,male/,M/' |             
awk -F',' '{ if ($7 != "") { total += $7; count++ } print $0 }
           END { if (count > 0) print "Average Age is", total / count; 
                 else print "Average Age is N/A" }'  # Calculate average age
