## Set scoreboard.
scoreboard players set @s nest.suite.cases 0
scoreboard players set @s nest.suite.errors 0
scoreboard players set @s nest.suite.passes 0
## Set data.
data modify entity @s data merge value {nest:{suite:{}}}
data modify entity @s data.nest.suite.__setup set from storage nest:__/suite/-enable <<.setup
data modify entity @s data.nest.suite.__teardown set from storage nest:__/suite/-enable <<.teardown
data modify entity @s CustomName set from storage nest:__/suite/-enable <<.suite
## Add tags.
tag @s add nest.suite

## Push cases.
data modify storage nest:__/case/push <<list set from storage nest:__/suite/-enable <<.cases
function nest:__/case/push

## Success.
return 1