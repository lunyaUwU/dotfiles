
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixpkgs.url = github:NixOS/nixpkgs;
    audio.url = "github:polygon/audio.nix";
    nvim-conf = {
      url = "github:lunyaUwU/nvim.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mixbus = {
      url = "github:lunyaUwU/mixbus";
      inputs.nixpkgs.follows ="nixpkgs";
    };
    #nvim-conf.url = "https://github.com/lunyaUwU/nvim.nix";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    hyprlock.url = "github:hyprwm/hyprlock";
    #c3d2-user.url = "git+https://gitea.c3d2.de/C3D2/nix-user-module.git";
    inkstitch.url = "git+https://codeberg.org/tropf/nix-inkstitch";   
    #nixos-cosmic = {
    #  url = "github:lilyinstarlight/nixos-cosmic";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs-unstable.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
  };
  outputs = { nur,audio,self, nixpkgs,home-manager,nix-gaming,
  #,c3d2-user,
  nvim-conf,hyprlock,
  #nixos-cosmic,
  mixbus,inkstitch,ghostty,sops-nix,... }@attrs: {
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

          ];
      };
    };
    homeConfigurations."luna" = home-manager.lib.homeManagerConfiguration {
        modules = [./home/home-manager { home.username = "luna"; home.homeDirectory = "/home/luna";}];
        extraSpecialArgs = { inherit nixpkgs; };
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        };
    };
}
