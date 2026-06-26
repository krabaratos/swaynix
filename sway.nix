{ config, pkgs, ... }:

{
  programs.sway = { 
    enable = true; 
    wrapperFeatures.gtk = { 
      enable = true; 
    }; 
  }; 

  

  # 1. Display manager: Slick Greeter configuration
  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.slick = {
      enable = true;
      theme = {
        name = "Orchis-Dark";
        package = pkgs.orchis-theme;
      };

      cursorTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    };
  };

  # GVfs for Nautilus + File Roller integration
  services.gvfs.enable = true;

  # System packages: file manager, archive tools, bar, launcher
  environment.systemPackages = with pkgs; [  # <-- "with pkgs;" is critical here!
    kitty

   #wayland
    wl-clipboard
    swaybg

    # GTK theming
    nwg-look
      
    # Audio Control
    pavucontrol

    # Text
    gnome-text-editor
      
    # File management
    nautilus
    file-roller

    # Networking
    networkmanagerapplet

    # UI extras
    waybar
    wofi
    rofi
  ];

  # Wayland session variables
  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
  };
}
