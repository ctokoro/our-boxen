class people::kibitan {
  include chrome
  
  # for dev
  include chrome::canary
  include iterm2::stable
  
  include sublime_text_2
  sublime_text_2::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }
}
