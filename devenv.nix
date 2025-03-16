{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  languages.rust.enable = true;

  scripts.hello.exec = ''
    ls -al ~/.ssh
  '';

  enterShell = ''
    hello
    cargo build
    target/debug/devenv-sandbox hello
  '';
}
