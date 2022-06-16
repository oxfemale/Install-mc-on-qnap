# Install-mc-on-qnap
Install Optware (IPKG) on QNAP TS-210 with QTS 4.x

With introduction of QTS 4.x:

there are a lot of changes in QNAP’s Control Panel, including the fact that “Application Servers” component is gone,
neither Optware nor IPKG or QPKG elements are available for download in the “App Center”.
This causes my “Installing Optware (IPKG) on QNAP TS-210” (6,5 year old!) article to be completely outdated.

Currently then only way to install Optware is to go through Manual instalation as described in QNAP Wiki.

Since I went through this guide and can confirm that it is working, I will be enough nasty to copy-paste that article here (removing stuff not related to QNAP TS-210 and fixing some bugs).

To go through these steps you need a shell access to your QNAP. Using the PuTTY is the most obvious answer.

But wait! There’s a much better way. QNAP introduced a gem called “shellinabox“, available in App Center (or here or here). I strongly recommend to use it, because with it, you need a web browser!

=======================
Install Optware
Create the required directories:

mkdir -p /share/MD0_DATA/optware/opt
mkdir /share/MD0_DATA/optware/ipkglib
cd /; ln -sf /share/MD0_DATA/optware/ipkglib /usr/lib/ipkg
Create a symbolic link to /opt:

rm -rf /opt
cd /; ln -sf /share/MD0_DATA/optware/opt /opt
Check, if /opt is correctly symlinked:

cd /
ls -la
You should see (among other results, i.e. folder contents):

opt -> /share/MD0_DATA/optware/opt/
Download and the IPKG file package:

cd /share/MD0_DATA/Download
wget http://ipkg.nslu2-linux.org/feeds/optware/cs05q3armel/cross/unstable/ipkg-opt_0.99.163-10_arm.ipk 
tar -xOvzf ipkg-opt_*_arm.ipk ./data.tar.gz | tar -C / -xzvf -
Change configuration file
Run Vi:

vi /opt/etc/ipkg.conf
Add following line to the end of file:

src cs05q3armel http://ipkg.nslu2-linux.org/feeds/optware/cs05q3armel/cross/stable
Then:

Save /opt/etc/ipkg.conf file — hit Esc, type :w and confirm with Enter.
Quit VI — hit Esc, type :q and confirm with Enter.
You may want to execute cls to clean the console screen.

Update Optware
Update the package list:

/opt/bin/ipkg update
You should see:

Downloading http://ipkg.nslu2-linux.org/feeds/optware/cs05q3armel/cross/stable/Packages 
Updated list of available packages in /opt/lib/ipkg/lists/cs05q3armel 
Successfully terminated.
Verify installation
Do this by installing Midnight Commander:

cd /share/MD0_DATA/optware 
/opt/bin/ipkg update 
/opt/bin/ipkg install slang 
/opt/bin/ipkg install mc --tmp-dir=/share/MD0_DATA/
Run Midnight Commander:

/opt/bin/mc
Alter path to lift the need of providing full paths:

PATH=$PATH:/opt/bin:/opt/sbin:"$PATH"
