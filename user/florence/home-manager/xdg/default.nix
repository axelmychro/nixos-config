{ config, ... }:
let
  audio_mimetype = [
    "application/ogg"
    "application/x-cue"
    "application/x-ogg"
    "audio/aac"
    "audio/ac3"
    "audio/amr"
    "audio/amr-wb"
    "audio/annodex"
    "audio/basic"
    "audio/flac"
    "audio/midi"
    "audio/mobile-xmf"
    "audio/mp2"
    "audio/mp3"
    "audio/mp4"
    "audio/mpeg"
    "audio/ogg"
    "audio/prs.sid"
    "audio/usac"
    "audio/vnd.audible.aax"
    "audio/vnd.audible.aaxc"
    "audio/vnd.dts"
    "audio/vnd.dts.hd"
    "audio/vnd.rn-realaudio"
    "audio/vnd.wave"
    "audio/webm"
    "audio/x-adpcm"
    "audio/x-aifc"
    "audio/x-aiff"
    "audio/x-amzxml"
    "audio/x-ape"
    "audio/x-dff"
    "audio/x-dsf"
    "audio/x-flac+ogg"
    "audio/x-gsm"
    "audio/x-iriver-pla"
    "audio/x-it"
    "audio/x-m4b"
    "audio/x-m4r"
    "audio/x-matroska"
    "audio/x-minipsf"
    "audio/x-mo3"
    "audio/x-mod"
    "audio/x-mpegurl"
    "audio/x-ms-asx"
    "audio/x-ms-wma"
    "audio/x-musepack"
    "audio/x-opus+ogg"
    "audio/x-pn-audibleaudio"
    "audio/x-psf"
    "audio/x-psflib"
    "audio/x-riff"
    "audio/x-s3m"
    "audio/x-scpls"
    "audio/x-speex"
    "audio/x-speex+ogg"
    "audio/x-stm"
    "audio/x-tak"
    "audio/x-tta"
    "audio/x-voc"
    "audio/x-vorbis+ogg"
    "audio/x-wavpack"
    "audio/x-wavpack-correction"
    "audio/x-xi"
    "audio/x-xm"
    "audio/x-xmf"
    "x-content/audio-cdda"
  ];
  video_mimetype = [
    "video/3gpp"
    "video/3gpp2"
    "video/annodex"
    "video/dv"
    "video/isivideo"
    "video/mj2"
    "video/mlt-playlist"
    "video/mp2t"
    "video/mp4"
    "video/mpeg"
    "video/ogg"
    "video/quicktime"
    "video/vnd.avi"
    "video/vnd.mpegurl"
    "video/vnd.radgamettools.bink"
    "video/vnd.radgamettools.smacker"
    "video/vnd.rn-realvideo"
    "video/vnd.vivo"
    "video/vnd.youtube.yt"
    "video/wavelet"
    "video/webm"
    "video/x-anim"
    "video/x-flic"
    "video/x-flv"
    "video/x-javafx"
    "video/x-matroska"
    "video/x-matroska-3d"
    "video/x-mjpeg"
    "video/x-mng"
    "video/x-ms-wmv"
    "video/x-nsv"
    "video/x-ogm+ogg"
    "video/x-sgi-movie"
    "video/x-theora+ogg"
  ];
  image_mimetype = [
    "image/apng   "
    "image/astc"
    "image/avif"
    "image/bmp"
    "image/cgm"
    "image/dpx"
    "image/emf"
    "image/g3fax"
    "image/gif"
    "image/heif"
    "image/ief"
    "image/jp2"
    "image/jpeg"
    "image/jpm"
    "image/jpx"
    "image/jxl"
    "image/jxr"
    "image/ktx"
    "image/ktx2"
    "image/openraster"
    "image/png"
    "image/qoi"
    "image/rle"
    "image/svg+xml"
    "image/svg+xml-compressed"
    "image/tiff"
    "image/vnd.adobe.photoshop"
    "image/vnd.djvu"
    "image/vnd.djvu+multipage"
    "image/vnd.dwg"
    "image/vnd.dxf"
    "image/vnd.microsoft.icon"
    "image/vnd.ms-modi"
    "image/vnd.rn-realpix"
    "image/vnd.wap.wbmp"
    "image/vnd.zbrush.pcx"
    "image/webp"
    "image/wmf"
    "image/x-3ds"
    "image/x-adobe-dng"
    "image/x-applix-graphics"
    "image/x-bzeps"
    "image/x-canon-cr2"
    "image/x-canon-cr3"
    "image/x-canon-crw"
    "image/x-cmu-raster"
    "image/x-compressed-xcf"
    "image/x-dcraw"
    "image/x-dds"
    "image/x-dib"
    "image/x-eps"
    "image/x-exr"
    "image/x-fpx"
    "image/x-fuji-raf"
    "image/x-gimp-gbr"
    "image/x-gimp-gih"
    "image/x-gimp-pat"
    "image/x-gzeps"
    "image/x-icns"
    "image/x-ilbm"
    "image/x-jng"
    "image/x-jp2-codestream"
    "image/x-kodak-dcr"
    "image/x-kodak-k25"
    "image/x-kodak-kdc"
    "image/x-lwo"
    "image/x-lws"
    "image/x-macpaint"
    "image/x-minolta-mrw"
    "image/x-msod"
    "image/x-niff"
    "image/x-nikon-nef"
    "image/x-nikon-nrw"
    "image/x-olympus-orf"
    "image/x-panasonic-rw"
    "image/x-panasonic-rw2"
    "image/x-pentax-pef"
    "image/x-photo-cd"
    "image/x-pict"
    "image/x-portable-anymap"
    "image/x-portable-bitmap"
    "image/x-portable-graymap"
    "image/x-portable-pixmap"
    "image/x-quicktime"
    "image/x-rgb"
    "image/x-sgi"
    "image/x-sigma-x3f"
    "image/x-skencil"
    "image/x-sony-arw"
    "image/x-sony-sr2"
    "image/x-sony-srf"
    "image/x-sun-raster"
    "image/x-tga"
    "image/x-tiff-multipage"
    "image/x-win-bitmap"
    "image/x-xbitmap"
    "image/x-xcf"
    "image/x-xcursor"
    "image/x-xfig"
    "image/x-xpixmap"
    "image/x-xwindowdump"
  ];
  genAppAttrs =
    app: mimetypes:
    builtins.listToAttrs (
      map (type: {
        name = type;
        value = app;
      }) mimetypes
    );
  audio_app = genAppAttrs config.defaultApplications.audioPlayer.entry audio_mimetype;
  video_app = genAppAttrs config.defaultApplications.videoPlayer.entry video_mimetype;
  image_app = genAppAttrs config.defaultApplications.imageViewer.entry image_mimetype;
