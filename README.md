## Script Setup Linux

#### Install

1. clone this repository
2. go to the project
    ```bash
    $ cd /path/to/the/project
    ```
3. open the `installing.config` file and change the variables to the correspond
    ```bash
    $ nano installing.config
    ```
    the file must contains something like this
    ```bash
    USER='toncho'
    HOME='/home/toncho/'
    TMUX=$HOME'.tmux/'
    NAME='Alton Bell Smythe'
    EMAIL='abellsmythe@gmail.com'
    ```
4. run the script
    ```bash
    $ bash ./installing.sh
    ```

### Packages

- guake
- htop
- nmap
- software-properties-common
- speedometer
- tmux
- vim
- zsh
- tmux
    - tmux-mem-cpu-load
    - shortcuts
- cmake
- gcc
- g++
- apache2
- php5.6
- mysql
    - server
    - client
- postgresql
    - server
    - pgadmin3
- git
    - basic config
- ssh
    - openssh-client
    - openssh-server
    - generate ssh key (rsa)
- composer
- nodejs
    - symbolic link
    - node
    - npm
- gulp 

#### Author

[Alton Bell Smythe](https://abellsmythe.me)