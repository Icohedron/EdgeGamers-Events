scoreboard players set @a gSA 0
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLtp 0
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLpvp 0
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLsat 1
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLgmd 1
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLwea 0
scoreboard players set @e[type=armor_stand,tag=FlooStand] FLreg 0
gamerule naturalRegeneration true
scoreboard players set @e[type=armor_stand,tag=FlooStand,score_FLgam_min=1095056157,score_FLgam=1095056157] FLgam 0
tellraw @a[score_EC_min=0,score_EC=0] {"text":"","extra":[{"text":"[","color":"gray"},{"text":"VR1","color":"yellow","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"Virus 1","color":"yellow"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 1095056157"}},{"text":"]","color":"gray"},{"text":": "},{"text":"Virus 1","color":"yellow","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"Virus 1","color":"yellow"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 1095056157"}},{"text":" has stopped!","color":"red"}]}
execute @a[score_VR1pl_min=1,score_VR1pl=2,m=2] ~ ~ ~ function ego:virus_1/full_reset_player
scoreboard players reset * HOST
kill @e[type=armor_stand,tag=VR1Entity]
fill -73 52 -222 -66 52 -229 redstone_block 0 replace stonebrick 0
fill -73 49 -229 -66 49 -222 redstone_block 0 replace stonebrick 0
scoreboard objectives remove VR1
scoreboard objectives remove VR1pl
scoreboard objectives remove VR1sa
scoreboard objectives remove VR1ti
scoreboard objectives remove VR1chi
scoreboard objectives remove VR1cvr
scoreboard objectives remove VR1gl
scoreboard objectives remove VR1calc
scoreboard objectives remove VR1st
scoreboard teams remove VR1h
scoreboard teams remove VR1v
scoreboard teams remove VR1d_y
scoreboard teams remove VR1d_g
