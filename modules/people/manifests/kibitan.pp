## in MacAPP
# witch
# popclip
# Dash
# line
# iphoto
# imovie


class people::kibitan {
  include chrome

  include dropbox
  include evernote
  include skype

   include keyremap4macbook
   include keyremap4macbook::login_item

  # enable remapping left control to left control + escape
  # keyremap4macbook::remap{ 'controlL2controlL_escape': }

  # set the parameter.keyoverlaidmodifier_timeout to 300
  # keyremap4macbook::set{ 'parameter.keyoverlaidmodifier_timeout':
  #   value => '300'
  # }

  # set the contents of the private.xml file.
  # keyremap4macbook::private_xml{ 'private.xml':
  #   content => '<some>xml</some>'
  # }
  
  include istatmenus3
  include clipmenu

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
  }
  
  # for dev
  ## for ruby readline
  package {
    [
      'readline',
    ]:
  }

  exec{ "replace_readline_of_ruby" :
    command => "find /opt/boxen/rbenv -name readline.bundle -exec install_name_tool -change /usr/lib/libedit.3.dylib `find /opt/boxen -name libreadline.dylib` {}",
  }

  # packages
  include chrome::canary
  include iterm2::stable
  include sublime_text_2
  sublime_text_2::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

   package {
    'Kobito':
      source   => "http://kobito.qiita.com/download/Kobito_v1.8.2.zip",
      provider => compressed_app;
  }

  package {
    [
      'tmux',
      'tig',
      'wget',
      'watch',
      'tree',
    ]:
  }

  include sourcetree
  include imagemagick
  include memcached
  # include memcached::lib # it cause error now in marverics. 2013/11/11
  include sequel_pro

  include mysql
  mysql::db { 'mydb': }

  ## See also about port, and rails setting.
  # https://github.com/boxen/puppet-mysql

}
