
{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    audio.url = "github:polygon/audio.nix";
    nvim-conf.url = "github:lunyaUwU/nvim.nix";
    nix-gaming.url = "github:lunyaUwU/nix-repo";
    home-manager.url = github:nix-community/home-manager;
    c3d2-user.url = "git+https://gitea.c3d2.de/C3D2/nix-user-module.git";
  };
  outputs = { self, nixpkgs,audio,home-manager,nix-gaming,c3d2-user,nvim-conf,... }@attrs: {
    nixosConfigurations.shork = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      #specialArgs = {inherit inputs;};
      specialArgs = attrs;
      modules = [ 
        ./home
        #c3d2-user.nixosModule 
        ];
      
    };
  };
}
