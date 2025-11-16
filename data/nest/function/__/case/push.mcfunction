## Finished.
execute unless data storage nest:__/case/push <<list[-1] run return 1
## Pop data.
data modify storage nest:__/case/-enable <<case set from storage nest:__/case/push <<list[-1]
data remove storage nest:__/case/push <<list[-1]

## Push.
tag @s add nest.case.__vehicle
execute summon minecraft:text_display if function nest:__/case/-enable run ride @s mount @e[tag=nest.case.__vehicle,limit=1]
tag @s remove nest.case.__vehicle

## Recursive call.
return run function nest:__/case/push