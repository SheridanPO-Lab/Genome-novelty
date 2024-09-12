#usage: sh make-ref-DB.sh <directory_where_you_download_GTDB>
mkdir background
awk '{print $2}' $1/GTDB/release95/taxonomy/gtdb_taxonomy.tsv|awk -F";" '{ for (i=1; i<=NF; i++) print $i }'|awk '{a[$1]++}END{for(i in a){print i, a[i]}}'|sed 's/ /\t/g'|sort > background/GTDB_tax.count
