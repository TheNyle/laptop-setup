function checkWget {
  if ! [ -x "$(command -v wget)" ]; then
    echo "Installing wget..."
    brew install wget
  fi
}

# Show hidden files in MacOS

echo $'\n----------------------------------------------------------------\n'
echo "Would you like to see hidden files in Finder? [y] or [n]"
read IFSHOWHIDDEN
  case $IFSHOWHIDDEN in
    [Yy]* ) 
      echo "Revealing hidden files..."
      defaults write com.apple.finder AppleShowAllFiles YES
      echo "Restarting Finder..."
      killall Finder
      ;;
    [Nn]* ) 
      echo "Skipping..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Accept XCode License

echo $'\n----------------------------------------------------------------\n'
echo "Before doing anything, you must accept the XCode license."
echo "Would you like to accept the XCode license? [y] or [n]"
read IFXCODE
  case $IFXCODE in
    [Yy]* ) 
      echo "Running XCode License..."
      sudo xcodebuild -license accept
      ;;
    [Nn]* ) 
      echo "Unfortunately, this script cannot continue without the license... Sorry!"
      exit
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac

  
# Install Git
echo $'\n----------------------------------------------------------------\n'
echo "Checking Git Version..."
git --version


# Install Git aliases
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Git aliases? [y] or [n]"
read IFGITALIASES
  case $IFGITALIASES in
    [Yy]* ) 
      echo "Installing Git Aliases..."
      git config --global alias.co checkout
      git config --global alias.st status
      ;;
    [Nn]* ) 
      echo "Skipping Git Aliases..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Homebrew
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Homebrew? [y] or [n]"
read IFHOMEBREW
  case $IFHOMEBREW in
    [Yy]* ) 
      echo "Installing Homebrew..."
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew -v
      ;;
    [Nn]* ) 
      echo "Skipping Homebrew..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install zsh
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install zsh? [y] or [n]"
read IFZSH
  case $IFZSH in
    [Yy]* ) 
      echo "Installing zsh..."
      brew install zsh zsh-completions
      chsh -s /bin/zsh
      zsh --version
      echo $'Installing oh-my-zsh...\n'
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
      echo "Check out the available themes here: https://github.com/robbyrussell/oh-my-zsh/wiki/Themes"
      ;;
    [Nn]* ) 
      echo "Skipping zsh..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install NVM
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install NVM (Node Version Manager)? [y] or [n]"
read IFNVM
  case $IFNVM in
    [Yy]* ) 
      echo $'Installing NVM (Node Version Manager)...\n'
      curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

      echo $'Installed version of NVM (Node Version Manager) is...\n'
      nvm --version

      echo "Installing latest LTS (Long Term Support) version of Node..."
      nvm install --lts
      echo "Installing current version of Node..."
      nvm install 8.16.1
      echo "Using current version of Node..."
      nvm use 8.16.1
      ;;
    [Nn]* ) 
      echo "Skipping NVM (Node Version Manager)..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Azure CLI
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Azure CLI? [y] or [n]"
read IFAZURECLI
  case $IFAZURECLI in
    [Yy]* ) 
      echo $'Installing Azure CLI...\n'
      brew install azure-cli

      echo $'Installed version of Azure CLI is...\n'
      az --version
      ;;
    [Nn]* ) 
      echo "Skipping Azure CLI..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Powershell Core
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Powershell Core? [y] or [n]"
read IFPOWERSHELL
  case $IFPOWERSHELL in
    [Yy]* ) 
      echo $'Installing Powershell Core...\n'
      brew cask install powershell


      echo $'Installed version of Powershell Core is...\n'
      pwsh --version
      ;;
    [Nn]* ) 
      echo "Skipping Powershell Core..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac

# Install Visual Studio Code
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Visual Studio Code? [y] or [n]"
read IFVSCODE
  case $IFVSCODE in
    [Yy]* ) 
      echo "Installing Visual Studio Code..."
      FILENAME=vscode.zip
      FILEURI=https://go.microsoft.com/fwlink/?LinkID=620882

      checkWget
      wget -O $FILENAME $FILEURI
      unzip $FILENAME
      mv ./Visual\ Studio\ Code.app /Applications

      echo "Adding code alias to zsh..."
      alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

      echo "Installing Visual Studio Code Extensions..."
      code --install-extension waderyan.gitblame
      code --install-extension dbaeumer.vscode-eslint
      code --install-extension eamodio.gitlens
      code --install-extension fabiospampinato.vscode-todo-plus
      code --install-extension jmrog.vscode-nuget-package-manager
      code --install-extension k--kato.intellij-idea-keybindings
      code --install-extension mikestead.dotenv
      code --install-extension ms-azuretools.vscode-docker
      code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
      code --install-extension ms-mssql.mssql
      code --install-extension ms-vscode.azure-account
      code --install-extension ms-vscode.azurecli
      code --install-extension ms-vscode.cpptools
      code --install-extension ms-vscode.csharp
      code --install-extension ms-vscode.powershell
      code --install-extension msazurermtools.azurerm-vscode-tools
      code --install-extension msjsdiag.debugger-for-chrome
      code --install-extension Orta.vscode-jest
      code --install-extension redhat.vscode-yaml
      code --install-extension shd101wyy.markdown-preview-enhanced

      echo "Installing Visual Studio Code Keybindings"
      cp ./configurations/vscode/keybindings.json ~/Library/Application Support/Code/User

      echo "Installing Visual Studio Code Settings"
      cp ./configurations/vscode/settings.json ~/Library/Application Support/Code/User

      echo "Cleaning up installation files"
      rm $FILENAME
      ;;
    [Nn]* ) 
      echo "Skipping Visual Studio Code..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Postman
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Postman? [y] or [n]"
read IFPOSTMAN
  case $IFPOSTMAN in
    [Yy]* ) 
      echo "Installing Postman..."
      FILENAME=postman.zip
      FILEURI=https://dl.pstmn.io/download/latest/osx

      checkWget
      wget -O $FILENAME $FILEURI
      unzip $FILENAME
      mv ./Postman.app /Applications
      ;;
    [Nn]* ) 
      echo "Skipping Postman..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# ------ Manual Installations -------#
