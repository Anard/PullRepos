#!/bin/sh
configPath="/usr/local/lib"
scriptPath="/usr/local/bin"

echo "Récupération et installation du dépôt HelpSh"
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
sudo cp HelpSh/*.cnf ${configPath}/
ret=$?
if [ $ret -gt 0 ]; then
	echo "Une erreur est survenue lors de la copie des fichiers de configuration"
	exit $ret
fi

echo "Installation de PullRepos"
if ! [ -f ${configPath}/repos.cnf ]; then
	sudo cp *.cnf ${configPath}/
	sudo chmod +r ${configPath}/repos*.cnf ${configPath}/help.cnf 
	ret=$?
	if [ $ret -gt 0 ]; then
		echo "Une erreur est survenue lors de la copie des fichiers de configuration"
		exit $ret
	fi
fi

if [ $del -gt 0 ]; then
	sudo rm -r HelpSh
fi
sudo cp repos-pull ${scriptPath}/
sudo chmod +x ${scriptPath}/repos-pull
echo "Installation terminée"
echo "Configurez ${configPath}/repos.cnf et ${configPath}/repos-scripts.cnf pour vos dépôts"
echo "Utilisez repos-pull -h pour plus d'informations"

exit 0
