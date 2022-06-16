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
