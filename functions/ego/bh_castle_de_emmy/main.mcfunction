scoreboard players set @a gSA 0
scoreboard players set @a[x=-1570,y=73,z=-7,dx=-93,dy=-73,dz=-95] gSA 1
scoreboard players add @a[score_gSA_min=1,score_gSA=1] FLid 0
scoreboard players set @a[score_gSA_min=1,score_gSA=1,score_FLid=-606156447] FLid 606156446
scoreboard players set @a[score_gSA_min=1,score_gSA=1,score_FLid_min=-606156445] FLid 606156446
kill @e[x=-1570,y=73,z=-7,dx=-93,dy=-73,dz=-95,tag=!BHCDEEntity,type=item]
scoreboard players set @a[m=2,score_gDE_min=1,score_gDE=1,score_BHCDEpl_min=0,score_BHCDEpl=2] BHCDEpl 0
scoreboard players add @a BHCDEpl 0
execute @a[score_gSA_min=1,score_gSA=1,m=2,score_BHCDEpl_min=0,score_BHCDEpl=0] ~ ~ ~ function ego:bh_castle_de_emmy/reset_player
execute @a[m=2,score_gLG_min=1,score_gLG=1,score_BHCDEpl_min=1,score_BHCDEpl=2] ~ ~ ~ function ego:bh_castle_de_emmy/reset_player
execute @e[type=armor_stand,tag=BHCDEStand,score_BHCDEst_min=0,score_BHCDEst=0] ~ ~ ~ function ego:bh_castle_de_emmy/wait_for_start
execute @e[type=armor_stand,tag=BHCDEStand,score_BHCDEst_min=1,score_BHCDEst=1] ~ ~ ~ function ego:bh_castle_de_emmy/start_round
execute @e[type=armor_stand,tag=BHCDEStand,score_BHCDEst_min=2,score_BHCDEst=2] ~ ~ ~ function ego:bh_castle_de_emmy/countdown
execute @e[type=armor_stand,tag=BHCDEStand,score_BHCDEst_min=3,score_BHCDEst=3] ~ ~ ~ function ego:bh_castle_de_emmy/during_round
execute @e[type=armor_stand,tag=BHCDEStand,score_BHCDEst_min=4,score_BHCDEst=4] ~ ~ ~ function ego:bh_castle_de_emmy/stop_round
execute @e[type=armor_stand,tag=BHCDEStand,score_BHCDEst_min=5,score_BHCDEst=5] ~ ~ ~ function ego:bh_castle_de_emmy/wait_for_reset
execute @e[type=armor_stand,tag=BHCDEStand,score_BHCDEst_min=6,score_BHCDEst=6] ~ ~ ~ function ego:bh_castle_de_emmy/reset_round
execute @e[type=armor_stand,tag=BHCDEStand] ~ ~ ~ function ego:bh_castle_de_emmy/set_glowing_effects
execute @e[type=armor_stand,tag=BHCDEStand] ~ ~ ~ function ego:bh_castle_de_emmy/calc_player_numbers
execute @a[x=-1662,y=73,z=-7,dx=1505,dy=-10,dz=-93,m=2,score_BHCDEpl_min=1,score_BHCDEpl=2] ~ ~ ~ function ego:bh_castle_de_emmy/teleport_players
