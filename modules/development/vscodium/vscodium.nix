{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
  (vscode-with-extensions.override {
    vscode = vscodium;
    vscodeExtensions = with vscode-extensions; [
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-pull-request-github";
        publisher = "open-vsx";
      }

    ];
  })
];
}
