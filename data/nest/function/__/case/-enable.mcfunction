## Set scoreboards.
scoreboard players set @s nest.case.tick 0

## Set data.
data modify entity @s data merge value {nest:{case:{}}}
data modify entity @s data.nest.case.__case set from storage nest:__/case/-enable <<case
data modify entity @s CustomName set from storage nest:__/case/-enable <<case
## Add tags.
tag @s add nest.case

## Success.
return 1