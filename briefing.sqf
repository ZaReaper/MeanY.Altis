// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: briefing.sqf

if (!hasInterface) exitWith {};

_trimName = { _this select [1, count _this - 2] };
_aKeyName = { _arr = actionKeysNamesArray _this; if (count _arr == 0) exitWith {"<UNDEFINED>"}; _arr select 0 };

#define NKEYNAME(DIK) (keyName DIK call _trimName)
#define AKEYNAME(ACT) (ACT call _aKeyName)

waitUntil {!isNull player};

player createDiarySubject ["infos", "Infos and Help"];
player createDiarySubject ["changelog", "Changelog"];
player createDiarySubject ["credits", "Credits"];

player createDiaryRecord ["changelog",
[
"v1.2",
"
<br/>[Added] Mag Repack by Outlawled (Ctrl + " + NKEYNAME(19) + ")
<br/>[Added] Adjustable NV by xx-LSD-xx (Shift + PageUp/Down)
<br/>[Added] New vehicle store paintjobs
<br/>[Added] Town spawn cooldown
<br/>[Added] Ghosting timer
<br/>[Added] Object lock restriction near stores and missions
<br/>[Added] Headless client object saving
<br/>[Added] Time and weather saving
<br/>[Changed] Expanded UAV control restriction to quadcopters
<br/>[Changed] Injured players no longer count as town enemies
<br/>[Changed] Upgraded extDB to extDB2 by Torndeco
<br/>[Changed] Updated antihack
<br/>[Fixed] Old spawn beacons no longer shown on spawn menu
<br/>[Fixed] Multiple money duping exploits
<br/>[Fixed] Vehicles and objects sometimes disappearing from DB
<br/>[Fixed] Severe injuries caused by jumping over small ledges
<br/>[Fixed] Antihack kicks due to RHS, MCC, AGM, ACE3, ALiVE
<br/>[Fixed] Various minor bugfixes and optimizations
"
]];

player createDiaryRecord ["changelog",
[
"v1.1b",
"
<br/>[Added] Marksmen DLC content
<br/>[Added] Prevent usage of commander camera
<br/>[Added] Emergency eject hotkey (Ctrl + " + AKEYNAME("GetOut") + ")
<br/>[Added] Restricted UAV connection to owner's group
<br/>[Changed] Improved purchased vehicle setup time
<br/>[Changed] Admins can now use global voice chat
<br/>[Changed] Updated antihack
<br/>[Fixed] Corpses not being ejected from vehicles
<br/>[Fixed] Thermal imaging not working for UAVs
<br/>[Fixed] Various minor bugfixes and optimizations
"
]];

player createDiaryRecord ["changelog",
[
"v1.1",
"
<br/>[Added] ATMs
<br/>[Added] Union Jack vehicle color
<br/>[Added] Skins hidden in gamefiles for MH-9, Mohawk, and Taru
<br/>[Added] Improved admin spectate camera by micovery
<br/>[Added] Earplugs (End key)
<br/>[Changed] Full rewrite of vehicle respawning system
<br/>[Fixed] Player moved to position too early during save restore
<br/>[Fixed] Mission timeout not extending on AI kill
<br/>[Fixed] Admin teamkill unlocking
<br/>[Fixed] Improved FPS fix
<br/>[Fixed] Running animation parachute glitch
<br/>[Fixed] Various other minor bugfixes and optimizations
"
]];

player createDiaryRecord ["changelog",
[
"v1.0c",
"
<br/>[Added] MySQL support via extDB extension
<br/>[Added] Town Invasion mission
<br/>[Added] Chain-reaction player kill tracking
<br/>[Added] Force Save action for purchased and captured vehicles
<br/>[Added] Autokick players previously detected by antihack
<br/>[Added] Entity caching script for headless client
<br/>[Added] Tron suits to general store
<br/>[Added] Red lines on map for AIs wandering away from missions
<br/>[Changed] Mission timeout gets extended on AI kill
<br/>[Changed] Transport Heli mission Taru variant to Bench
<br/>[Changed] Spawn beacon item drop to sleeping bag
<br/>[Fixed] More money exploits
<br/>[Fixed] Scoreboard ordering
<br/>[Fixed] Vehicle repair and refuel sometimes not working
<br/>[Fixed] Injured players' corpses being deleted on disconnect
<br/>[Fixed] Static weapon disassembly prevention
<br/>[Fixed] Excess bought rockets ending up in uniform or vest
<br/>[Fixed] Various other minor bugfixes and optimizations
"
]];

