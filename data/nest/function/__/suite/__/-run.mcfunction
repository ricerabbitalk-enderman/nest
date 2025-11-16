## Setup.
execute unless function nest:__/suite/__/-setup run return fail

## Run.
execute on passengers if entity @s[type=minecraft:text_display,tag=nest.case,tag=!nest.case.running] run return run function nest:__/case/-run

## Success.
return 1