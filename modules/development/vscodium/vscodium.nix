{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
  (vscode-with-extensions.override {
    vscode = vscodium;
    vscodeExtensions = with vscode-extensions; [
      ms-python.python
      ms-python.debugpy
      jnoortheen.nix-ide
      github.vscode-pull-request-
    ];
  })
];
}
