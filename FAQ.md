# Frequently Asked Questions Page

## Who are you?

A competitive TF2 player with experience in programming, servers, and cloud hosting.

## Does this script only work for Team Fortress 2?

Yes.

## How much does this script cost?

It is released free of charge, and is fully open source. See the license file for more details.

## Why did you develop this script?

I needed something with this functionality, but it didn't exist so I made it myself. Additionally, my experience using software such as Ansible/Puppet/Docker led to the inspiration for this project.

## Why doesn't this script work on \<insert linux distro here>?

It may or it may not. I make no guarantees and the script was only tested by me using Ubuntu.

## It's still not working!!!!111!!!

Run it as root.

## Why doesn't this script install custom maps for me?

It may become a feature in the future, but for now it is infeasible and beyond the scope of this project to operate a database of custom map downloads. You will have to manually find/download all of the custom maps you wish to use.

## Can you add \<other league>'s configs/whitelists/rulesets into this script?

If it is a legitimate TF2 competitive league (regardless of format), create an issue labelled "ruleset", with information about how I can access the offical ruleset of the league, and I will add it to the other Configs/whitelists/rulesets that accompany this script. Configs/whitelists/rulesets for pub servers/randomizer servers/x10 servers etc. will not be accepted at this time.

## Can you add \<insert plugin here> support?

If it is a widely-used plugin I will consider adding it. Create an issue with the label "plugin" containing any necessary information. If you create the request for a recently developed plugin, it is very unlikely that I will include it in this project, unless it is strongly supported by various, reputable members of the TF2 community.

## Can I use this script to create an MvM server?

Yes.

## Can you recommend me a VPS host?

I have used Vultr for hosting in the past and have personally had good experiences. If you decide to use them, you can use my [affiliate link](https://www.vultr.com/?ref=7321517); it does not cost you anything, and it greatly helps me continue the development and maintenance of this software, as well as other projects related to competitive TF2. Other common hosts (that I have not personally used) are Linode, Digital Ocean, Amazon Lightsail, TragicServers, Amazon Web Services, Microsoft Azure, Google Cloud Compute, and many more, each at their own level of reliability/price. I am not paid to promote, or endorsed by any of these services.

## Why would I use this instead of using a dedicated TF2 server hosting site?

If you subscribe to monthly server hosting, you are paying to run the server 24/7, even when it is completely empty. With my script, you only run the server for the amount of time you absolutely need, and therefore, can save significant amounts of money. Additionally, this script does not have slot limits which most dedicated hosts do.

You can run a cheap and low-performance 24/7 server with 12 fixed slots, or you can run a higher performance server for small lengths of time, with no slot restrictions, for very similar hosting costs. By not running the server 24/7, you may be able to afford a higher performance server for the same cost, yet have a much better experience, mostly in the form of lower ping and less lag.

## Isn't dedicated TF2 hosting easier to use?

For most people, yes. This script will require marginally more effort than handing over a credit-card to a dedicated TF2 hosting provider. There are many benefits to using my script as outlined in the readme and above, particularly in the areas of availability, cost, and performance.

This script only requires 1 command on a standard Ubuntu computer, which you can copy-paste, so it is pretty much as easy as it gets.

You save money here by sacrificing a small amount of convenience.

## Can I still use this script if I want to run my server 24/7?

Yes! The script makes installing a TF2 server from scratch extremely easy. Although the benefits of using it are most apparent when you are using short-lived VPS hosting, it works perfectly fine for running a 24/7 server as well.

In fact, since my script installs many of the common plugins and whitelists/rulesets for you, it is still easier and quicker to use it instead of using SteamCMD.

## Do you offer technical support for this script?

It is designed to be ran without modification on (up to date) Ubuntu Linux computers. As a result, I will not offer any support of any kind for other flavors of linux. Additionally, I will not provide support for how to modify this script as that goes against its main purpose anyways. Bug reports can be filed in this repository and I will investigate them. Generally, I can answer questions relating to issues you have.

Additionally, no paid support will be offered any time soon, if ever.

## How often are the whitelists/rulesets in this script updated?

I will generally update them manually every season, or during a season if someone alerts me to major changes. The whitelists/rulesets/league configurations used by the script are hosted in this repository, so you can check them at any time to see if they have been updated.

I am working on getting whitelist.tf integration so that whitelists will always be up-to-date.

## Can I contribute code to this project?

Yes, although guidelines/instructions for doing so are TBA.

## Can I use this script for commercial use?

Yes. You can do anything the MIT license allows you to.

## Can I donate to this project?

I made this project for my own convenience, and for my general love of TF2 and the community. You are not required to donate at all, and in fact, I would encourage you donate to a local charity instead. If you would like to send me TF2 items, you can [use my trade URL](https://steamcommunity.com/tradeoffer/new/?partner=69070534&token=72Ka5_zt), and I will add your name to a list of "Project Contributors" in this repository.

## Where does this script download all of the plugins from?

At the moment, everything downloaded by the scripts comes from their original sources. If bandwidth becomes an issue for these hosts, I will redistribute the files on my own. If you are the owner of one of the plugins that my script downloads, please contact me and I will remove your site as a host.

## Is this script safe to use?

I have not included any malware or unwanted software in this script, and given its open source status you are free to verify it for yourself. I cannot guarantee that the plugins downloaded by this script will always be free of malware as that is out of my control. Although this has never happened, I cannot guarantee what third-party developers include in their software. Please alert me if you have concerns over any of the software used by this script.
