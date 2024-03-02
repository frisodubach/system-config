{ config, lib, pkgs, inputs, ... }: {
  imports =
    [ ./hardware-configuration.nix ./networking.nix ./audio.nix ./power.nix ];

  ######### Core system stuff #########

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  #boot.initrd.secrets = {
  #  "/crypto_keyfile.bin" = null;
  #};

  # Enable swap on luks
  #boot.initrd.luks.devices."luks-dffaa50a-c064-4595-b099-ee9812816276".device = "/dev/disk/by-uuid/dffaa50a-c064-4595-b099-ee9812816276";
  #boot.initrd.luks.devices."luks-dffaa50a-c064-4595-b099-ee9812816276".keyFile = "/crypto_keyfile.bin";

  boot.supportedFilesystems = [ "ntfs" ];

  ## LOCALE SECTION
  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = { LC_TIME = "nl_NL.UTF-8"; };

  ######## /Core system stuff ########

  services = {
    fstrim.enable = true;
    printing.enable = true;
  };

  # Screen-lock / security
  security = {
    polkit.enable = true;
    pam = {
      services = {
        gtklock = { };
        swaylock = { };
      };
    };
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings = { auto-optimise-store = true; };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
