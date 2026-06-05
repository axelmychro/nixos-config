_: {
  services.auto-cpufreq = {
    enable = false;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
        energy_performance_preference = "power";
        scaling_max_freq = 1600000;
      };
      charger = {
        governor = "powersave";
        turbo = "never";
        energy_performance_preference = "power";
        scaling_max_freq = 1600000;
      };
    };
  };
}
