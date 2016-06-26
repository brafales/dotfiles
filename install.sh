#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

#TODO: Remove this, only here to test stuff
rm -rf $DOTFILES

clone_repo()
{
  command -v git >/dev/null 2>&1 || { echo >&2 "Cannot find git command, make sure it's installed"; exit 1; }
  echo "Cloning git repo..."
  git clone https://github.com/brafales/dotfiles.git $DOTFILES
}

symlink_file()
{
  file_name=`basename $1`
  target_path="$HOME/.$file_name"

  if [ -f $target_path ]; then
    echo "File $target_path exists, moving to $target_path.backup"
    mv $target_path "$target_path.backup"
  fi

  echo "Symlinking $target_path"
  ln -sfn $1 $target_path
}

setup_zsh()
{
  echo "Setting up zsh..."
  files=("$DOTFILES/zsh/zshrc" "$DOTFILES/zsh/zlogin")
  for var in "${files[@]}"
  do
    symlink_file $var
  done
}

setup_lein()
{
  echo "Setting up lein..."
  lein_folder="$HOME/.lein"
  files=("$DOTFILES/lein/profiles.clj")
  mkdir $lein_folder
  for var in "${files[@]}"
  do
    file_name=`basename $var`
    ln -sfn $var "$lein_folder/$file_name"
  done

}
setup_misc_dotfiles()
{
  echo "Setting up misc dotfiles..."
  files=("$DOTFILES/ctags/ctags" "$DOTFILES/ghc/ghci" "$DOTFILES/git/gitconfig" "$DOTFILES/ruby/gemrc" "$DOTFILES/ruby/irbrc" "$DOTFILES/ruby/pryrc")
  for var in "${files[@]}"
  do
    symlink_file $var
  done
}

install_rvm()
{
  echo "Installing/updating rvm..."
  command -v gpg >/dev/null 2>&1 || { echo >&2 "Cannot find gpg command, make sure it's installed"; exit 1; }
  #From https://rvm.io
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable

  #Binstubs
  chmod +x $rvm_path/hooks/after_cd_bundler
}

install_oh_my_zsh()
{
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

setup_vim()
{
  echo "Setting up vim..."
  vim_folder="$HOME/.vim"
  if [ -d $vim_folder ]; then
    rm -rf $vim_folder
  fi

  #Install vundler
  vundle_path="$vim_folder/bundle/Vundle.vim"
  mkdir -p "$vim_folder/bundle"
  git clone https://github.com/gmarik/vundle.git $vundle_path

  symlink_file $DOTFILES/vim/vimrc

  #Credit to https://github.com/skwp/dotfiles
  vim --noplugin -u "$DOTFILES/vim/vundles.vim" -N \"+set hidden\" \"+syntax on\" +BundleClean +BundleInstall! +qall
}

install()
{
  if [ -d $DOTFILES ]; then
    if  [ "$1" = "-f" ]; then
      rm -rf $DOTFILES
    else
      echo "Dotfiles are already installed. Run with '-f' or delete $DOTFILES folder"
      exit
    fi
  fi
  echo "Installing dotfiles!"
  clone_repo
  install_rvm
  install_oh_my_zsh
  setup_zsh
  setup_vim
  setup_lein
  setup_misc_dotfiles
}

install $1
