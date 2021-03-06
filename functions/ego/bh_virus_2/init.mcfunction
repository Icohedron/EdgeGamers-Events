function ego:floo_network/stop_events
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLtp 98805618
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLpvp 2
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLsat 1
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLsat 1
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLwea 0
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLreg 0
scoreboard players set @a gSA 0
scoreboard players set @a[x=-107,y=2,z=-130,dx=193,dy=100,dz=241] gSA 1
scoreboard objectives add constants dummy
scoreboard players set -1 constants -1
scoreboard players set 1200 constants 1200
scoreboard players set 20 constants 20
scoreboard players set 60 constants 60
scoreboard objectives add BHVR2prng dummy Pseudo-RNG
scoreboard players set &Increment BHVR2prng 12345
scoreboard players set &Modulus BHVR2prng 6
scoreboard players set &Multiplier BHVR2prng 1103515245
scoreboard players set &Offset BHVR2prng 0
scoreboard players set &Seed BHVR2prng 0
scoreboard objectives add BHVR2 dummy Virus 2
scoreboard objectives setdisplay sidebar BHVR2
scoreboard objectives add BHVR2pl dummy Virus 2 Player List
scoreboard objectives add BHVR2sa dummy Virus 2 Select All
scoreboard objectives add BHVR2ti dummy Virus 2 Timer
scoreboard objectives add BHVR2chi dummy Virus 2 Count Hiders
scoreboard objectives add BHVR2cvr dummy Virus 2 Count Seekers
scoreboard objectives add BHVR2gl dummy Virus 2 Glowing Players
scoreboard objectives add BHVR2calc dummy Virus 2 Calculations
scoreboard objectives add BHVR2st dummy Virus 2 State
scoreboard teams add BHVR2h Virus 2 Hiders
scoreboard teams option BHVR2h friendlyfire false
scoreboard teams option BHVR2h collisionRule never
scoreboard teams option BHVR2h deathMessageVisibility always
scoreboard teams option BHVR2h color green
scoreboard teams option BHVR2h nametagVisibility never
scoreboard teams option BHVR2h seeFriendlyInvisibles false
scoreboard teams add BHVR2v Virus 2 Seekers
scoreboard teams option BHVR2v friendlyfire false
scoreboard teams option BHVR2v collisionRule never
scoreboard teams option BHVR2v deathMessageVisibility always
scoreboard teams option BHVR2v color yellow
scoreboard teams add BHVR2d_y Virus 2 Display Yellow
scoreboard teams option BHVR2d_y color yellow
scoreboard teams add BHVR2d_g Virus 2 Display Green
scoreboard teams option BHVR2d_g color green
scoreboard players set @s HOST 0
scoreboard teams join BHVR2d_y Countdown Minutes Seconds Seekers
scoreboard teams join BHVR2d_g Hiders
scoreboard players set &Countdown BHVR2calc 1200
scoreboard players set &Glowing BHVR2calc 6000
scoreboard players set &GameTime BHVR2calc 12000
summon armor_stand ~ ~ ~ {Tags:["BHVR2Stand","BHVR2Entity"],Invulnerable:1,PersistenceRequired:1,Invisible:1,Marker:1,NoGravity:1}
execute @e[type=armor_stand,tag=BHVR2Stand] ~ ~ ~ function ego:bh_virus_2/reset_round
tellraw @a[score_EC_min=0,score_EC=0] {"text":"","extra":[{"text":"[","color":"gray"},{"text":"BHVR2","color":"yellow","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"Virus 2","color":"yellow"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 98805618"}},{"text":"]","color":"gray"},{"text":": "},{"text":"Virus 2","color":"yellow","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"Virus 2","color":"yellow"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 98805618"}},{"text":" has started!","color":"green"}]}
scoreboard players set @e[type=armor_stand,tag=FlooStand,score_FLgam_min=0,score_FLgam=0] FLgam 98805618
