
{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    audio.url = "github:polygon/audio.nix";
    nvim-conf.url = "github:lunyaUwU/nvim.nix";
    nix-gaming.url = "github:lunyaUwU/nix-repo";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = github:nix-community/home-manager;
    hyprlock.url = github:hyprwm/hyprlock;
    c3d2-user.url = "git+https://gitea.c3d2.de/C3D2/nix-user-module.git";
  };
  outputs = { self, nixpkgs,audio,home-manager,nix-gaming,c3d2-user,nvim-conf,hyprlock,... }@attrs: {
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
          ./home
          ./bara
          {networking.hostName = "bara";}
          ];
      };
    };
  };
}
