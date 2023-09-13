{ pkgs }: {
    deps = [
        pkgs.git-lfs
        pkgs.fd
        pkgs.emacs-nox
        pkgs.pandoc
        pkgs.nodejs-16_x
    ];
}