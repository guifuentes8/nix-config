{ ... }: {
  imports = [./global ];

  programs = {
    ripgrep.enable = true;
    tmux.enable = true;
    vim.enable = true;
  };
}
