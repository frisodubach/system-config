{ config, lib, pkgs, ... }:

{
  services = {
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

}
