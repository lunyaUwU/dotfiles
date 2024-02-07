
{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    audio.url = "github:polygon/audio.nix";
    nix-gaming.url = "github:lunyaUwU/nix-repo";
    home-manager.url = github:nix-community/home-manager;
  };
  outputs = { self, nixpkgs,audio,home-manager,nix-gaming,... }@attrs: {
    nixosConfigurations.shork = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      #specialArgs = {inherit inputs;};
      specialArgs = attrs;
      modules = [ ./home ];
      
    };
  };
}
