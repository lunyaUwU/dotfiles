
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    audio.url = "github:polygon/audio.nix";
    nvim-conf = {
      url = "github:lunyaUwU/nvim.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mixbus = {
      url = "github:lunyaUwU/mixbus";
      inputs.nixpkgs.follows ="nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager";
    hyprlock.url = "github:hyprwm/hyprlock";
    inkstitch.url = "git+https://codeberg.org/tropf/nix-inkstitch";   
    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mail-server = {
      url = "gitlab:simple-nixos-mailserver/nixos-mailserver";
      inputs.nixpkgs.follows = "nixpkgs";

    };
    starla = {
      url = "github:ananthb/starla";

      inputs.nixpkgs.follows = "nixpkgs";
    }; 
    authentik-nix = {
      url = "github:nix-community/authentik-nix";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    
    nix-darwin.url = "github:LnL7/nix-darwin";
      nix-darwin.inputs.nixpkgs.follows = "nixpkgs";    sops-nix.url = "github:Mic92/sops-nix";
    };
  outputs = { nur,audio,self, nixpkgs,home-manager,
  nvim-conf,hyprlock,
  nixos-hardware,
  nix-darwin,
  authentik-nix,
  mixbus,inkstitch,ghostty,sops-nix,mail-server,starla, ... }@attrs: {
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
    lunabox = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs  = attrs;
      modules = [
        ./lunabox
        {networking.hostName="lunabox";}
        sops-nix.nixosModules.sops
        starla.nixosModules.default
        authentik-nix.nixosModules.default
        ];

      };
      bara = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [ 
          #nixos-cosmic.nixosModules.default

          ./home
          ./bara
          {networking.hostName = "bara";}
          sops-nix.nixosModules.sops
	  nixos-hardware.nixosModules.lenovo-ideapad-slim-5
          ];
      };
    };
    darwinConfigurations."Lunas-MacBook-Air" = nix-darwin.lib.darwinSystem {
     specialArgs = attrs; 
      modules = [
        ./macbook
      ];
    };
    
    homeConfigurations."luna" = home-manager.lib.homeManagerConfiguration {
        modules = [./home/home-manager { home.username = "luna"; home.homeDirectory = "/home/luna";}];
        extraSpecialArgs = { inherit nixpkgs; };
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        };
    };
}
