
{ pkgs,config, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs;
    [
      vim
      helix
      fastfetch
      hyfetch
      cmatrix
      mpv
      go
      nixd
    ];

      # Auto upgrade nix package
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
    programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
    system.configurationRevision = config.rev or config.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
    system.stateVersion = 4;
    ids.gids.nixbld = 350;
      # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";
    security.pam.services.sudo_local.touchIdAuth = true;  
}