player createDiaryRecord ["changelog",
[
"v1.0b",
"
<br/>[Added] Helicopters DLC content
<br/>[Added] Revamped respawn menu
<br/>[Added] 250m altitude limit for territory capture
<br/>[Added] HALO insertion on spawn beacons
<br/>[Added] New vehicle store textures
<br/>[Changed] Increased damage done to planes by 50%
<br/>[Changed] Plane engines shutdown when above 90% damage
<br/>[Changed] Player names can also be toggled with Home key
<br/>[Changed] Increased ATGM UAV price
<br/>[Changed] Increased prices from thermal scopes again
<br/>[Changed] Minor edits to spawn loadouts
<br/>[Fixed] FPS drop that began in v0.9h
<br/>[Fixed] Saved UAVs not being connectable
<br/>[Fixed] Indies unable to get in UGVs
<br/>[Fixed] Blinking fog
<br/>[Fixed] Clipped numbers on scoreboard
<br/>[Fixed] Minor other optimizations and fixes
"
]];

player createDiaryRecord ["changelog",
[
"v1.0",
"
<br/>[Added] Custom scoreboard
<br/>[Added] Mission and store vehicle saving
<br/>[Added] Player markers on GPS and UAV Terminal
<br/>[Added] Holster actions
<br/>[Changed] Full rewrite of side mission system
<br/>[Changed] Windows key toggles player marker names too
<br/>[Changed] New loading picture by Gameaholic.se
<br/>[Fixed] Weapon sometimes disppearing when moving objects
<br/>[Fixed] More money duping exploits
<br/>[Fixed] Store menu sizes on smaller aspect ratios
<br/>[Fixed] Hunger and thirst reset on rejoin
<br/>[Fixed] Other minor optimizations and fixes
"
]];

player createDiaryRecord ["changelog",
[
"v0.9h",
"
<br/>[Added] Custom revive system based on Farooq's Revive
<br/>[Added] Territory payroll at regular intervals
<br/>[Added] Emergency eject and free parachutes (jump key)
<br/>[Added] Player names toggled with Windows key
<br/>[Added] Increased missile damage against tanks and helis
<br/>[Added] Ability to stash money in weapon crates
<br/>[Added] Ability to sell vehicle inventory at stores
<br/>[Added] More money shipment mission variants
<br/>[Added] Reduced wheel damage from collisions
<br/>[Added] Wreck salvaging
<br/>[Added] Selling bin in stores
<br/>[Added] Karts DLC content in stores
<br/>[Added] Camo sniper rifles in gunstore
<br/>[Added] Repair Offroad in vehicle store
<br/>[Added] Team players on map as server option
<br/>[Added] Unlimited stamina server option
<br/>[Added] Static weapon saving server option
<br/>[Added] More push vehicle actions
<br/>[Added] Paradrop option for airlifted vehicles
<br/>[Added] Preload checkbox on respawn menu
<br/>[Added] Remote explosives store distance restriction
<br/>[Added] Server time multipliers for day and night
<br/>[Added] Addon-less profileNamespace server persistence
<br/>[Added] Linux server compatibility
<br/>[Added] Basic support for headless client
<br/>[Changed] Independent territory capture is now group-based
<br/>[Changed] Towns blocked if more enemies than friendlies
<br/>[Changed] Increased ammo/fuel/repair cargo for resupply trucks
<br/>[Changed] Increased territory capture rewards for Altis
<br/>[Changed] Increased money mission rewards
<br/>[Changed] Weapon loot in buildings now disabled by default
<br/>[Changed] Mission crates loot was made more random
<br/>[Changed] Thermal imaging is now available on UAVs
<br/>[Changed] Increased vehicle store prices
<br/>[Changed] Increased prices for thermal optics
<br/>[Changed] Increased player icons up to 2000m
<br/>[Changed] Improved antihack
<br/>[Changed] Improved FPS
<br/>[Fixed] Vehicle store purchase errors due to server lag
<br/>[Fixed] Corpse created when leaving with player saving
<br/>[Fixed] Custom vehicle damage handling not working
<br/>[Fixed] Indie-indie spawn beacon stealing
<br/>[Fixed] Repair kit and jerrycan distance limit
<br/>[Fixed] Spawn beacon packing and stealing restrictions
<br/>[Fixed] Not able to lock static weapons
<br/>[Fixed] Unbreakable store windows
<br/>[Fixed] Stratis airbase gunstore desk glitches
<br/>[Fixed] Missions sometimes completing instantaneously
<br/>[Fixed] Object ammo/fuel/repair cargo not saving
<br/>[Fixed] Respawn menu aspect ratio on some resolutions
<br/>[Fixed] Minor bugs with group system
<br/>[Fixed] Minor bugs with player items
<br/>[Fixed] Various other minor bugfixes and optimizations
"
]];

