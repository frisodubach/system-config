{ ... }: ''
  ## Mako configuration file

  # GLOBAL CONFIGURATION OPTIONS
  max-history=10
  sort=-time

  # BINDING OPTIONS
  on-button-left=dismiss
  on-button-middle=none
  on-button-right=dismiss-all
  on-touch=dismiss
  # on-notify=exec mpv /usr/share/sounds/freedesktop/stereo/message.oga

  # STYLE OPTIONS
  font=FiraCode Nerd Font Mono
  width=300
  height=150
  margin=10
  padding=15
  border-size=2
  border-radius=10
  icons=1
  max-icon-size=32
  icon-location=left
  markup=1
  actions=1
  history=1
  text-alignment=left
  default-timeout=5000
  ignore-timeout=0
  max-visible=3
  layer=overlay
  anchor=top-right

  background-color=#32302f
  text-color=#ebdbb2
  border-color=#282828
  progress-color=over #83a598

  [urgency=low]
  border-color=#282828
  default-timeout=2000

  [urgency=normal]
  border-color=#282828
  default-timeout=5000

  [urgency=high]
  border-color=#fb4934
  text-color=#fbf1c7
  default-timeout=5000

  [mode=do-not-disturb]
  invisible=1

  # [category=mpd]
  # border-color=#f9e2af
  # default-timeout=2000
  # group-by=category
''
