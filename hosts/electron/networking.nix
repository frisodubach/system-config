{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "electron";
    networkmanager.enable = true;
    firewall = { enable = true; };
    # nameservers = [
    #   "DNS=194.242.2.9#all.dns.mullvad.net"
    #   "DNS=194.242.2.5#extended.dns.mullvad.net"
    # ];
    nameservers = [ "9.9.9.9" "149.112.112.112" ];
  };

  # services.resolved = {
  #   enable = true;
  #   dnssec = "false";
  #   domains = [ "~." ];
  #   fallbackDns = [
  #     "DNS=194.242.2.9#all.dns.mullvad.net"
  #     "DNS=194.242.2.5#extended.dns.mullvad.net"
  #   ];
  #   extraConfig = ''
  #     DNSOverTLS=yes
  #   '';
  # };

  hardware.bluetooth.enable = true;
  # services.blueman.enable = true;

  # MiraCast firewall options
  networking.firewall.allowedTCPPorts = [ 7236 7250 ];
  networking.firewall.allowedUDPPorts = [ 7236 5353 ];
  networking.firewall.trustedInterfaces = [ "p2p-wl+" ];

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

}
