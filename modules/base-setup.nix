{ config, pkgs, ... }:

{
  imports = [ ./desktop.nix ./fish/fish.nix ];

  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };

  users.users = {
    phonon = {
      isNormalUser = true;
      description = "phonon";
      extraGroups = [ "networkmanager" "wheel" "audo" "video" "storage" ];
      #initialPassword = "password";
    };
  };

  environment.systemPackages = with pkgs; [
    # basic CLI utlilities
    git
    vim
    wget
    fd # better find
    ripgrep # better grep
    htop-vim
    unzip
    powertop
    smartmontools # Get SMART data
    tldr # man alternative
    fzf # fuzzy finder
    eza # ls alternative
    bat # cat alternative
    ncdu # du alternative
    duf # df alternative
    trash-cli # Trash can CLI
    fish

    # misc
    neofetch

    # coding
    clojure
    clojure-lsp
    go
    gopls
    gotools
  ];

  programs = {
    # dconf.enable = true;
    mtr.enable = true;
    nm-applet.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # ENABLE TAILSCALE
  services.tailscale.enable = true;
  networking.firewall.trustedInterfaces = [ "tailscale0" ];

  # AUTO UPDATE DB
  services.locate = {
    enable = true;
    package = pkgs.mlocate;
    interval = "daily";
    # warning: mlocate and plocate do not support the services.locate.localuser option. updatedb will run as root. Silence this warning by setting services.locate.localuser = null
    localuser = null;
  };

  # FONTS
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      fira-code
      fira
      fira-code-symbols
      jetbrains-mono
      powerline-fonts
      nerdfonts
      overpass
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
