scoreboard players operation @s BHHDcalc = BHHDGlowing BHHDcalc
scoreboard players operation @s BHHDcalc -= @s BHHDti
execute @s[score_BHHDcalc_min=0,score_BHHDcalc=0] ~ ~ ~ tellraw @a {"text":"","extra":[{"text":"[","color":"gray"},{"text":"BHHD","color":"green","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"HASDaa","color":"green"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 882469132"}},{"text":"]","color":"gray"},{"text":": "},{"text":"Glowing has been removed from all seekers!","color":"yellow"}]}
execute @s[score_BHHDcalc_min=0,score_BHHDcalc=0] ~ ~ ~ execute @a ~ ~ ~ playsound minecraft:entity.experience_orb.pickup voice @a[c=1]
scoreboard players set @s[score_BHHDcalc_min=0,score_BHHDcalc=0] BHHDgl 0