require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  ## no need old version
  #include nodejs::v0_6
  #include nodejs::v0_8
  include nodejs::v0_10

  # NodeJS stuff
  class { 'nodejs::global':
    version => 'v0.10'
  }

  # default ruby versions
  ## no need old version
  # ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }

  ## for ruby readline
  package {
    [
      'readline',
    ]:
  }

  # readlineの接続先直す | iii ThreeTreesLight
  # http://threetreeslight.com/post/58786169382/readline
  exec{ "replace_readline_of_ruby" :
   command => "find /opt/boxen/rbenv -name readline.bundle -exec install_name_tool -change /usr/lib/libedit.3.dylib `find /opt/boxen -name libreadline.dylib` {} \\;",
  }
  
  # set ruby global version
  class { 'ruby::global':
    version => '2.0.0'
  }

  # python
  # http://baqamore.hatenablog.com/entry/2013/12/21/234623
  include python
  include python::virtualenvwrapper

  # https://github.com/boxen/puppet-python/blob/1.3.0/manifests/mkvirtualenv.pp
  # python::mkvirtualenv{ 'global':
  #   ensure      => present,
  #   systempkgs  => true,
  #   distribute  => true,
  #   project_dir => "$BOXEN_HOME/pyenv/"
  # }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
