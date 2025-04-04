{nvim-conf, pkgs, config,...}: 

{
  users.users.luna.packages = [nvim-conf.packages.x86_64-linux.default];    
  environment.variables.EDITOR = "nvim";
}
