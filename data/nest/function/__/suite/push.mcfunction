## Finished.
execute unless data storage nest:__/suite/push <<list[-1] run return 1
## Pop data.
data modify storage nest:__/suite/-enable << set from storage nest:__/suite/push <<list[-1]
data remove storage nest:__/suite/push <<list[-1]

## Push.
tag @s add nest.suite.__vehicle
execute summon minecraft:text_display if function nest:__/suite/-enable run ride @s mount @e[tag=nest.suite.__vehicle,limit=1]
tag @s remove nest.suite.__vehicle
## Recursive call.
return run function nest:__/suite/push