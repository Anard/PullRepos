# PullRepos
## Automatically update and build multiple GIT and/or SVN repositories

Script needs https://github.com/Anard/HelpSh to work correctly (automatically installed by install.sh script)

* Configure your repositories as specified in repos.cnf
* If necessary, write build commands for your repos in repos-scripts.cnf
* Build commands will be executed only if a binary is configured for this repository in repos.cnf

* Copy *.cnf files to /usr/local/lib/
* Copy repos-pull to /usr/local/bin/

Build instructions : type in Terminal
```
git clone https://github.com/Anard/PullRepos.git
cd PullRepos
sudo chmod +x install.sh
./install.sh
```