player createDiaryRecord ["changelog",
[
"v0.9g",
"
<br/>[Added] - Vehicle stores
<br/>[Added] - New lootspawner by Na_Palm, stuff in ALL buildings
<br/>[Added] - New jets and truck added in A3 v1.14
<br/>[Added] - New AAF vehicles added in A3 v1.08
<br/>[Added] - New camos for Mk20 and MX in gunstores
<br/>[Added] - Ability to push plane backwards
<br/>[Added] - Ability to sell quadbike contents like crates
<br/>[Added] - Abort delay during combat when player saving on
<br/>[Changed] - Improved respawn menu
<br/>[Changed] - Respawn now longer to preload destination
<br/>[Changed] - Optimized player icons
<br/>[Changed] - Optimized FPS fix
<br/>[Changed] - Improved server persistence (requires iniDBI v1.4+)
<br/>[Changed] - Improved player saving (server-specific)
<br/>[Changed] - Improved base saving (server-specific)
<br/>[Changed] - Reduced starting gear
<br/>[Changed] - Modified some store prices
<br/>[Changed] - Reduced initial fuel in cars and helis
<br/>[Changed] - Removed Buzzard jet from too short runways
<br/>[Changed] - Removed Kavala castle territory for use as base
<br/>[Changed] - Increased vehicle repair time to 20 sec.
<br/>[Changed] - Increased owner unlocking time to 10 sec.
<br/>[Changed] - Toggling spawn beacon perms is now instant
<br/>[Changed] - Improved Take option for player items
<br/>[Changed] - Added option to cancel towing selection
<br/>[Changed] - Added machine gunner to main mission NPCs
<br/>[Changed] - Added grenadier to side mission NPCs
<br/>[Fixed] - Error messages in various menus
<br/>[Fixed] - Crash when toggling spawn beacon perms
<br/>[Fixed] - Error when hacking warchests
<br/>[Fixed] - Vehicle towing and lifting positions
<br/>[Fixed] - Repair Vehicle option showing for brand new vehicles
<br/>[Fixed] - Vest purchase price
<br/>[Fixed] - Vest and helmet armor value
<br/>[Fixed] - NPC leader now has launcher ammo
"
]];

player createDiaryRecord ["changelog",
[
"v0.9f",
"
<br/>[Added] - Money missions
<br/>[Added] - Sell Crate Items option at stores when moving crate
<br/>[Changed] - Reorganized loots for crates and trucks
<br/>[Fixed] - Broken Warchest menu
<br/>[Fixed] - Spawn beacons not working for Independent groups
<br/>[Fixed] - Player icons position inside buildings
<br/>[Fixed] - MRAPs and quadbikes not spawning
<br/>[Fixed] - Broken money rewards for territories
"
]];

player createDiaryRecord ["changelog",
[
"v0.9e",
"
<br/>[Added] - Territory system
<br/>[Added] - Jumping option (step over while running)
<br/>[Added] - New weapons from v1.04 update
<br/>[Changed] - Water and food now use water bottles and baked beans
<br/>[Fixed] - Store object purchases not operating as intended
<br/>[Fixed] - Objects purchased from stores not saving properly
<br/>[Fixed] - Minor server-side memory leak
"
]];

player createDiaryRecord ["changelog",
[
"v0.9d",
"
<br/>[Added] - Store object purchases
<br/>[Changed] - New UI by KoS
"
]];

player createDiaryRecord ["changelog",
[
"v0.9c",
"
<br/>[Changed] - Instant money pickup and drop
<br/>[Changed] - Increased plane and heli spawning odds
<br/>[Fixed] - FPS fix improvements
<br/>[Fixed] - Vehicles disappearing when untowed or airdropped
"
]];

player createDiaryRecord ["changelog",
[
"v0.9b",
"
<br/>[Initial release] - Welcome to Altis!
"
]];

