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
# The SQLite Sorcerer - my SQLite admin tool http://afoucal.free.fr/index.php/applications/sqlite-sorcerer/

class people::ctokoro {
  include chrome

  include dropbox
  include evernote
  include skype

  include keyremap4macbook
  include keyremap4macbook::login_item
  
  include istatmenus4
  include clipmenu
  
  # include alfred
  # include libreoffice
  # class { 'libreoffice::languagepack':
  #   locale => 'ja'
  # }

  # include things
  # include shortcat
  # include licecap
  # include flux

  # https://github.com/boxen/puppet-boxen/tree/master/lib/puppet/provider/package
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
    'VLC media player':
      source => "http://free.nchc.org.tw/vlc/vlc/2.1.2/macosx/vlc-2.1.2.dmg",
      provider => appdmg;
    'Mac Linux USB Loader':
      source => "http://sevenbits.github.com/downloads/Mac-Linux-USB-Loader.zip",
      provider => compressed_app;
    ## なんかエラる。。
    # 'Send to Kindle':
    #   source => 'http://s3.amazonaws.com/sendtokindle/SendToKindleForMac-installer-v1.0.0.218.pkg',
    #   provider => pkgdmg;
    '1password':
      source => "https://d13itkw33a7sus.cloudfront.net/dist/1P/mac4/1Password-4.1.3.zip",
      provider => compressed_app;
    'picasa':
      source => "https://dl.google.com/photos/picasamac39.dmg",
      provider => appdmg;
    ## なんかエラる。。
    # 'GUI pow Anvi':
    #   source => "http://s3.amazonaws.com/sparkler_versions/versions/uploads/000/000/099/original/Anvil.app.zip?1377359559",
    #   provider => compressed_app;
    'flowdock':
      source => 'https://flowdock-resources.s3.amazonaws.com/mac/Flowdock.zip',
      provider => compressed_app;
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
    'nitrous.io':
      source   => "https://www.nitrous.io/mac/Nitrous-Mac-Latest.zip",
      provider => compressed_app;
    'hoster':
      source  => "http://www.redwinder.com/macapp/hoster/tmp/Hoster1.208.zip",
      provider => compressed_pkg;
    'MysqlWorkbench':
      source => "http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.0.8-osx-i686.dmg",
      provider => appdmg;
    'GitX':
      source  => "http://frim.frim.nl/GitXStable.app.zip",
      provider => compressed_app;
    'invisionapp':
      source => "https://projects.invisionapp.com/native_app/mac/sparkle/InVisionSync.dmg",
      provider => appdmg;
    'JetProfiler':
      source => "http://downloads.polaricon.com/downloads/installation/jpmy/3/early/JetProfiler_v3.0.10.dmg",
      provider => appdmg;
    'sublime_handler':
      source => "http://asuth.com/SublHandler.app.zip",
      provider => compressed_app;
    'github for mac':
      source => "https://github-central.s3.amazonaws.com/mac/GitHub%20for%20Mac%20174.zip",
      provider => compressed_app;
  }

  # https://github.com/phinze/homebrew-cask
  homebrew::tap { 'phinze/cask': }

  package {
    [
      'tmux',
      'tig',
      'wget',
      'watch',
      'tree',
      'colordiff',
      'jq',
      'phantomjs',
      'source-highlight',
      'brew-cask',
      'autossh',
      'terminal-notifier',
      'spark',
      'q',
      'go',
      'rmtrash',
    ]:
  }

  ## not working: use command by manual
  # exec {
  #   "install textql" :
  #     command => "export CC=clang && go get -u github.com/dinedal/textql",
  # }

  ruby::plugin {
    "rbenv-binstubs":
      ensure => '1.3',
      source => "ianheggie/rbenv-binstubs";
    'rbenv-vars':
      ensure => 'v1.2.0',
      source  => 'sstephenson/rbenv-vars';
  }

  nodejs::module {
    'ungit':
      node_version => 'v0.10';
    'bower':
      node_version => 'v0.10';
    'grunt-cli':
      node_version => 'v0.10';
    'hubot':
      node_version => 'v0.10';
    'coffee-script':
      node_version => 'v0.10';
    # 'devtools-terminal':
    # node_version => 'v0.10';
    ## not working well in boxen.. use it in terminal
    # npm install -g devtools-terminal
    # sudo devtools-terminal --install --id=leakmhneaibbdapdoienlkifomjceknl
    ## 2014/05/11
    ## use this its working!
    ### https://github.com/petethepig/devtools-terminal/issues/43#issuecomment-40764174
    # sudo devtools-terminal --install --chromium
    'myth':
      node_version => 'v0.10';
    'pretty-diff':
      node_version => 'v0.10';
  }

  # http://baqamore.hatenablog.com/entry/2013/12/21/234623
  # https://github.com/boxen/puppet-python/blob/1.3.0/manifests/pip.pp
  # python::pip {
  #   # TODO: Glances needs /usr/local/etc dir.(but it require root permittion).
  #   #  how to install it??
  #   'Glances':
  #     virtualenv => $homebrew::config::installdir,
  #     ensure => present;
  # }

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

  include redis
  ## See also about port, and ruby, hubot setting.
  # https://github.com/boxen/puppet-redis

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

  homebrew::tap { 'sitespeedio/sitespeedio': }
  homebrew::tap { 'tobli/browsertime': }
  package { 'sitespeedio/sitespeedio/sitespeed.io': }

  # include docker
}
