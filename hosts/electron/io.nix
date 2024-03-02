{ config, lib, pkgs, ... }:

{
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

}
