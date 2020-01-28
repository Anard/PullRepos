#!/bin/sh
echo Installation des scripts...
if ! [ -f /usr/local/lib/help.cnf ]; then
	if [ -d HelpSh ]; then
		del=0
		cd HelpSh
		git pull
		ret=$?
		cd ..
	else
		del=1
		git clone https://github.com/Anard/HelpSh.git
		ret=$?
	fi
	if [ $ret -gt 0 ]; then 
		echo "Une erreur est survenue lors du clonage de HelpSh"
		exit $ret
	fi
	sudo cp HelpSh/*.cnf /usr/local/lib/
	ret=$?
	if [ $ret -gt 0 ]; then
		echo "Une erreur est survenue lors de la copie des fichiers de configuration"
		exit $ret
	fi
else del=0
fi
if ! [ -f /usr/local/lib/repos.cnf ]; then
	sudo cp *.cnf /usr/local/lib
	sudo chmod +r /usr/local/lib/repos*.cnf /usr/local/lib/help.cnf 
	ret=$?
	if [ $ret -gt 0 ]; then
		echo "Une erreur est survenue lors de la copie des fichiers de configuration"
		exit $ret
	fi
fi
if [ $del -gt 0 ]; then
	sudo rm -r HelpSh
fi
sudo cp repos-pull /usr/local/bin
sudo chmod +x /usr/local/bin/repos-pull
echo "Installation terminée"

exit 0