{ lib, pkgs, config, ... }:
{
  imports = [
    ../../../common/cpu/intel
    ../../../common/pc/laptop
    ../../../common/pc/laptop/ssd
  ];

  # This will save you money and possibly your life!
  services.thermald.enable = lib.mkDefault true;

  # Enable firmware updates via `fwupdmgr`.
  services.fwupd.enable = lib.mkDefault true;

  #boot.kernelPatches = lib.mkIf (lib.versionOlder pkgs.linux.version "6.7") [
  #  { 
  #    name = "patch1";
  #    patch = ./ALSA-hda-cs35l41-Dell-Fiorano-add-missing-_DSD-CS.patch;
  #  }
  #  { 
  #    name = "patch3";
  #    patch = ./mfd-intel-lpss-v4.patch;
  #  }
  #];

  services.pipewire.configPackages = [
    (pkgs.writeTextDir "share/pipewire/pipewire.conf.d/sink-eq6.conf" (builtins.readFile ./sink-eq6.conf))
  ];
}
