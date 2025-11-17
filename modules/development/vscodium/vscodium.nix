{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
  (vscode-with-extensions.override {
    vscode = vscodium;
    vscodeExtensions = with vscode-extensions; [
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-pull-request-github";
        publisher = "github";
        version = "0.120.2";
        sha256 = "0gi9ib9cf5h7p3l1mxs1z4wjv69kwjxngw6fz071362q7215fp1g";
      }
      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.5.0";
        sha256 = "1cpfckh6zg8byi6x1llkdls24w9b0fvxx4qybi9zfcy5gc60r6nk";
      }
    ];
  })
];
}
