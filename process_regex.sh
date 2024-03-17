# UNTESTED !!
# evaluation de regex

# ce script va évaluer une regex donnée via un ficher csv récupéré depuis Moodle

# arguments donnés au script


# 1 - colonne du csv dans laquelle se trouve la regex à tester
# 2 - nom du fichier test


# paramètres dans le fichier regex_check.conf

# - corrf: nom du dossier contenant les sorties attendues
# rem: doit avoir le même nom que le fichier test
# - namecol: colonne du csv dans laquelle se trouve le nom de l'étudiant
# - inputfn: input filename (Moodle-generated)

set +x


col=$1
fntest=$2

configfile=regex_check.conf
if ! [ -f $configfile ]; then
    echo " Error, file $configfile missing!"
    exit 1
fi
    
source $configfile

echo "PRINT PARAMS"
echo "namecol=$namecol"
echo "corrf=$corrf"
echo "inputfn=$inputfn"


RED='\033[1;31m'
GR='\033[1;32m'
NC='\033[0m'

function trait()
{
	reg=$1
	fich=$2
	
	if [ ${#reg} == 0 ]
	then
		echo "regex empty!"
	else
		echo "regex=$reg"
		echo "regex result:"
		grep -P "$reg" $fich
		n=$(grep -P "$reg" $fich | wc -l)
		echo "nb found=$n"
	fi
}

while IFS=";" read -ra tab
do
#	id=${tab[8]}
	name=${tab[namecol]}  
	echo -e "\n${RED}name=$name${NC}"

	echo -e "${GR}q2.1: nombres${NC}"
	regex=${tab[col]}" $fntest

	if [ ${#reg} == 0 ]
	then
		echo "regex empty!"
	else
		echo "regex=$reg"
		echo "regex result:"
		grep -P "$regex" $fntest
		n=$(grep -P "$regex" $fntest | wc -l)
		echo "nb found=$n"
	fi
		
done < $input



