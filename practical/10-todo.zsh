set -o kshglob # This option is required for line 9 to work
case $1 in
	edit)   $EDITOR ~/todo                              			       ;;
	list)   cat -n ~/todo                               			       ;;
	add)    echo ${@:2} >> ~/todo                       			       ;;
	# Entries marked with "+" are not included in "random"
	random) grep -v + ~/todo | shuf -n 1                			       ;;
	remove)							
		case $2 in 					
			(+([0-9])) sed -i $2'd' ~/todo      			       ;;
			"")        echo "Missing argument"  			       ;;
			*)         sed -i '/'$2'/d' ~/todo  			       ;;
		esac                                        			       ;;
	*)	echo "Wrong action! Possible actions: edit, list, add, random, remove" ;;
esac
