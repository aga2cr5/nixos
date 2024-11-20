{ config, lib, pkgs, ... }:

{

programs.kitty = {
    enable = true;
    #enableZshIntegration = true;

    # https://sw.kovidgoyal.net/kitty/conf/#window-layout
    settings = {
      shell = "zsh";
      window_padding_width = 10;
      scrollback_lines = 10000;
      show_hyperlink_targets = "yes";
      enable_audio_bell = false;
      url_style = "none";
      underline_hyperlinks = "never";
      copy_on_select = "clipboard";
      background_opacity = "0.8";
      background_blur = 1;
      remember_window_size = "yes";

      # these are not making difference due to remember_window_size="yes"
      #initial_window_width = 120;
      #initial_window_height = 80;
      font_size = "10.0";
    };
  };

}
