files=(alias color completion prompt command)
for file in $files; do
  source $HOME/.zsh/$file.zsh
done

RUBIES+=(
  /.rubies
)

if [ -d /usr/local/opt/chruby ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PGDATA=/usr/local/var/postgres

export PATH=$PATH:$HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$HOME/bin/cs:$PATH
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:~/bin
export PATH=$PATH:$HOME/dev/aws/.terraform
export PATH=$HOME/.nodebrew/current/bin:$PATH
export GOROOT=/usr/local/Cellar/go/1.5.2/libexec
if [ -x `which nodebrew` ]; then
  export PATH=$PATH:$HOME/.nodebrew/current/bin
  export NODE_PATH=`npm root -g`
fi
