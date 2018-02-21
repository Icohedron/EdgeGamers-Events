function ego:floo_network/stop_events
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLtp 193451326
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLpvp 2
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLsat 1
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLsat 1
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLwea 0
scoreboard players set @a gSA 0
scoreboard players set @a[x=-1194,y=45,z=-175,dx=72,dy=-42,dz=72] gSA 1
scoreboard objectives add constants dummy
scoreboard players set -1 constants -1
scoreboard players set 1200 constants 1200
scoreboard players set 20 constants 20
scoreboard players set 60 constants 60
scoreboard objectives add BHOprng dummy Pseudo-RNG
scoreboard players set &Increment BHOprng 12345
scoreboard players set &Modulus BHOprng 18
scoreboard players set &Multiplier BHOprng 1103515245
scoreboard players set &Offset BHOprng 0
scoreboard players set &Seed BHOprng 0
scoreboard objectives add BHO dummy BHO
scoreboard objectives setdisplay sidebar BHO
scoreboard objectives add BHOpl dummy BHO Player List
scoreboard objectives add BHOsa dummy BHO Select All
scoreboard objectives add BHOti dummy BHO Timer
scoreboard objectives add BHOchi dummy BHO Count Hiders
scoreboard objectives add BHOcvr dummy BHO Count Virus
scoreboard objectives add BHOgl dummy BHO Glowing Players
scoreboard objectives add BHOcalc dummy BHO Calculations
scoreboard objectives add BHOst dummy BHO State
scoreboard teams add BHOh BHO Hiders
scoreboard teams option BHOh friendlyfire false
scoreboard teams option BHOh collisionRule never
scoreboard teams option BHOh deathMessageVisibility never
scoreboard teams option BHOh color green
scoreboard teams option BHOh nametagVisibility hideForOtherTeams
scoreboard teams add BHOv BHO Virus
scoreboard teams option BHOv friendlyfire false
scoreboard teams option BHOv collisionRule never
scoreboard teams option BHOv deathMessageVisibility never
scoreboard teams option BHOv color yellow
scoreboard teams add BHOd_y BHO Display Yellow
scoreboard teams option BHOd_y color yellow
scoreboard teams add BHOd_g BHO Display Green
scoreboard teams option BHOd_g color green
scoreboard teams join BHOd_y Countdown Minutes Seconds Seekers
scoreboard teams join BHOd_g Hiders
scoreboard players set BHOCountdown BHOcalc 1200
scoreboard players set BHOGlowing BHOcalc 6000
scoreboard players set BHOGameTime BHOcalc 12000
summon armor_stand ~ ~ ~ {Tags:["BHOStand","BHOEntity"],Invulnerable:1,PersistenceRequired:1,Invisible:1,Marker:1,NoGravity:1}
execute @e[type=armor_stand,tag=BHOStand] ~ ~ ~ function ego:bho/reset_round
tellraw @a[score_EC_min=0,score_EC=0] {"text":"","extra":[{"text":"[","color":"gray"},{"text":"BHO","color":"green","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"BHO","color":"green"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 193451326"}},{"text":"]","color":"gray"},{"text":": "},{"text":"BHO","color":"green","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"BHO","color":"green"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 193451326"}},{"text":" has started!","color":"green"}]}
scoreboard players set @e[type=armor_stand,tag=FlooStand,score_FLgam_min=0,score_FLgam=0] FLgam 193451326
