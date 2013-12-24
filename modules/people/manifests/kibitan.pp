## in MacAPP
# witch
# popclip
# Dash
# line
# iphoto
# imovie
# janetter

## idont know how to install in boxen
# lita (sqlite GUI) - its adobe AIR program

class people::kibitan {
  include chrome

  include dropbox
  include evernote
  include skype

  include keyremap4macbook
  include keyremap4macbook::login_item
  
  include istatmenus3
  include clipmenu
  
  include alfred
  # include libreoffice
  # class { 'libreoffice::languagepack':
  #   locale => 'ja'
  # }

  # include things
  # include shortcat
  # include licecap
  # include flux

  package {
    'Mou':
      source   => "http://mouapp.com/download/Mou.zip",
      provider => compressed_app;
    'GoogleJapaneseInput':
      source => "http://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg",
      provider => pkgdmg;
    ## file size exploler
    'Disk Inventory X':
      source => "http://www.alice-dsl.net/tjark.derlien/DIX1.0Universal.dmg",
      provider => appdmg;
    'MysqlWorkbench':
      source => "http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.0.8-osx-i686.dmg",
      provider => appdmg;
  }

  # for dev  
  # packages
  include chrome::canary
  include iterm2::stable
  include sublime_text_2
  # sublime_text_2::package { 'Emmet':
  #   source => 'sergeche/emmet-sublime'
  # }

  package {
    'Kobito':
      source   => "http://kobito.qiita.com/download/Kobito_v1.8.2.zip",
      provider => compressed_app;
    'SQLite Database Browser':
      source   => "http://downloads.sourceforge.net/project/sqlitebrowser/sqlitebrowser/2.0%20beta1/sqlitebrowser_200_b1_osx.zip",
      provider => compressed_app;
    ## or using lita http://www.dehats.com/drupal/?q=node/58
    # 'nitrous.io':
    #   source   => "https://www.nitrous.io/mac/Nitrous-Mac-Latest.zip"
    #   provider => compressed_app;
    'hoster':
      source  => "http://www.redwinder.com/macapp/hoster/tmp/Hoster1.208.zip",
      provider => compressed_pkg;
  }

  package {
    [
      'tmux',
      'tig',
      'wget',
      'watch',
      'tree',
      'colordiff',
      'jq',
    ]:
  }

  ruby::plugin { "rbenv-binstubs":
    ensure => '1.3',
    source => "ianheggie/rbenv-binstubs"
  }

  ruby::plugin { 'rbenv-vars':
    ensure => 'v1.2.0',
    source  => 'sstephenson/rbenv-vars'
  }

  nodejs::module { 'ungit':
    node_version => 'v0.10'
  }
  nodejs::module { 'bower':
    node_version => 'v0.10'
  }
  nodejs::module { 'grunt-cli':
    node_version => 'v0.10'
  }

  include sourcetree
  include imagemagick
  include memcached
  # include memcached::lib # it cause error now in marverics. 2013/11/11
  include sequel_pro
  include cyberduck

  include mysql
  mysql::db { 'mydb': }

  ## See also about port, and rails setting.
  # https://github.com/boxen/puppet-mysql

  include vagrant
  include virtualbox
  # include packer

  ## install programming font 'Ricty'
  homebrew::tap { 'sanemat/font': }
  package { 'ricty': }

  info "--it needs by yourself"
  info "cp -f /opt/boxen/homebrew/Cellar/ricty/3.2.2/share/fonts/Ricty*.ttf ~/Library/Fonts/"
  info "fc-cache -vf;"
  # exec { "setup ricty":
  #   command => "cp -f /opt/boxen/homebrew/Cellar/ricty/3.2.2/share/fonts/Ricty*.ttf ~/Library/Fonts/; fc-cache -vf;"
  # }
}
