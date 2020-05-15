# dotfiles

1) Install often used packages on WSL
```console
sudo apt update && sudo apt upgrade && sudo apt install npm nodejs curl wget unzip vim git python3 aria2
```

2) Install mybash 
```console
curl -L https://github.com/mooizm/dotfiles/raw/master/myBash.sh | bash
```

3) create ssh new key

```console
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

4) Install a node manager to install latest npm and nodejs
