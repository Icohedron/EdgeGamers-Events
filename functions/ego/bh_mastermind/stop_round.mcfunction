scoreboard players set @s BHMMgl 3
execute @s[score_BHMMchi_min=0,score_BHMMchi=0] ~ ~ ~ title @a title {"text":"The seekers won!","color":"yellow"}
execute @s[score_BHMMchi_min=0,score_BHMMchi=0] ~ ~ ~ tellraw @a {"text":"","extra":[{"text":"[","color":"gray"},{"text":"BHMM","color":"green","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"BH Mastermind","color":"green"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 408217586"}},{"text":"]","color":"gray"},{"text":": "},{"text":"The seekers won!","color":"yellow"}]}
execute @s[score_BHMMchi_min=1] ~ ~ ~ title @a title {"text":"Time!","color":"green"}
execute @s[score_BHMMchi_min=1] ~ ~ ~ title @a subtitle {"text":"The hiders won!","color":"green"}
execute @s[score_BHMMchi_min=1] ~ ~ ~ tellraw @a {"text":"","extra":[{"text":"[","color":"gray"},{"text":"BHMM","color":"green","bold":"true","hoverEvent":{"action":"show_text","value":{"text":"BH Mastermind","color":"green"}},"clickEvent":{"action":"run_command","value":"/scoreboard players set @p FLtp 408217586"}},{"text":"]","color":"gray"},{"text":": "},{"text":"The time is up! The hiders won!","color":"yellow"}]}
execute @s[score_BHMMchi_min=1] ~ ~ ~ scoreboard players reset Seconds BHMM
execute @s[score_BHMMchi_min=1] ~ ~ ~ scoreboard players reset Minutes BHMM
execute @a ~ ~ ~ function ego:bh_mastermind/undisguise_player
scoreboard players set @s BHMMst 5