in
{
  imports = [
    ./web-browser.nix
    ./file-manager.nix
    ./mail-client.nix
    ./audio-player.nix
    ./video-player.nix
    ./image-viewer.nix
    ./calendar.nix
    ./terminal-emulator.nix
    ./text-editor.nix
  ];
  defaultApplications = {
    webBrowser.program = "brave";
    fileManager.program = "cosmic-files";
    mailClient.program = "thunderbird";
    audioPlayer.program = "amberol";
    videoPlayer.program = "haruna";
    imageViewer.program = "loupe";
    calendar.program = "thunderbird";
    terminalEmulator.program = "kitty";
    textEditor.program = "zed";
  };
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = config.defaultApplications.fileManager.entry;
        "application/xhtml+xml" = config.defaultApplications.webBrowser.entry;
        "text/html" = config.defaultApplications.webBrowser.entry;
        "x-scheme-handler/chrome" = config.defaultApplications.webBrowser.entry;
        "x-scheme-handler/http" = config.defaultApplications.webBrowser.entry;
        "x-scheme-handler/https" = config.defaultApplications.webBrowser.entry;
        "x-scheme-handler/mailto" = config.defaultApplications.mailClient.entry;
        "text/calendar" = config.defaultApplications.calendar.entry;
        "application/x-terminal-emulator" = config.defaultApplications.terminalEmulator.entry;
        "x-scheme-handler/terminal" = config.defaultApplications.terminalEmulator.entry;
        "application/x-zerosize" = config.defaultApplications.textEditor.entry;
        "text/plain" = config.defaultApplications.textEditor.entry;
      }
      // audio_app
      // video_app
      // image_app;
    };
  };
}
