{ config, pkgs, lib, inputs, unstable, ... }:

{
  imports =
    [ ./hardware-configuration.nix ];

  # --- Boot ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  networking.hostName = "nixos";

  # --- Network ---
  networking.networkmanager.enable = true;

  # --- Locale ---
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

  # --- Services ---

  services.openvpn.servers.argentina = {
    config = "config /etc/openvpn/argentina.ovpn";
    autoStart = false;
  };

  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.desktopManager.plasma6.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # --- Portals ---
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

  # --- Polkit agent for Niri ---
  security.polkit.enable = true;
  systemd.user.services.polkit-kde-agent = {
    description = "PolicyKit Authentication Agent (KDE)";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
      Restart = "on-failure";
    };
  };

  # --- NVIDIA Optimus (GTX 1650) ---
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  # --- Printing ---
  services.printing = {
    enable = true;
    drivers = with pkgs; [ 
      cups-filters
      gutenprint
      hplip   
    ];
  };

  services.ipp-usb.enable = true;

  # --- Audio ---
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # --- Libraries ---
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    openssl
  ];

  # --- Users ---
  programs.fish.enable = true;

  users.users."bagii" = {
    isNormalUser = true;
    description = "Blagoja Vasilev";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # --- Unfree packages ---
  nixpkgs.config.allowUnfree = true;
  virtualisation.docker.enable = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    extra-substituters = [ 
      "https://noctalia.cachix.org"
      "https://vicinae.cachix.org"
    ];
    extra-trusted-public-keys = [ 
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };

  # --- Fonts ---
  
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    crimson-pro
  ];
  fonts.fontconfig.enable = true;

  # --- Environment --- 

  environment.localBinInPath = true;
  environment.sessionVariables.NPM_CONFIG_PREFIX = "$HOME/.npm-global";
  environment.variables.PATH = [ "$HOME/.npm-global/bin" ];
  environment.etc."xdg/menus/applications.menu".source =
  "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  # --- Packages ---

  environment.systemPackages = with pkgs; [
	vim
	neovim
	wget
	wl-clipboard
	swappy
	brightnessctl
	lm_sensors
	ddcutil
	libqalculate
	git
	zed-editor
	nodejs
	bun
	fastfetch
	discord
	qimgv
	desktop-file-utils
	obsidian
        kdePackages.print-manager
        system-config-printer
        cups
	playwright-mcp
	inkscape
  ]
  ++ [ unstable.fetch ]
  ++ [ inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default ]
  ++ [ inputs.claude-code.packages.${pkgs.stdenv.hostPlatform.system}.default ]
  ++ [ inputs.hyprmod.packages.${pkgs.stdenv.hostPlatform.system}.default ];

  # --- System Version ---

  system.stateVersion = "26.05";
}