echo $'\n----------------------------------------------------------------\n'

echo "The following tools require a .dmg file to be mounted, so the next steps will take you to a download page for the tool..."

echo $'\n----------------------------------------------------------------\n'


# Install Docker
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Docker? [y] or [n]"
read IFDOCKER
  case $IFDOCKER in
    [Yy]* ) 
      echo "Opening Docker Installation page..."
      python -mwebbrowser https://docs.docker.com/docker-for-mac/install/
      ;;
    [Nn]* ) 
      echo "Skipping Docker..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Google Chrome
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Google Chrome? [y] or [n]"
read IFCHROME
  case $IFCHROME in
    [Yy]* ) 
      echo "Opening Google Chrome Installation page..."
      python -mwebbrowser https://support.google.com/chrome/answer/95346?co=GENIE.Platform%3DDesktop&hl=en
      ;;
    [Nn]* ) 
      echo "Skipping Google Chrome..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Firefox
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Firefox? [y] or [n]"
read IFFIREFOX
  case $IFFIREFOX in
    [Yy]* ) 
      echo "Opening Firefox Installation page..."
      python -mwebbrowser https://www.mozilla.org/en-GB/firefox/new/
      ;;
    [Nn]* ) 
      echo "Skipping Firefox..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Azure Data Studio
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Azure Data Studio? [y] or [n]"
read IFDATASTUDIO
  case $IFDATASTUDIO in
    [Yy]* ) 
      echo "Opening Azure Data Studio Installation page..."
      python -mwebbrowser https://docs.microsoft.com/en-us/sql/azure-data-studio/download?view=sql-server-2017#get-azure-data-studio-for-macos
      ;;
    [Nn]* ) 
      echo "Skipping Azure Data Studio..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Azure Storage Explorer
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Azure Storage Explorer? [y] or [n]"
read IFSTORAGEEXPLORER
  case $IFSTORAGEEXPLORER in
    [Yy]* ) 
      echo "Opening Azure Storage Explorer Installation page..."
      python -mwebbrowser https://azure.microsoft.com/en-gb/features/storage-explorer/
      ;;
    [Nn]* ) 
      echo "Skipping Azure Storage Explorer..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install MySQL Workbench
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install MySQL Workbench? [y] or [n]"
read IFMYSQLWORKBENCH
  case $IFMYSQLWORKBENCH in
    [Yy]* ) 
      echo "Opening MySQL Workbench Installation page..."
      python -mwebbrowser https://dev.mysql.com/downloads/workbench/
      ;;
    [Nn]* ) 
      echo "Skipping MySQL Workbench..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Charles Proxy
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Charles Proxy? [y] or [n]"
read IFCHARLES
  case $IFCHARLES in
    [Yy]* ) 
      echo "Opening Charles Proxy Installation page..."
      python -mwebbrowser https://www.charlesproxy.com/download/
      ;;
    [Nn]* ) 
      echo "Skipping Charles Proxy..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Slack
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Slack? [y] or [n]"
read IFSLACK
  case $IFSLACK in
    [Yy]* ) 
      echo "Opening Slack Installation page..."
      python -mwebbrowser https://slack.com/intl/en-gb/downloads/mac
      ;;
    [Nn]* ) 
      echo "Skipping Slack..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Draw.io
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Draw.io? [y] or [n]"
read IFDRAWIO
  case $IFDRAWIO in
    [Yy]* ) 
      echo "Opening Draw.io Installation page..."
      python -mwebbrowser https://about.draw.io/integrations/\#integrations_offline
      ;;
    [Nn]* ) 
      echo "Skipping Draw.io..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Abstract
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Abstract? [y] or [n]"
read IFABSTRACT
  case $IFABSTRACT in
    [Yy]* ) 
      echo "Opening Abstract Installation page..."
      python -mwebbrowser https://app.abstract.com/download
      ;;
    [Nn]* ) 
      echo "Skipping Abstract..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Dropbox
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Dropbox? [y] or [n]"
read IFDROPBOX
  case $IFDROPBOX in
    [Yy]* ) 
      echo "Opening Dropbox Installation page..."
      python -mwebbrowser https://www.dropbox.com/en_GB/install
      ;;
    [Nn]* ) 
      echo "Skipping Dropbox..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


# Install Spotify
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Spotify? [y] or [n]"
read IFSPOTIFY
  case $IFSPOTIFY in
    [Yy]* ) 
      echo "Opening Spotify Installation page..."
      python -mwebbrowser https://www.spotify.com/uk/download/other/
      ;;
    [Nn]* ) 
      echo "Skipping Spotify..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac

# Install Whatsapp
echo $'\n----------------------------------------------------------------\n'
echo "Would you like to install Whatsapp? [y] or [n]"
read IFWHATSAPP
  case $IFWHATSAPP in
    [Yy]* ) 
      echo "Opening Whatsapp Installation page..."
      python -mwebbrowser https://www.whatsapp.com/download/
      ;;
    [Nn]* ) 
      echo "Skipping Whatsapp..."
      ;;
    * ) 
      echo "Please enter [y] or [n]."
      ;;
  esac


echo $'\n----------------------------------------------------------------\n'
echo "Installation complete. If you would like to add anything to this list, please open a PR!"