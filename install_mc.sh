#!/bin/sh

echo 'Start install script mc on QNAP'
echo 'making ipkg dirs'
mkdir -p /share/MD0_DATA/optware/opt
mkdir /share/MD0_DATA/optware/ipkglib
cd /; ln -sf /share/MD0_DATA/optware/ipkglib /usr/lib/ipkg
echo 'linking opt dir'
mv /opt /opt_old
cd /; ln -sf /share/MD0_DATA/optware/opt /opt
echo 'checking opt -> /share/MD0_DATA/optware/opt/'
cd /;ls -la
echo 'Download and the IPKG file package:'
cd /share/MD0_DATA/Download
wget http://ipkg.nslu2-linux.org/feeds/optware/cs05q3armel/cross/unstable/ipkg-opt_0.99.163-10_arm.ipk 
tar -xOvzf ipkg-opt_*_arm.ipk ./data.tar.gz | tar -C / -xzvf -
echo 'Change configuration file /opt/etc/ipkg.conf:'
echo "src cs05q3armel http://ipkg.nslu2-linux.org/feeds/optware/cs05q3armel/cross/stable" >> /opt/etc/ipkg.conf
echo 'Update Optware:'
/opt/bin/ipkg update
echo 'Verify installation:'
cd /share/MD0_DATA/optware 
/opt/bin/ipkg update 
/opt/bin/ipkg install slang 
/opt/bin/ipkg install mc --tmp-dir=/share/MD0_DATA/
echo 'Alter path to lift the need of providing full paths:'
PATH=$PATH:/opt/bin:/opt/sbin:"$PATH"
echo 'Run Midnight Commander:'
/opt/bin/mc
echo 'That’s all folks! Reboot your QNAP to see, if everything works just fine after restart'
