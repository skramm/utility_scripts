# show what tex files uses what images, and wich ones are not used
# WIP !!
# S. Kramm - 2023/11
# input: folder name where the *.tex files are stored
# source: https://github.com/skramm/utility_scripts

set +x

if [ -z $1 ]; then
	echo "Error, missing folder name, exiting..."
	exit 1
fi
folder=$1

if ! [ -e $folder ]
then
	echo "Error, folder \"$folder\" does not exist in current location, exiting..."
	exit 1
fi


find $folder/ -iname "*.png" > /tmp/imglist
find $folder/ -iname "*.jpg" >> /tmp/imglist
find $folder/ -iname "*.jpeg" >> /tmp/imglist

cimg=0
#nbim=$(wc -l /tmp/imglist)
nbim=$(wc -l < /tmp/imglist)

nbimnu=0
echo "start, found $nbim images to search for"
while read -r imgfn
do
	img2=$(basename $imgfn)
	img="${img2%.*}"
#	echo "processing image '$img2'"
	notfound=1
	for fn in $folder/src/*.tex*
	do
		grep "$img" "$fn" >/dev/null
		rv=$?
		if [ $rv = 0 ]; then
			notfound=0
		fi
	done
	
	if [ $notfound = 1 ]; then
#		echo "image $img not used !"
		tabimg[$cimg]=0
		tabunused[$nbimnu]=$img2
		((nbimnu++))
		
	else
		((tabimg[$cimg]++))
	fi
	((cimg++))
done < /tmp/imglist

echo "** RESULTS **"
echo " -total: $nbim images"
echo " -nb unused=$nbimnu :"
for i in "${tabunused[@]}"	
do
	echo "  -$i"
done

rm /tmp/imglist
