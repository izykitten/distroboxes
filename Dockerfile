FROM registry.opensuse.org/opensuse/distrobox:latest

# Install packman-essentials and kde
RUN rpm -v --import \
    https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/repodata/repomd.xml.key \
 && zypper -n addrepo -cfp 90 \
   https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/ packman-essentials \
 && zypper -n dup --from packman-essentials --allow-vendor-change \
 && zypper -n in -t pattern kde_plasma \
 && zypper clean

# Install Sublime Merge
RUN rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg \
 && zypper -n addrepo -cfp 1000 https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo \
 && zypper -n in sublime-merge \
 && zypper clean

# Install VSCode
RUN rpm -v --import \
    https://download.opensuse.org/repositories/devel:/tools:/ide:/vscode/openSUSE_Tumbleweed/repodata/repomd.xml.key \
 && zypper -n addrepo -cfp 1000 obs://devel:tools:ide:vscode devel_tools_ide_vscode \
 && zypper -n in code \
 && zypper clean
 
#Install: Github CLI, nodejs, yarn, Seafile, KDEConnect, Syncthing, VLC
RUN zypper -n in gh \
                 nodejs-common yarn \
                 seafile-client kdeconnect-kde syncthing \
                 vlc vlc-codecs \
                 && zypper clean
