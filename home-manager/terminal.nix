 {
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.zoxide.enable = true;
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    font.normal.family = "Jet Brains Mono Nerd Font";
};

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
    # Enable colour hints in VCS prompt:
    set __fish_git_prompt_showcolorhints yes

    # Fish configuration
    set fish_greeting ""
    '';
  };

  programs.starship.enable = true;
programs.starship.enableFishIntegration = true;
programs.starship.settings = {
format = lib.concatStrings [
"$os"
"[](fg:#282a36 bg:#394260)"
"$directory"
"[](fg:#394260 bg:#bd93f9)"
"$git_branch"
"$git_status"
"[](fg:#bd93f9 bg:#282a36)"
"$nodejs"
  "$rust"
"$golang"
"$php"
"[](fg:#282a36 bg:#44475a)"
"[](fg:#44475a)"
"$shell"
"$status"
"$username"
"$hostname"
"$localip"
];
os = {
    disabled = false;
    style =  "bg:#282a36 fg:#bd93f9";
    format = "[ $symbol]($style)";
};
directory = {
style = "fg:#bd93f9 bg:#394260";
format = "[ $path ]($style)";
before_repo_root_style = "fg:#bd93f9 bg:#394260";
repo_root_style = "fg:#bd93f9 bg:#394260";
repo_root_format ="[$before_root_path ]($before_repo_root_style)[ $repo_root]($repo_root_style)[$path]($style)";
substitutions = {
"GitHub" = "";
"repos" = "";
"Downloads" = " ";
"Pictures" = " ";
  };
  };
  git_branch = {
symbol = "";
style = "bg:#bd93f9";
format = "[[ $symbol $branch ](fg:#394260 bg:#bd93f9)]($style)";
};
git_status = {
style = "bg:#bd93f9";
format = "[[($all_status$ahead_behind )](fg:#394260 bg:#bd93f9)]($style)";
};

nodejs = {

symbol = "";
style = "bg:#282a36";
format = "[[ $symbol ($version) ](fg:#59fa7b bg:#282a36)]($style)";
};
  character = {
  error_symbol = "[](bold #ff5555)";
success_symbol = "[](bold #50fa7b)";
  };
};
}