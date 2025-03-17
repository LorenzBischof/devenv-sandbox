{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  packages = [
    config.outputs.devenv-sandbox
  ];

  scripts.hello.exec = ''
    ls -al ~/.ssh
  '';

  enterShell = ''
    hello
    devenv-sandbox hello
  '';
  outputs.devenv-sandbox = pkgs.rustPlatform.buildRustPackage {
    pname = "devenv-sandbox";
    version = "0.0.1";
    cargoLock.lockFile = ./Cargo.lock;
    src = ./.;
  };
}
