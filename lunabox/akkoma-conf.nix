{ pkgs, lib, ... }:
let
  configScriptPost = pkgs.writeShellApplication {
    text = ''
    echo Running configScriptPost
    cd "$RUNTIME_DIRECTORY"
    echo "# configScriptPost patches:" >> config.exs
    echo "config :pleroma, configurable_from_database: true" >> config.exs
    echo Done patching the config!
    '';
    name = "configScriptPost";
  } + "/bin/configScriptPost";
in
{
  systemd.services.akkoma-config.serviceConfig.ExecStart = lib.mkMerge [[ configScriptPost ]];
  systemd.services.akkoma-config.serviceConfig.ExecReload = lib.mkMerge [[ configScriptPost ]];
}
