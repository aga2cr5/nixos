final: prev: {
  mattermost-desktop = prev.mattermost-desktop.overrideAttrs (
    old: {
      version = "5.10.2";
      src = prev.fetchurl {
        url = "https://releases.mattermost.com/desktop/5.10.2/mattermost-desktop-5.10.2-linux-x64.tar.gz";
        hash = "sha256-MSV5ias643eYKmJlJInCuNA2hnaDRv+3c7x4xxZI7Z4=";
      };
    }
  );
}
