{ config, lib, pkgs, ... }:
let
  unstable = (import <nixos-unstable> {}).pkgs;
in rec
{
  environment.etc."share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh".source = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";

  environment.etc."share/fzf/key-bindings.zsh".source = "${unstable.fzf}/share/fzf/key-bindings.zsh";
  environment.etc."share/fzf/completion.zsh".source = "${unstable.fzf}/share/fzf/completion.zsh";

  environment.etc."share/zsh-git-prompt/zshrc.sh".source = "${pkgs.zsh-git-prompt}/share/zsh-git-prompt/zshrc.sh";

  environment.etc."share/zsh-powerlevel10k/powerlevel10k.zsh-theme".source = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

  environment.etc."share/alacritty-theme".source = "${pkgs.alacritty-theme}";

}
