{ config, lib, pkgs, ... }:

{
  services.mullvad-vpn.enable = true;
  # networking.firewall.checkReversePath = "loose";
  networking.wireguard.enable = true;

  environment.systemPackages = with pkgs; [ mullvad ];

  networking = {
    nftables = {
      enable = true;
      ruleset = ''
        define EXCLUDED_IPS = {
        100.117.232.92,
        100.64.0.0/10,
        }

        table inet excludeTraffic {
          chain excludeOutgoing {
            type route hook output priority 0; policy accept;
            ip daddr $EXCLUDED_IPS ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
          }
        }
      '';
    };
  };

  # systemd.services."mullvad-daemon".postStart =
  #   let mullvad = config.services.mullvad-vpn.package;
  #   in ''
  #     ${mullvad}/bin/mullvad auto-connect set on
  #     ${mullvad}/bin/mullvad relay set location nl
  #     ${mullvad}/bin/mullvad dns set default
  #     ${mullvad}/bin/mullvad lan set allow
  #   '';
  # while ! ${mullvad}/bin/mullvad status > /dev/null/; do sleep 1; done

}
