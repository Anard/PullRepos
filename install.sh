#!/bin/sh
echo Installation du script
sudo cp *.cnf /usr/local/lib
sudo cp repos-pull /usr/local/bin
sudo chmod +x /usr/local/bin/repos-pull
echo Installation terminée