
{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    audio.url = "github:polygon/audio.nix";
    #nvim-conf.url = "github:lunyaUwU/nvim.nix";
    nvim-conf.url = "git+file:../nvim.nix/.?dir=.";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = github:nix-community/home-manager;
    hyprlock.url = github:hyprwm/hyprlock;
    c3d2-user.url = "git+https://gitea.c3d2.de/C3D2/nix-user-module.git";
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs = { self, nixpkgs,audio,home-manager,nix-gaming,c3d2-user,nvim-conf,hyprlock,nixos-cosmic,... }@attrs: {
    nixosConfigurations= {
      shork = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {};
        modules = [ 
          ./home
          ./shork
          {networking.hostName = "shork";}
          ];
      };
      bara = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [ 
          nixos-cosmic.nixosModules.default

          ./home
          ./bara
          {networking.hostName = "bara";}
          ];
      };
    };
     homeConfigurations."luna-x86_64-linux" = home-manager.lib.homeManagerConfiguration {
        modules = [./home/home-manager { home.username = "luna"; home.homeDirectory = "/home/luna";}];
        extraSpecialArgs = { inherit nixpkgs; };
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        };
  };
}
