# TF2ServerForNoobs

### Please note, script is currently in a private-alpha stage of development, and will not be commited to this repository until it is functional.

An all-in-1 TF2 server installation script. From fresh linux install to working Team Fortress 2 dedicated server in minutes!

This is the easiest to use "one-click" installer for a dedicated TF2 server!

This project was initially started to allow people to use cloud-based virtual private servers for hosting their own TF2 servers. Take advantage of cheaper, hourly billing by being able to quickly and effortlessly spin-up and destroy a dedicated TF2 server.

No more messing around with SteamCMD. No more visiting serveme.tf and seeing nothing available for rent. Why pay to operate a server 24/7 when you only need it for a few hours a day?

# Benefits:

- Various competitive league configurations are included, ready to be used immediately. This includes both rulesets, as well as item, whitelists. Additionally, there is a script included for a 32-person pub.

- Plugins/integrations such as Sourcemod, cURL, SoapDM, MGE, Demos.tf (with auto-upload), LogsTF (with auto-upload), SupStats2, MedicStats, Pause, RecordSTV, WaitForStv, AFK, RestoreScore, FixStvSlot, and Updater. Original source and descriptions of many plugins: http://www.teamfortress.tv/13598/

- Cron-jobs are setup to take care of automatic maintenance if you want to leave the server running for long periods of time.

- No slot limitation. You can use this script to make a server for purpose you wish; highlander, 6s, or a 32-person instant respawn pubs.

- Retain full access to the server console. This script abstracts the already convenient LinuxGSM (found here: https://gameservermanagers.com/). You retain full control over your server using LinuxGSM.

# Requirements

- A computer running a recent version of Ubuntu Linux (preferably 32-bit, although 64-bit does work), with the ability to run bash scripts.
- Root access to said server

Note: For people inexperienced with linux servers, the install script will work fine on Ubuntu Desktop as well, although be aware that running a graphical user interface requires a significantly greater amount of resources. As such, you may need a higher performance VPS to host your server if you experience performance issues. I highly recommend choosing a cloud host that will automatically install the operating system for you (preferably Ubuntu Server), so that all you need to do is login and run my script.

# Other Tips

You will need to enter your API key(s) in the installation script for logs.tf and demos.tf for the auto-upload functionality to work.

It is recommended that you save a copy of this script onto your computer with your API keys already entered, so you don't have to re-enter them at each installation. 

This project is malware free, but it is always a good idea to verify the installation script yourself before running it.

This server does not come with any custom/pro/jump maps. You will have to transfer them to the server after it is up and running using any method of your choice.

Additionally, I only use Ubuntu Server for running/testing this script. I cannot verify/predict its success on other flavors of linux, so YMMV. If significant demand exists, I will create distro-specific versions of this script.

# Possible Future Features
- FastDL support
- Mumble quick-install functionality
