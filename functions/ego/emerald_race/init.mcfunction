function ego:floo_network/stop_events
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLtp 1844105133
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLpvp 1
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLsat 1
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLsat 1
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLwea 0
scoreboard players set @a gSA 0
scoreboard players set @a[x=219,y=5,z=-121,dx=75,dy=100,dz=51] gSA 1
scoreboard objectives add ER dummy Emerald Race
scoreboard objectives setdisplay sidebar ER
scoreboard players set /spawn ER 99
scoreboard objectives add ERcd dummy Emerald Race Countdown
scoreboard objectives add ERpl dummy Emerald Race Player List
scoreboard teams add ERr Emerald Race
scoreboard teams option ERr color green
scoreboard teams option ERr seeFriendlyInvisibles true
scoreboard teams option ERr collisionRule never
scoreboard teams option ERr friendlyfire false
summon area_effect_cloud ~ ~ ~ {Duration:130,Tags:["ER_cd"]}
scoreboard teams join ERr /spawn
tellraw @a[score_EC_min=0,score_EC=0] {"text":"","extra":[{"text":"[","color":"gray"},{"text":"ER","color":"green","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"Emerald Race","color":"green"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 1844105133"}},{"text":"]","color":"gray"},{"text":": "},{"text":"Emerald Race","color":"green","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"Emerald Race","color":"green"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 1844105133"}},{"text":" has started!","color":"green"}]}
scoreboard players set @e[type=armor_stand,tag=FlooStand,score_FLgam_min=0,score_FLgam=0] FLgam 1844105133
