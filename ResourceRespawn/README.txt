Before you install this mod please make a backup of your "data" folder.

Keep in mind that the mod does not change the way the originals work.
It just adds some lines to enable the startingsectors resources to respawn.

In order for resources to respawn the following conditions must be met:
The sector must have less than 5 "rich" resource asteroids.
The sector must have less than 20 regular resource asteroids floating about.

What the mod will do for you:

It will respawn small resource asteroids whenever the above conditions are met.
This will occur: When the server is started.

In order to install this mod please copy the "data" folder to your "Avorion" install folder.
This will request an overwrite of the concerning folders.
Please complete the overwrite and it should work automatically.

Before launching your server please make sure you configure this mod.
Open data/scripts/sector/respawnresourceasteroids.lua

And find line 16 "SSector = {-154, 422}".
Please replace the numbers with the location of your starting sector.

If you want resources to respawn anywhere using the same script please change the following line.
"RespawnAll = 0"

to

"RespawnAll = 1"