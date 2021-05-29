set -o kshglob
case $1 in
	edit)   $EDITOR ~/todo                              ;;
	list)   cat -n ~/todo                               ;;
	add)    echo ${@:2} >> ~/todo                       ;;
	random) grep -v + ~/todo | shuf -n 1                ;;
	remove)
		case $2 in
			(+([0-9])) sed -i $2'd' ~/todo      ;;
			"")        echo "Missing argument"  ;;
			*)         sed -i '/'$2'/d' ~/todo  ;;
		esac                                        ;;
esac
