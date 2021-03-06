echo "Разработчик: Лопатко Иван"
echo  "Программа-навигатор по файловой системе" 
agree="y"
while [[ "$agree" = "y" ]] 
do
	echo 'введите 1, если хотите увидеть текущий каталог'
	echo 'введите 2, если хотите подняться на каталог выше'
	echo 'введите 3, если хотите перейти в каталог'
	read item
	case "$item" in
		1) 	echo "Текущий каталог:"
			pwd;;
		2) 	cd ..;;
		3) 	echo "Доступные каталоги:"
			ls -l| tr -s ' ' ' '|grep '^d'|cut -f9 -d' '
			echo "Введите каталог в который хотите перейти"
			read dir

			if [[ !  -d "$dir" ]]
		#	wrong="$(ls -l| tr -s ' ' ' '|grep '^d'|cut -f9 -d' '|grep "$dir")
		#	if  [[ "$wrong" = "" ]]
			then
				echo "Вы ввели неправильное имя каталога"
			else
				cd "$dir"
			fi;;
	esac
	echo "Хотите продолжить работу с программой? [y/n]"
	read agree
done
exit 0