player createDiaryRecord ["MatureAnzacGamers",
 [
"Mature Anzac Gamers",
"
<br/> -22/6/15 
<br/> -Rebuild database, some saving script tweaks for performance
<br/> -Rebuild AI zone triggers
<br/> -Added in disable/enable environment button on player menu (Play with this, may or may not help performance)
<br/> -Relocated a bunch of mission spawn locations

<br/> -16/6/15
<br/> -Independent bag item duping glitch re-fixed.
<br/> -Rocket lock on cross-hair enabled
<br/> -New fix to prevent fog limiting view range
<br/> -Sitting down and then being tied up glitch fixed
<br/> -Increased "NEAR" player view range setting to prevent grass flattening exploit
<br/> -Fixed various typos and rearranged some functions to be more efficient

<br/> -28/5/15
<br/> -Fixed high value target script (Also rewrote and split up my hacked money value script)
<br/> -Minor tweaks to base lockers and base locker hacking (server message on a locker being hacked is not working yet)
<br/> -Tweaked weapon smugglers missions (balancing)
<br/> -Adjusted and forced Altis Patrol mission payout

<br/> -27/5/15
<br/> -Fixed high value target script (Also rewrote and split up my hacked money value script)
<br/> -Minor tweaks to base lockers and base locker hacking (server message on a locker being hacked is not working yet)
<br/> -Tweaked weapon smugglers missions (balancing)
<br/> -Adjusted and forced Altis Patrol mission payout

<br/> -24/5/15
<br/> -Items on restart will now be removed if not saved
<br/> -Added in High value target for carrying too many drugs, also adjusted high value target value
<br/> -Updated money anti-hack script
<br/> -Increased time to hack base locker to 30<br/> - minutes
<br/> -Added new Money missions - Patrol convoy
<br/> -Added first try at a AI wave capture zone. (Athira)  (Testing, first try)
<br/> -Disable base menu if the base locker is not locked. (Stop people using base lockers in someone else's bse to instant capture it)
<br/> -Fixed Road Block and Altis Convoy missions
<br/> -Fixed LSD store sell value
<br/> -Adjusted AI zones to improve server performance
<br/> -Increased teamspeak bandwidth so Pastor can use more words

<br/> -15/5/15
<br/> -Re-enabled 3rd person, working on a new method to fix corner camping

<br/> -13/5/15
<br/> -First try at conditional first/third person script implemented. (Third for all modes except when the weapon is out. Holster your weapon to stay in third person)

<br/> -12/5/15
<br/> -Added 3 new missions - GeoCache and Roadblock
<br/> -Added new currency to the general stores and some missions (Player item instead of money, can be sold at stores or given to other characters
<br/> -Disabled downed jet mission
<br/> -Removed camo nets (No one was using them)
<br/> -Disabled custom view distances in player menu
<br/> -Fixed client side FPS temporarily by disabling all environmental sounds/effects (Ambient sounds/rabbits mainly) Will re-enable once they fix the problem
<br/> -Added option to delete old spawn beacons
<br/> -Tweaked thermal vision script to optimise waitUntil reducing CPS load (Cycles per second server side) 
<br/> -Removed AI artillery tanks for now, Balance these on the break
<br/> -Air drop adjusted to be more reliable at delivering your cargo
<br/> -Roadblock mission should be fixed (Forgot to define global variable for mission marker arrays)

<br/> -8/5/15 
<br/> -Adjusted AI zones to occasionally be more exciting. Turned off helicopters for now as well
<br/> -Changed the server memory allocator to a custom one to try help the FPS issue until they patch it
<br/> -Added some script optimisations to try make findSafePosition work better with less server load
<br/> -Found out the daMauler is the cause of every and all problems we have after extensive server analysis
<br/> -Updated CBA to the latest RC6 Hotfix version (Clients don't have to, server requires it)

<br/> -7/5/15 
<br/> -Fixed heaps of script errors and optimisations
<br/> -Script fixed and working - thermals disabled on all launchers(Enabled only for laser designator and UAV’s)
<br/> -Added the ability to stealth knife AI and players if they are not in your group. Can also knife people who are injured for that personal touch
<br/> -Fixes to unflip vehicle
<br/> -Fixes to AI zones until Bohemia fix the FPS issues
<br/> -Fixed insertion parachute airdrop function, will no longer remove your backpack or give you a parachute.

<br/> -6/5/15 
<br/>  -Added flagpole halo jump and evac sites on the map. (Flag pole in stores)
<br/>  -More minor fixes to spawn beacons
<br/>  -Fixed error in airdrop script
<br/>  -Blocked objects from being locked within 100m of stores/mission markers

<br/> -5/5/15
<br/>  -Thermals back to normal for now
<br/>  -First try at a fix for exploding vehicles on spawn
<br/>  -Added safe zones to general stores to stop people camping in the store vendor building
<br/>  -Fix spawn beacons not showing up correctly at all times
<br/>  -Air drops won’t take as long to get to you now
<br/>  -Adjusted AI zones
<br/>  -players can only have 3 spawn beacons each
<br/>  -Base items should no longer be deleted (aw yeah. I know some people have been waiting for this.) - needs to be confirmed

<br/> -27/4/15
<br/>  -Further code adjustments on base item saving
<br/>  -Hand grenade damage and damage radius increased
<br/>  -More Antihack updates (Trying to fix false positive random ban)
<br/>  -Updated changelog on mission map
<br/>  -Another fix for damaged base items (Hopefully completely solved now)

<br/> -27/4/15
<br/>  -Further code adjustments on base item saving
<br/>  -Hand grenade damage and damage radius increased
<br/>  -More Antihack updates (Trying to fix false positive random ban)
<br/>  -Updated changelog on mission map
<br/>  -Another fix for damaged base items (Hopefully completely solved now)

<br/>-25/4/15
<br/> -Bounty mission added to mark players holding over a certain amount of money (Attempt to increase PVP.)
<br/> -Three new stores added using the possible new store icons
<br/> -Script added to detect and mark and shame and cheaters increasing player money value (Can not auto ban due to client side scripts. If you see this log the name and value so we can ban them. I may make it auto wipe the characters money and gear instead.)
<br/> -Side channel disabled to reduce chat spam
<br/> -Fixed script restriction kick when airdropping food sacks.

<br/>-24/4/15
<br/> -New hud (Aww yeah, tell me what you think)
<br/> -Blufor team deleted
<br/> -Boxes hopefully won't break now
<br/> -Other minor fixes
<br/> -Some icons updated in game to be more cool...
<br/> -Day/Night times adjusted. Days 4 hours. Night 1 hour
<br/> -MeanY is awesome.....Chappy is ok as well I guess

<br/> -21/4/15
<br/> -More code changes made to force base items indestructible. 
<br/> -Town AI skill adjustments (slightly harder)
<br/> -First pass on trying to make civilians fight more like soldiers (Mission AI)
<br/> -Base locker should now be indestructible as well (Someone wanna spend some cash to test?)
<br/> -Some minor code tweaks to try make base saving more reliable.
<br/> -AI update so they search for cover better (was affecting server performance, client frame rates should be better when engaging AI)


<br/> -13/4/15
<br/> -Updated starter kit to include a NVGs so you can engage red zones at night on respawn Also added smoke nades and grenade to starting kit. 
<br/> -Fixed base objects being destroyed. Definitely indestructible now.
<br/> -Fixed stores getitem info script (Couldn’t see general store prices or uniform/backpack sizes)
<br/> -Made changes to personal UAV system so only members of the owners group can connect to your UAV, not the whole team. 
<br/> -Added Stabb to the whitelist ;)
<br/> -Added mobile laser designator to items that can be loaded into vehicles and moved.
<br/> -Fixed sniper rifle variants in store after the SOS became the MOS. Those rifles now come with a LPRS on purchase.
<br/> -Fixed money dupe exploit (Didn’t think anyone found it before fixed)
<br/> -Renamed MAG whitelist slots with class type on the end so you know which is medic or engineer/sniper/diver
<br/> -Fixed rare save/load conditions where you player kit would be wiped.
<br/> -Uniform checks updated so you can now see all the new vests and ghillie suits.
<br/> -Other minor bugfixes and optimisations.

<br/>-12/4/15 
<br/> -Hardware upgrades and routing fix to sql server (Host side)
<br/> -Server memory increased to 4gb
<br/> -Backpacks no longer resupply from AI on Blufor. Unsure about independents. 
<br/> -AI zones tweaked to occasionally include an AI transport chopper coming in with reinforcements. Transport trucks also working on patrol in some zones. 
<br/> -AI tweaked and currently feel quite good. Balance is back to just about right I think (Feedback welcome)

<br/>-11/4/15
<br/> -AI skill tweaks
<br/> -Magic player dots on the map removed
<br/> -White-listing for MAG implemented. Other players can join but will be immediately moved back to the lobby.
<br/> -Server side CBA_A3 updated to the latest version RC6 (still supporting RC4 and RC3)
<br/> -Enemy red zones overhauled. Split all zones up so there will be more diversity on zones having trucks/static or not.
<br/> -Performance tweaks
<br/> -AI Mortars temporarily disabled while I complete damage reduction code 
<br/> -Vest armour now has more effect. This applies to AI as well.
<br/> -AI should now use Bi-pods
<br/> -All base items should now be indestructible - Now more broken towers and garages(Needs to be confirmed)
<br/> -Bandwidth tweaks to try and reduce de-sync issues
<br/> -Player slots increased to 32
<br/> -Girl camo should be fixed
<br/> -Explosives are no longer visible on the map to other teams.

<br/>-10/4/15
<br/> -Base locker radius increased to 75m
<br/> -Zafir ammo class fixed in stores (new more powerful ammo was added_
<br/> -Supply air drop ammo crate updated with new ammo types
<br/> -Removed duplicate ammo from stores lists
<br/> -New girl camo added (Compliments of Fazz)
<br/> -Changelogs added to Briefing.sqf so players can see it under map menu

<br/>-9/4/15
<br/> -Server updated to marksman, no major issues so far
<br/> -Misspelled the 338 suppressors in stores. Updated
<br/> -Fixed sell box contents for weapons (Now that bipods are in it doesn’t strip the gun properly. Increase attachments number so it is handled correctly)
<br/> -Added missing items to store. Some more uniforms and remote designator
<br/> -Lowered price of the Grave (For Padre)
<br/> -Removed CCTV camera’s due to antihack script kicking when using them. Better to keep antihack increased then allow the camera’s (Would open people who know how the ability to spawn money)
<br/> -Added base locker item to store. 
<br/> -Added base locking location item. Pin code access but can be hacked. Will relock all items and other functions. Can also use it to turn lights on and off. Will prevent base griefing.(Hide it well). Other players can not place items in range or remove/unlock items in range. Have a play with this and report any bugs. 

<br/>-8/4/15
<br/> -Setup auto restart at 6:30 for steam update - Ill be asleep
<br/> -Enabled all code for DLC items and weapons in stores - New version will load after auto update (Don't buy new guns until the update releases, they are in the list already)
<br/> -Removed some inefficient items on the map increasing performance a lot (I got 15-25   fps)
<br/> -Tweaked AI slightly trying to find the sweet spot
<br/> -Completed a second pass on balancing guns and vehicle prices

<br/>-8/4/15
<br/> -Setup auto restart at 6:30 for steam update - Ill be asleep
<br/> -Enabled all code for DLC items and weapons in stores - New version will load after auto update (Don't buy new guns until the update releases, they are in the list already)
<br/> -Removed some inefficient items on the map increasing performance a lot (I got 15-25   fps)
<br/> -Tweaked AI slightly trying to find the sweet spot
<br/> -Completed a second pass on balancing guns and vehicle prices


<br/>-7/4/15
<br/> -Balanced light vehicles in zones. Removed GMG’s and HMG’s, Only transport trucks with infantry will be patrolling. You can choose to blow them up to avoid them all deploying and spreading out or attack the town and prepare for the reinforcements when they locate you. 
<br/> -Edited Donation instructions and teamspeak instructions to funnel users to the MAG site. 
<br/> -Air drop fixed and should now be working (I tested it and it didn’t kick or kill me)
<br/> -All antihack improved after fixing the air drop issue. 
<br/> -3 special MAG camo’s added compliments of Fazz on the graphics
<br/> -Fixed notifymenu.sqf script error on client log in 
<br/> -Fixed CBA version spawn on joining server
<br/> -Removed iniDB and got extDB loaded and working….thats right working I tell you!!!!!. It 4am so it took a while but it’s working!!!!!

<br/>-6/4/15
<br/> -Air drop coding added to mission file. Not enable yet due to Anti hack slaying on vehicle creation. 
<br/> -Tweaked Eos zones, reduced activation range and added light vehicles to possible pool.(Also fixed them after breaking them by accident)
<br/> -Added code for mortar projectile damage reduction  (Will take 3 hits to kill a player)
<br/> -All marksmen items and rifles have been coded in. Everything is commented out awaiting update.
<br/> -Fixed box saving
<br/> -Increased AI aiming speed but lowered AI accuracy. This should increase the battle effects and sense of being suppressed while the AI tries to land a shot. 

<br/>-5/4/15
<br/> -Automatic restart added at 1 AM, 9AM and 5PM AEST - Implemented countdown notice. needs testing
<br/> -Included battleye filters to detect and kick hackers
<br/> -Mission class updated and -init added to command line to force wasteland auto load on restart.  
<br/> -Can now put explosive on vehicles and touch them off at range (Vehicles as bait?)
<br/> -Doubled server memory allocation
<br/> -Player slot mismatch in mission.sqm vs Description.ext fixed
<br/> -Fixed typo in enemy outpost  side mission and incorrect colour defines for extra town invasion missions
<br/> -MySQL setup on server ready for database migration attempts. (ExtDB)

<br/>-4/4/15
<br/> -BattleWarden RCON tool fully operational now. I'll leave trusty RCON recruiting to you Reaper. 
<br/> -250ms ping limit enforced
<br/> -Store inventory overhaul on existing stores
<br/> -Many new items added
<br/> -First pass on balancing prices and weights of base parts
<br/> -Implement long timer to unlock other players base parts (prevent base griefing)
<br/> -Ubeen/Fweedom Bug report - Resupply and owner trucks exploding - Painted all NPC trucks with anti nuclear coating. - FIXED
<br/> -Added secret new chopper feature - Will be used in a custom mission at later date. Fast Ropes
<br/> -Re-enabled mission vehicles saving
<br/> -Disabled locked static weapons from saving after restart
<br/> -Implemented new box for player storage (May not save after restart yet, ran out of time, needs testing)
<br/> -Fixed typo in AI behaviour script
<br/> -Initial investigation on new database system (I may be able to migrate the poxy one we have to the new Sql one without a server wipe.)
"
]];

player createDiaryRecord ["changelog",
 [
"NL United",
"
<br/> [Added] Ability to change uniform texture
<br/> [Added] Custom view distance ability
<br/> [Added] Show R.I.P. map marker on corpse location after death
<br/> [Added] Multiplying money reward for players that stay on the server
<br/> [Added] Changed the appearance of the store NPCs
<br/> [Added] Added several new vehicle textures
<br/> [Added] Sell and Change Ownership trucks
<br/> [Added] Vehicle locking and info script by Micovery
<br/> [Added] Locked vehicle hotwire in at a cost
<br/> [Added] Heal self script
<br/> [Added] Access to DLC Helicopter pilot seat without DLC
<br/> [Added] Patrol mission: Airport patrol
<br/> [Added] Extra missions: Hostile Jet, Smugglers, Snipers and Hack laptop 
<br/> [Added] Intro script
<br/> [Added] Player controlled IP cameras
<br/> [Added] Device detector (IP Cameras and Spawn Beacons)
<br/> [Added] Resupply truck
<br/> [Added] UAV for player only unlock by BadVolt and Micovery
<br/> [Added] Mortar to one mission as reward
<br/> [Removed] Mortar from store
<br/> [Changed] Raise some prices
<br/> [Changed] Vehicles spawn in locked and with engine on
<br/> [Changed] Old R3F script to 3.1
"
]];



player createDiaryRecord ["credits",
[
"Credits",
"
<br/><font size='16' color='#BBBBBB'>Developed by A3Wasteland.com:</font>
<br/>	* AgentRev (TeamPlayerGaming)
<br/>	* JoSchaap (GoT/Tweakers.net)
<br/>	* MercyfulFate
<br/>	* His_Shadow (KoS/KillonSight)
<br/>	* Bewilderbeest (KoS/KillonSight)
<br/>	* Torndeco
<br/>	* Del1te (404Games)
<br/>
<br/><font size='16' color='#BBBBBB'>Original Arma 2 Wasteland missions by:</font>
<br/>	* Tonic
<br/>	* Sa-Matra
<br/>	* MarKeR
<br/>
<br/><font size='16' color='#BBBBBB'>Improved and ported to Arma 3 by 404Games:</font>
<br/>	* Deadbeat
<br/>	* Costlyy
<br/>	* Pulse
<br/>	* Domuk
<br/>
<br/><font size='16' color='#BBBBBB'>Other contributors:</font>
<br/>	* 82ndab-Bravo17 (GitHub)
<br/>	* afroVoodo (Armaholic)
<br/>	* Austerror (GitHub)
<br/>	* AWA (OpenDayZ)
<br/>	* bodybag (Gameaholic.se)
<br/>	* code34 (iniDBI)
<br/>	* Das Attorney (Jump MF)
<br/>	* Ed! (404Games forums)
<br/>	* Farooq (GitHub)
<br/>	* gtoddc (A3W forums)
<br/>	* HatchetHarry (GitHub)
<br/>	* Hub (TeamPlayerGaming)
<br/>	* k4n30 (GitHub)
<br/>	* Killzone_Kid (KillzoneKid.com)
<br/>	* Krunch (GitHub)
<br/>	* LouDnl (GitHub)
<br/>	* madbull (R3F)
<br/>	* Mainfrezzer (Magnon)
<br/>	* meat147 (GitHub)
<br/>	* micovery (GitHub)
<br/>	* Na_Palm (BIS forums)
<br/>	* Outlawled (Armaholic)
<br/>	* red281gt (GitHub)
<br/>	* RockHound (BierAG)
<br/>	* s3kShUn61 (GitHub)
<br/>	* Sa-Matra (BIS forums)
<br/>	* Sanjo (GitHub)
<br/>	* SCETheFuzz (GitHub)
<br/>	* Shockwave (A3W forums)
<br/>	* SicSemperTyrannis (iniDB)
<br/>	* SPJESTER (404Games forums)
<br/>	* spunFIN (BIS forums)
<br/>	* Tonic (BIS forums)
<br/>	* wiking.at (A3W forums)
<br/>	* xx-LSD-xx (Armaholic)
<br/>	* Zenophon (BIS Forums)
<br/>	* Cael817 (A3W forums)
<br/>	* Micovery (A3W forums)
<br/>	* BadVolt (A3W forums)
<br/>	* LouD (NL United / A3W forums)
<br/>
<br/><font size='16'>Thanks A LOT to everyone involved for the help and inspiration!</font>
"
]];


player createDiaryRecord ["infos",
[
"Hints and Tips",
"
<br/><font size='18'>A3Wasteland</font>
<br/>
<br/>* At the start of the game, spread out and find supplies before worrying about where to establish a meeting place or a base, supplies are important and very valuable.
<br/>
<br/>* When picking a base location, it is best advised to pick a place that is out of the way and not so obvious such as airports, cities, map-bound bases, etc. remember, players randomly spawn in and around towns and could even spawn inside your base should you set it up in a town.
<br/>
<br/>* If you spawn in an area with no vehicles or supplies in the immediate area, DO NOT just click respawn from the pause menu, chances are if you search an area of a few hundred meters, you will find something.
<br/>
<br/>* Always be on the lookout for nightvision. they are located in the ammo crates, and there are pairs scattered throughout vehicles. You can also purchase them from the gunstores. Nighttime without them SUCKS, and if you have them, you can conduct stealth raids on enemy bases under the cover of complete darkness.
<br/>
<br/>* When you set up a base, never leave your supplies unguarded, one guard will suffice, but it is recommended you have at least 2, maybe 3 guards at base at all times.
<br/>
<br/>* There are very aggressive AI characters that spawn with most missions and will protect the mission objectives with deadly force, be aware of them.
"
]];

player createDiaryRecord ["infos",
[
"About Wasteland",
"
<br/>Wasteland is a team versus team versus team sandbox survival experience. The objective of this mission is to rally your faction, scavenge supplies, weapons, and vehicles, and destroy the other factions. It is survival at its best! Keep in mind this is a work in progress, please direct your reports to http://forums.a3wasteland.com/
<br/>
<br/>FAQ:
<br/>
<br/>Q. What am I supposed to do here?
<br/>A. See the above description
<br/>
<br/>Q. Where can I get a gun?
<br/>A. Weapons are found in one of three places, first in ammo crates that come as rewards from missions, inside and outside buildings, and second, in the gear section of the vehicles, which also randomly spawn around the map. The last place to find a gun would be at the gunshops located throughout the map. You can also find them on dead players whose bodies have not yet been looted.
<br/>
<br/>Q. What are the blue circles on the map?
<br/>A. The circles represent town limits. If friendly soldiers are in a town, you can spawn there from the re-spawn menu; however if there is an enemy presence, you will not be able to spawn there.
<br/>
<br/>Q. Why is it so dark, I cant see.
<br/>A. The server has a day/night cycle just like in the real world, and as such, night time is a factor in your survival. It is recommended that you find sources of light or use your Nightvision Goggles as the darkness sets in.
<br/>
<br/>Q. Is it ok for me to shoot my team mates?
<br/>A. If you are member of BLUFOR or OPFOR teams, then you are NOT allowed to shoot or steal items and vehicles from other players. If you play as Independent, you are free to engage anyone as well as team up with anyone you want.
<br/>
<br/>Q. Whats with the canisters, baskets and big bags?
<br/>A. This game has a food and water system that you must stay on top of if you hope to survive. You can collect food and water from food sacks and wells, or baskets and plastic canisters dropped by dead players. Food and water will also randomly spawn around the map.
<br/>
<br/>Q. I saw someone breaking a rule, what do I do?
<br/>A. Simply go into global chat and get the attention of one of the admins or visit our forums, and make a report if the offense is serious.
"
]];
