scoreboard players set @s BHOgl 3
execute @s[score_BHOchi_min=0,score_BHOchi=0] ~ ~ ~ title @a title {"text":"The seekers won!","color":"yellow"}
execute @s[score_BHOchi_min=0,score_BHOchi=0] ~ ~ ~ tellraw @a {"text":"","extra":[{"text":"[","color":"gray"},{"text":"BHO","color":"green","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"Old","color":"green"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 354536009"}},{"text":"]","color":"gray"},{"text":": "},{"text":"The seekers won!","color":"yellow"}]}
execute @s[score_BHOchi_min=1] ~ ~ ~ title @a title {"text":"Time!","color":"green"}
execute @s[score_BHOchi_min=1] ~ ~ ~ title @a subtitle {"text":"The hiders won!","color":"green"}
execute @s[score_BHOchi_min=1] ~ ~ ~ tellraw @a {"text":"","extra":[{"text":"[","color":"gray"},{"text":"BHO","color":"green","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"Old","color":"green"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 354536009"}},{"text":"]","color":"gray"},{"text":": "},{"text":"The time is up! Hiders win!","color":"yellow"}]}
execute @s[score_BHOchi_min=1] ~ ~ ~ scoreboard players reset Seconds BHO
execute @s[score_BHOchi_min=1] ~ ~ ~ scoreboard players reset Minutes BHO
scoreboard players set @s BHOst 5