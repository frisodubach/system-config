{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    #./no-git.nix
  ];

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

  ############ /Networking ############
  networking = {
    hostName = "electron";
    networkmanager.enable = true;
    firewall = { enable = true; };
    nameservers = [
      "DNS=194.242.2.9#all.dns.mullvad.net"
      "DNS=194.242.2.5#extended.dns.mullvad.net"
    ];
  };

  services.resolved = {
    enable = true;
    dnssec = "false";
    domains = [ "~." ];
    fallbackDns = [
      "DNS=194.242.2.9#all.dns.mullvad.net"
      "DNS=194.242.2.5#extended.dns.mullvad.net"
    ];
    extraConfig = ''
      DNSOverTLS=yes
    '';
  };

  hardware.bluetooth.enable = true;
  # services.blueman.enable = true;

  # Local DNS entries. Fix ports once all services are working
  networking.extraHosts = ''
    100.117.232.92 im.phonon.nl # images
    100.117.232.92 fs.phonon.nl # files
    100.117.232.92 bu.phonon.nl # backups
    100.117.232.92 px.phonon.nl # proxy manager
    100.117.232.92 gf.phonon.nl # Grafana
    100.117.232.92 bl.phonon.nl # blog
    100.117.232.92 sy.phonon.nl # sync
    100.117.232.92 pt.phonon.nl # portainer
    100.117.232.92 sf.phonon.nl # SFTP
    100.80.184.50 ts.neutron.nl # tailscale
  '';

  ####### VPN configuration #######
  services.mullvad-vpn.enable = true;
  # networking.firewall.checkReversePath = "loose";
  networking.wireguard.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  ######### SOUND/IO SECTION ############
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    audio.enable = true;
    jack.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };
  security.rtkit.enable = true;

  services.xserver.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      accelProfile = "flat";
    };
  };

  ## USB Devices auto-mounting
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
  };

  ## LOCALE SECTION
  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = { LC_TIME = "nl_NL.UTF-8"; };

  ######## /Core system stuff ########

  services = {
    fstrim.enable = true;
    printing.enable = true;

    # power-management stuff
    # thermald.enable = true;

    # Power-profiles daemon
    # power-profiles-daemon.enable = true;

    acpid.enable = true;

    # #Auto CPU Frequency
    # auto-cpufreq.enable = true;
    # auto-cpufreq.settings = {
    #   battery = {
    #     governor = "powersave";
    #     turbo = "auto";
    #   };
    #   charger = {
    #     governor = "schedutil";
    #     turbo = "auto";
    #   };
    # };

    # TLP
    tlp = {
      enable = true;
      settings = {
        STOP_CHARGE_THRESH_BAT0 = 1;
        RADEON_DPM_STATE_ON_AC = "performance";
        RADEON_DPM_STATE_ON_BAT = "battery";
        PCIE_ASPM_ON_BAT = "powersupersave";
        RUNTIME_PM_ON_BAT = "auto";
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power"; # CHECK: tlp-stat -p
        CPU_SCALING_GOVERNOR_ON_AC = "schedutil"; # CHECK: tlp-stat -p
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        # Version 1.6 & kernal 6.3
        CPU_DRIVER_OPMODE_ON_AC =
          "active"; # guided, passive --> frequency limits
        CPU_DRIVER_OPMODE_ON_BAT = "active";
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

        # USB_AUTOSUSPEND=0;
      };
    };
  };

  powerManagement = {
    enable = true;
    powertop.enable = false;
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
