_: {
  programs.zed-editor.userSettings = {
    title_bar = {
      show_menus = false;
      show_branch_icon_status = true;
    };

    project_panel = {
      dock = "left";
      drag_and_drop = true;
      hide_hidden = false;
      hide_root = true;
      indent_size = 20.0;
      git_status = true;
      folder_icons = true;
      file_icons = true;
      entry_spacing = "standard";
      hide_gitignore = false;
      default_width = 240.0;
    };

    tab_bar.show = true;
    tabs = {
      close_position = "left";
      file_icons = true;
      git_status = true;
    };
    toolbar.breadcrumbs = true;
  };
}
