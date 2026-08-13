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

    # System commands
    df = "df -h";
    du = "du -h";
    free = "free -h";
    ps = "ps auxf";
    psg = "ps aux | grep -v grep | grep -i";
    hist = "history";
    path = "echo -e $PATH";

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
