# ZOMBIES AFK Bot

## Description  
Zombies AFK Bot is a script that is to be used in Black Ops Cold War while in the the God mode glitch. The script will pan around in a semi-circle firing bullets 
along the way. Once it detects that ammo is low or empty, it will automatically buy ammo for you. This script is great for grinding camos as it will even 
readjust for vertical recoil for you. Just set it up and forget about it. 

## Assumptions  
Before we get into how to use this script, there are some key assumptions I made while creating this script. First of all, sensitivity must be set to **5.5**. 
Next, you must disable Depleted Ammo Weapon Switch in Cold War Settings. Lastly, all keybinds are assumed to be default

## How to Use

1. Install AutoHotKey
2. Run The Script
3. Fill in Settings   
First, choose the correct shot type in the drop down list. Then fill in your total amount of  
ammo, this is the ammo in the reserve plus the ammo in your mag right after purchasing from the ammo box. Once you have filled in the total ammo, click calculate.  
![](https://i.imgur.com/av48RX1h.jpg)  
Shots per Spot should now populate. Simply choose from the drop down list how many shots you want to bot to shoot a each position during the panning. Then fill in
your magazine size. Reload time is how long your gun takes to reload, you may have to play around with this to get it down right. Next is the fire delay. This is 
the amount of time the program waits after firing each bullet. The program cannot account for horizontal recoil, so the higher you set this, the less off the 
program will be over time. However, this comes at the cost that zombies are killed much slower. Play with the value to find the optimal one for you. If you have
time to periodically check the bot, you can use a high fire rate and just readjust the bot at it goes off course. The last two options, use field upgrade and show 
ammo are by default disabled. Use field upgrade will use your field upgrade after each ammo up and show ammo is used for debugging.  
![](https://i.imgur.com/1lmv8qn.png)
4. Stand in the right spot  
For optimal results, stand at this location at spawn  
![](https://imgur.com/S3rsN09)
