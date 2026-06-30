_: {
  services = {
    upower = {
      enable = true;
      percentageLow = 50;
      percentageCritical = 20;
      ignoreLid = true;
    };

    auto-cpufreq = {
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
  };
}
