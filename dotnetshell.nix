{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    name = "dotnet-env";

    buildInputs = with pkgs; [
      dotnetCorePackages.sdk_9_0_1xx-bin
      dotnetPackages.Nuget
      mono
      msbuild
      vscode-extensions.ms-dotnettools.csharp
      dotnet-sdk_9
      vscode
    ];
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
}
