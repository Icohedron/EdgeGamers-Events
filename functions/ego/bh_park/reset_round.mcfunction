execute @a[score_gSA_min=1,score_gSA=1,m=2,score_BHPpl_min=2,score_BHPpl=2] ~ ~ ~ function ego:bh_park/full_reset_player
scoreboard players set @s BHPgl 1
execute @a ~ ~ ~ function ego:bh_park/undisguise_player
scoreboard players reset Countdown BHP
scoreboard players reset Minutes BHP
scoreboard players reset Seconds BHP
scoreboard players set @s BHPst 0
