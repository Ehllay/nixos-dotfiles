{pkgs, ...}: {
  home.packages = with pkgs; [
    # Toolchains
    clang
    rustup
    bun
    zulu17
    # temurin-bin-17

    # Formatters
    alejandra
    prettierd
    stylua
    astyle
  ];
}
