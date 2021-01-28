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
For optimal results, stand and look at this location at spawn 
![](https://i.imgur.com/S3rsN09.png)
5. Start the script  
Once you are standing and looking at the right spot and have filled in the parameters, press okay. Immediately click back on to your game and the script will start
in 3 seconds.
6. Check if it's working properly  
For some, this may not be an issue as the bot it still firing. However, the bot should be looking down every time it reloads. If it not, go look at [Troubleshooting](#Troubleshooting)

## Additional Notes
There are a couple of different hotkeys set for this program and they are as follows  

F1 will exit the app, use this if you lose control
F2 will stop the bot and you can change options. Press okay again and the bot will start running
Pause will pause the script

## Troubleshooting
1. The bot is not reloading everytime it looks down  
Adjust the Fire Delay or Reload Time. Use show ammo to help you debug as it will show you how much ammo the bot thinks you have. Pause the script using the pause
button at some points and check if the ammo in game matches the bots
2. The bot has veered off course  
Reduce the fire rate
3. Character in game has moved  
No current solution

## TO DO
1. Work on ensuring character doesn't get pushed out of the spot
2. Additional Features
3. Clean and comment code
