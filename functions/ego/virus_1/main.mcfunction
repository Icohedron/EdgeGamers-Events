scoreboard players add @a[x=-130,y=4,z=-315,dx=121,dy=60,dz=181] FLid 0
scoreboard players set @a[x=-130,y=4,z=-315,dx=121,dy=60,dz=181,score_FLid=-1561350379] FLid 1561350378
scoreboard players set @a[x=-130,y=4,z=-315,dx=121,dy=60,dz=181,score_FLid_min=-1561350377] FLid 1561350378
execute @e[type=armor_stand,tag=VR1Stand,score_VR1st_min=1,score_VR1st=1] ~ ~ ~ function ego:virus_1/start_round
execute @e[type=armor_stand,tag=VR1Stand,score_VR1st_min=2,score_VR1st=2] ~ ~ ~ function ego:virus_1/countdown
execute @e[type=armor_stand,tag=VR1Stand,score_VR1st_min=3,score_VR1st=3] ~ ~ ~ function ego:virus_1/during_round
execute @e[type=armor_stand,tag=VR1Stand,score_VR1st_min=4,score_VR1st=4] ~ ~ ~ function ego:virus_1/stop_round
execute @e[type=armor_stand,tag=VR1Stand,score_VR1st_min=5,score_VR1st=5] ~ ~ ~ function ego:virus_1/wait_for_reset
execute @e[type=armor_stand,tag=VR1Stand,score_VR1st_min=6,score_VR1st=6] ~ ~ ~ function ego:virus_1/reset_round
execute @e[type=armor_stand,tag=VR1Stand] ~ ~ ~ function ego:virus_1/set_glowing_effects
execute @e[type=armor_stand,tag=VR1Stand] ~ ~ ~ function ego:virus_1/calc_player_numbers
scoreboard players add @a[x=-130,y=4,z=-315,dx=121,dy=60,dz=181,m=2] VR1pl 0
execute @a[x=-130,y=4,z=-315,dx=121,dy=60,dz=181,m=2,score_VR1pl_min=0,score_VR1pl=0] ~ ~ ~ function ego:virus_1/reset_player
