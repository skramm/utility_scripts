# WIP
# input arg: pdf data file as exported with
# pdftk file.odf dump_data_fields > file.txt

c=0
outfile=out.csv

if [ -f $outfile ]; then rm $outfile; fi


function reset()
{
	echo "reset c=$c fname=-$fname-"
	if ! [ "$fname" = "" ]
	then
		((c+=1))
		echo "$c;$fname;$fvalue" >>$outfile
	fi
}

while read IN
do
	line=(${IN//:/ })
	echo "line 0=${line[0]} line 1=${line[1]}"
	if [ "${line[0]}" = "---" ]
	then
		reset
	else
		if [ "${line[0]}" = "FieldName:" ]
		then
			fname=${line[1]}
		fi
		if [ "${line[0]}" = "FieldValue:" ]
		then
			fvalue=${line[1]}
		fi
		echo "fname=$fname fvalue=$fvalue"
	fi
	
done < tmp1
