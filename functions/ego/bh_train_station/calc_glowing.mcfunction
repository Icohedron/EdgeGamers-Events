scoreboard players operation @s BHTScalc = &Glowing BHTScalc
scoreboard players operation @s BHTScalc -= @s BHTSti
execute @s[score_BHTScalc_min=0,score_BHTScalc=0] ~ ~ ~ tellraw @a {"text":"","extra":[{"text":"[","color":"gray"},{"text":"BHTS","color":"green","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"Train Station","color":"green"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 993875352"}},{"text":"]","color":"gray"},{"text":": "},{"text":"Glowing has been removed from all seekers!","color":"yellow"}]}
execute @s[score_BHTScalc_min=0,score_BHTScalc=0] ~ ~ ~ execute @a ~ ~ ~ playsound minecraft:entity.experience_orb.pickup voice @a[c=1]
scoreboard players set @s[score_BHTScalc_min=0,score_BHTScalc=0] BHTSgl 0
