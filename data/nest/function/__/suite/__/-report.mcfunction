## Report.
data modify storage nest:__/suite/__/macro/report << merge value {}
execute store result storage nest:__/suite/__/macro/report <<.cases int 1 run scoreboard players get @s nest.suite.cases
execute store result storage nest:__/suite/__/macro/report <<.passes int 1 run scoreboard players get @s nest.suite.passes
execute store result storage nest:__/suite/__/macro/report <<.errors int 1 run scoreboard players get @s nest.suite.errors
function nest:__/suite/__/macro/report with storage nest:__/suite/__/macro/report <<
## Message.
#say suite: end.

## Success.
return 1