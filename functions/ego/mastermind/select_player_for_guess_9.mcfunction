execute @s[score_MMgn_min=1,score_MMgn=1] ~ ~ ~ summon area_effect_cloud ~7 ~2 ~10 {Tags:["MMEntity","MMGuessTP9"],Duration:5}
execute @s[score_MMgn_min=2,score_MMgn=2] ~ ~ ~ summon area_effect_cloud ~7 ~2 ~8 {Tags:["MMEntity","MMGuessTP9"],Duration:5}
execute @s[score_MMgn_min=3,score_MMgn=3] ~ ~ ~ summon area_effect_cloud ~7 ~2 ~6 {Tags:["MMEntity","MMGuessTP9"],Duration:5}
execute @s[score_MMgn_min=4,score_MMgn=4] ~ ~ ~ summon area_effect_cloud ~7 ~2 ~4 {Tags:["MMEntity","MMGuessTP9"],Duration:5}
execute @s[score_MMgn_min=5,score_MMgn=5] ~ ~ ~ summon area_effect_cloud ~7 ~2 ~2 {Tags:["MMEntity","MMGuessTP9"],Duration:5}
execute @e[tag=MMGuessTP9] ~ ~ ~ scoreboard players set @p[r=5,score_MMrn_min=9,score_MMrn=9] MMcl 1
minecraft:tp @a[score_MMrn_min=9,score_MMrn=9,score_MMcl_min=1,score_MMcl=1] @e[tag=MMGuessTP9]
execute @a[score_MMrn_min=9,score_MMrn=9,score_MMcl_min=1,score_MMcl=1] ~ ~ ~ function ego:mastermind/validate_guess_9
kill @e[tag=MMGuessTP9]
