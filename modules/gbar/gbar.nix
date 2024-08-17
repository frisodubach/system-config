{ inputs, config, lib, pkgs, ... }:

{
  home-manager.users.phonon = {

    home.stateVersion = "22.11";

    imports = [ inputs.gBar.homeManagerModules.x86_64-linux.default ];
    programs.gBar = {
      enable = true;
      config = {
        Location = "R";
        EnableSNI = false;
        WorkspaceSymbols = [ "一" "二" "三" "四" "五" "六" "七" "八" "九" ];
        WidgetsLeft = [ ];
        WidgetsCenter = [ ];
        WidgetsRight = [ ];
        ShutdownIcon = "\\s";
        RebootIcon = "󰑐";
        SleepIcon = "󰏤";
        LockIcon = "";
        ExitIcon = "󰗼";
        BTOffIcon = "󰂲";
        BTOnIcon = "󰂯";
        BTConnectedIcon = "󰂱";
        DevKeyboardIcon = "󰌌\\s";
        DevMouseIcon = "󰍽\\s";
        DevHeadsetIcon = "󰋋s";
        DevControllerIcon = "󰖺\\s";
        DevUnknownIcon = "s";
        SpeakerMutedIcon = "󰝟";
        SpeakerHighIcon = "󰕾";
        MicMutedIcon = "󰍭";
        MicHighIcon = "󰍬";
        PackageOutOfDateIcon = "󰏔\\s";

        SuspendCommand = "";
        LockCommand = "hyprlock";
        ExitCommand = "loginctl terminate-user $USER";

        CPUThermalZone =
          "/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon2/temp1_input";
        # Possible values can be found by querying /sys/class/drm
        DrmAmdCard = "card1";
        # Relative path to AMD gpu thermal sensor, appended after /sys/class/drm/<DrmAmdCard>
        AmdGPUThermalZone = "/device/hwmon/hwmon5/temp1_input";

        BatteryFolder = "/sys/class/power_supply/BAT0";
        BatteryWarnFolder = 20;
        DiskPartition = "/";

        WorkspaceScrollOnMonitor = false;
        WorkspaceScrollInvert = false;
        NumWorkspaces = 9;
        UseHyprlandIPC = true;

        IconsAlwaysUp = true;
        SensorTooltips = true;

        CenterSpace = 300;
        CenterWidgets = true;

        DateTimeStyle = "%H\\n%M";
        DateTimeLocale = "en_NL.utf8";

        MaxTitleLength = 30;

        AudioInput = true;
        AudioRevealer = true;
        AudioScrollSpeed = 5;
        AudioNumbers = false;
        # AudioMinVolume = 30; # Audio can't get below 30%
        # AudioMaxVolume = 120; # Audio can't get above 120%

        CheckPackagesCommand = "";
        CheckUpdateInterval = 300;

        NetworkAdapter = "wlp1s0";
        NetworkWidget = true;
        NetworkIconSize = 24;

        SensorSize = 24;
      };
    };
  };
}
