_: {
  programs.fish.functions = {
    generate = builtins.readFile ./generate.fish;
  };
}
