{ config, pkgs, ... }:

{
  hardware.graphics= {
    enable =true;
  };
  services.xserver.videoDriver = ["nvidia"];
  hardware.keyboard.qmk.enable = true;
  environment.systemPackages = with pkgs; [
    via
    qmk
  ];
  services.udev.packages = [ pkgs.via ];


  hardware.nvidia={
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
  };
  fileSystems."/mnt/btrfs_raid" = {
    device = "/dev/disk/by-uuid/a163b717-0975-4c2b-a7b2-d3f7fc71ccdf";
    fsType = "btrfs";
    options = [
      "defaults"
      "nofail"
      "exec"
      "x-gvfs-show"
      "noatime"
    ];
  };
  # seen on nix wik 
  fileSystems."/".options = [ "noatime" ];
  # seen on nix discourse to speed boot time
  systemd.services.NetworkManager-wait-online.enable = false;
  systemd.services.systemd-udev-settle.enable = false;
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" ];
}
