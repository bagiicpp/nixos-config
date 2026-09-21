{ config, pkgs, lib, inputs, unstable, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # ============================================================================
  # Boot
  # ============================================================================

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };

  boot.loader.efi.canTouchEfiVariables = true;


  # ============================================================================
  # Networking
  # ============================================================================

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.openvpn.servers.argentina = {
    config = "config /etc/openvpn/argentina.ovpn";
    autoStart = false;
  };


  # ============================================================================
  # Locale
  # ============================================================================

  time.timeZone = "Europe/Ljubljana";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sl_SI.UTF-8";
    LC_IDENTIFICATION = "sl_SI.UTF-8";
    LC_MEASUREMENT = "sl_SI.UTF-8";
    LC_MONETARY = "sl_SI.UTF-8";
    LC_NAME = "sl_SI.UTF-8";
    LC_NUMERIC = "sl_SI.UTF-8";
    LC_PAPER = "sl_SI.UTF-8";
    LC_TELEPHONE = "sl_SI.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  # ============================================================================
  # Display Server & Desktop Environments
  # ============================================================================

  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs.hyprland = {
    enable = true;

    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };


  # ============================================================================
  # XDG Portals
  # ============================================================================

  xdg.portal = {
    enable = true;

    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gtk
    ];

    config = {
      common.default = [ "gtk" ];
      hyprland.default = [ "hyprland" "gtk" ];
      plasma.default = [ "kde" ];
    };
  };


  # ============================================================================
  # Polkit
  # ============================================================================

  security.polkit.enable = true;

  systemd.user.services.polkit-kde-agent = {
    description = "PolicyKit Authentication Agent (KDE)";

    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];

    serviceConfig = {
      Type = "simple";

      ExecStart =
        "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";

      Restart = "on-failure";
    };
  };


  # ============================================================================
  # NVIDIA Optimus (GTX 1650)
  # ============================================================================

  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;

    open = false;
    nvidiaSettings = true;

    prime = {
      offload.enable = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };


  # ============================================================================
  # Keyboard
  # ============================================================================

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  # ============================================================================
  # Printing
  # ============================================================================

  services.printing = {
    enable = true;

    drivers = with pkgs; [
      cups-filters
      gutenprint
      hplip
    ];
  };

  services.ipp-usb.enable = true;


  # ============================================================================
  # Audio & Bluetooth
  # ============================================================================

  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  hardware.bluetooth.enable = true;

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;
  };


  # ============================================================================
  # Power Management
  # ============================================================================

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;


  # ============================================================================
  # Compatibility Libraries
  # ============================================================================

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    openssl

    # Playwright's prebuilt Chromium (FHS binary) needs these
    glib nss nspr atk at-spi2-core cups dbus expat
    libdrm libgbm libGL libxkbcommon
    pango cairo fontconfig freetype
    alsa-lib systemdLibs
    xorg.libX11 xorg.libxcb xorg.libXcomposite xorg.libXdamage
    xorg.libXext xorg.libXfixes xorg.libXrandr
  ];


  # ============================================================================
  # Users & Shell
  # ============================================================================

  programs.fish.enable = true;

  users.users."bagii" = {
    isNormalUser = true;
    description = "Blagoja Vasilev";

    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];

    shell = pkgs.fish;

    packages = with pkgs; [
      kdePackages.kate
      # thunderbird
    ];
  };


  # ============================================================================
  # Docker
  # ============================================================================

  virtualisation.docker.enable = true;


  # ============================================================================
  # Nix
  # ============================================================================

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    extra-substituters = [
      "https://noctalia.cachix.org"
      "https://vicinae.cachix.org"
    ];

    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };


  # ============================================================================
  # Fonts
  # ============================================================================

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    crimson-pro
  ];

  fonts.fontconfig.enable = true;


  # ============================================================================
  # Environment
  # ============================================================================

  environment.localBinInPath = true;

  environment.sessionVariables.NPM_CONFIG_PREFIX = "$HOME/.npm-global";

  environment.variables.PATH = [
    "$HOME/.npm-global/bin"
  ];

  environment.etc."xdg/menus/applications.menu".source =
    "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";


  # ============================================================================
  # System Packages
  # ============================================================================

  environment.systemPackages =
    with pkgs;
    [
      # Editors
      vim
      neovim
      zed-editor

      # CLI / Development
      wget
      git
      nodejs
      bun
      fastfetch
      yazi

      # Wayland / Desktop Utilities
      wl-clipboard
      swappy
      brightnessctl
      ddcutil
      libqalculate
      desktop-file-utils

      # System / Hardware
      lm_sensors
      bubblewrap

      # Applications
      discord
      qimgv
      obsidian
      inkscape

      # Printing
      kdePackages.print-manager
      system-config-printer
      cups

      # Development Tools
      playwright-mcp

      # Screenshot
      grim
      slurp
      satty
      wl-clipboard
   ]
    ++ [
      unstable.fetch
    ]
    ++ [
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ]
    ++ [
      inputs.claude-code.packages.${pkgs.stdenv.hostPlatform.system}.default
    ]
    ++ [
      inputs.hyprmod.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];


  # ============================================================================
  # System Version
  # ============================================================================

  system.stateVersion = "26.05";
}
