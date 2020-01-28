#!/bin/sh
echo Installation des scripts...
if [ -d HelpSh ]; then
	del=0
	cd HelpSh
	git pull
	ret=$?
	if [ $ret -gt 0 ]; then exit $ret; fi
else
	del=1
	git clone https://github.com/Anard/HelpSh.git
	ret=$?
	if [ $ret -gt 0 ]; then 
		echo "Une erreur est survenue lors du clonage de HelpSh"
		exit $ret
	fi
fi
sudo cp *.cnf HelpSh/*.cnf /usr/local/lib
sudo chmod +r /usr/local/lib/repos*.cnf /usr/local/lib/help.cnf 
ret=$?
if [ $ret -gt 0 ]; then
	echo "Une erreur est survenue lors de la copie des fichiers de configuration"
	exit $ret
fi
if [ $del -gt 0 ]; then
	sudo rm -r HelpSh
fi
sudo cp repos-pull /usr/local/bin
sudo chmod +x /usr/local/bin/repos-pull
echo Installation terminée

exit 0