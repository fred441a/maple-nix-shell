{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "maple-env";
  multiArch = true;
  targetPkgs = pkgs: (with pkgs;
    [ gdk-pixbuf
      glib
      glibc
      gtk3-x11
      libkrb5
      zlib
      jdk17
      jdk8
      jre8
      freetype
      lsb-release
      gtk2 gtk3 webkitgtk gdk-pixbuf cairo pango
   atk 
    perl
    udev
    coreutils
    patchelf
    alsaLib
    coreutils
    dbus
    fontconfig
    gcc.cc
    gcc.libc
    glib
    ncurses
    opencv
    openssl
    unixODBC
    xkeyboard_config
    libxml2
    libuuid
    zlib
    libGL
    libGLU

    ]) ++ (with pkgs.xorg;
    [ 
    libX11
    libXext
    libXtst
    libXi
    libXmu
    libXrender
    libxcb
    libXcursor
    libXfixes
    libXrandr
    libICE
    libSM
    
    libXdamage
    libXcomposite
    libXScrnSaver
    libXt
    libXxf86vm
      libXext
      libXrender
      libXi
      libXtst
    ]);

  extraBuildCommands = "cp lib64/ld-linux-x86-64.so.2 lib64/ld-lsb-x86-64.so.3";
  runScript = "bash --rcfile maplerc"; #"_JAVA_AWT_WM_NONREPARENTING=1 ~/maple2023/bin/xmaple";

}).env
