#usage:         sh MAG_Nov_tree.sh <input>
#example:       sh MAG_Nov_tree.sh Example.input

##Make csv file from input
sed 's/\t/,/g' $1|sed 's/;/,/g'| sed 's/ /,/g'| awk -F"," '{print $2","$3","$4","$5","$6","$7","$8","$1}'|grep d__ > tax.csv
sed -i 's/^/Life,/g' tax.csv

##Make newick tree from csv file.
python background/csv2Newick.py > tax.nwk
##Make all branches length 1
sed 's/,/:1,/g' tax.nwk|tr ")" "#"|sed "s/#/:1#/g"|tr "#" ")" > tax.bl.nwk

##convert all columns in both ref and query tabs to single line
awk -F"," '{ for (i=1; i<=NF; i++) print $i }' tax.csv > tax.sc


##Count all words in both files
awk '{a[$1]++}END{for(i in a){print i, a[i]}}' tax.sc|sort > tax.count
sed -i 's/ /\t/g' tax.count

##Add counts from each word in both files and calc the percentage of the total that is from query file
#join background/GTDB_tax.count tax.count|sed 's/ /\t/g' > tax.sum
awk 'NR==FNR{a[$1]=$1"\t"$2; next} ($1 in a){print a[$1]"\t"$2}' background/R207v2_GTDB_tax.count tax.count > tax.sum
awk '{print $1"\t"($3/($2 + $3)*100)}' tax.sum > tax.novelty
awk '{print $1"\t"$2"\t"$3"\t"($2 + $3)"\t"($3/($2 + $3)*100)}' tax.sum > tax.novelty.stats
sed  '1i Taxon #_of_Ref_genome #_of_New_gen #_of_Total_genomes' tax.novelty.stats|sed 's/ /\t/g' > tmp
mv tmp tax.novelty.stats
#rm tax.sum tax.sc tax.count tax.nwk tax.csv

##replace "word" with "word" + [ + "query % of total" + ]

#echo "sed '" > tax.replace.sh| sed 's~^~s/~g' tax.novelty|sed 's~$~/g~g'|sed 's~\t~/~g' >> tax.replace.sh
echo "sed '" > tax.replace.sh| sed 's~^~s/~g' tax.novelty|sed 's~$~:/g~g'|sed 's~\t~:/~g' >> tax.replace.sh
echo "' tax.bl.nwk > tax.novelty.nwk" >> tax.replace.sh
sh tax.replace.sh
rm tax.replace.sh tax.novelty

sed 's/s__/100/g' tax.novelty.nwk|sed 's/g__/100/g'|sed 's/f__/100/g'|sed 's/o__/100/g'|sed 's/c__/100/g'|sed 's/p__/100/g' > tmp
mv tmp tax.novelty.nwk

awk '$5 >= 50' tax.novelty.stats |awk -F "__" '{print $1}'|awk '{a[$1]++}END{for(i in a){print i, a[i]}}'|sed 's/ /\t/g' > tax.novelty.50pcNovelty
awk '$5 >= 75' tax.novelty.stats |awk -F "__" '{print $1}'|awk '{a[$1]++}END{for(i in a){print i, a[i]}}'|sed 's/ /\t/g' > tax.novelty.75pcNovelty
