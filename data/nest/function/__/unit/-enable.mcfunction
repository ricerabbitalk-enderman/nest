## Set data.
data modify entity @s CustomName set from storage nest:__/unit/-enable <<.name
## Add tags.
tag @s add nest.unit

## Push suites.
data modify storage nest:__/suite/push <<list set from storage nest:__/unit/-enable <<.data
function nest:__/suite/push

## Message.
#say unit: begin.

## Success.
return 1
