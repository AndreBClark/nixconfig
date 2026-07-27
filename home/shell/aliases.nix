{
  home.shellAliases = {
    ls = "eza";
    ll = "eza -l";
    la = "eza -A";
    lt = "eza -T";
    cd = "z";

    v = "nvim";
    vi = "nvim";
    vim = "nvim";

    nhs = "nh search";
    nho = "nh os switch";
    nhh = "nh home switch";

    # File management - using your configured tools
    cdi = "zoxide query -i";

    # Fzf
    fzf = "fzf --preview \"bat --color=always {}\"";

    # System commands
    df = "df -h";
    du = "du -h";
    free = "free -h";
    ps = "ps auxf";
    psg = "ps aux | grep -v grep | grep -i";
    hist = "history";
    path = "echo -e $PATH";

    # File operations (with safety flags)
    cp = "cp -iv";
    mv = "mv -iv";
    rm = "rm -iv";
    mkdir = "mkdir -pv";
    grep = "grep --color=auto";
    egrep = "egrep --color=auto";
    fgrep = "fgrep --color=auto";

    # Tool replacements
    cat = "bat";
    find = "fd";
    tree = "eza --tree";

    # Network & utilities
    ping = "ping -c 5";
    ports = "netstat -tulanp";
    ip = "ip -c";
    curl = "curl -L";
    weather = "curl wttr.in";

    # Safety aliases (override above for interactive confirmation)
    ln = "ln -i";
  };
}
