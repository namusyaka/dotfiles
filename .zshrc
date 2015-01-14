files=(alias color completion prompt)
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

export PATH=$PATH:$HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$HOME/bin/cs:$PATH
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export NODE_PATH=`npm root -g`
