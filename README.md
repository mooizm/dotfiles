# dotfiles

1) Install mybash 
```console
user@cli: curl -L https://github.com/mooizm/dotfiles/raw/master/myBash.sh | bash
```

2) Install often used packages on WSL
```console
user@cli: sudo apt update && sudo apt upgrade && sudo apt install npm nodejs mariadb-server curl wget unzip vim git postgresql postgresql-client apache2 php python3
```
3) create ssh new key

```console
user@cli: ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

4) Install a node manager to install latest npm and nodejs

