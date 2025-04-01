# wezterm.sh causes issues for `:terminal` in `neovim` inside `tmux`
# temporary disable script when inside `neovim`
if [ -n "$NVIM" ]; then
  WEZTERM_SHELL_SKIP_ALL=1
fi
