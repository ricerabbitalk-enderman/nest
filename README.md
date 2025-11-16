# nest
nest, Nest is Easy and Simple Test unit. 

## Case

### Define
case is a single mcfunction.
If it returns 0, the test continues and executes every tick until another value is returned.
If it returns 1, the test succeeds.
If it returns -1, the test fails.
If it returns -2, the test errors and the suite terminates.

Within a case, you can use the score `nest.case.tick` to get the tick count since the case began.

#### Example
<pre>
# Use nest.case.tick.
execute if score @s nest.case.tick = ... run ...

# Error.
execute unless function xxx:check_fatal_error run return -2

# Failure.
execute unless function xxx:do_something run return -1

...

# Success.
execute if ... run return 1

# Continue.
return 0
</pre>

## Suite

### Setup and Teardown
Setup and teardown are each a single mcfunction.

If they return fail, the process fails; if they return 1, the process succeeds.

Setup runs before case execution, and teardown runs after case execution.
They are used for case preparation and post-processing.

#### Example
<pre>
# Initialize (and Failure).
execute unless function xxx:initialize run return fail

...

# Success.
return 1
</pre>

## Alias

The `case`, `setup`, and `teardown` can be defined in any location, but function tags must be added to `data/nest/tags/function/alias/`. (Subdirectories cannot be used.)

These function tags are called aliases, and all test processing is executed through them.

#### Example
**data/xxx/function/.../example.mcfunction** (xxx:.../example)
<pre>
# Use nest.case.tick.
execute if score @s nest.case.tick = ... run ...

# Error.
execute unless function xxx:check_fatal_error run return -2

# Failure.
execute unless function xxx:do_something run return -1

...

# Success.
execute if ... run return 1

# Continue.
return 0
</pre>
**data/nest/tags/function/alias/case-example.json**
<pre>
{
  "replace": false,
  "values": [
    "xxx:.../example"
  ]
}
</pre>

## Unit

### Test
Create unit and run test.
<pre>
data modify storage nest:test/run << set value { \
  unit:..., \
  data:[ \
    { \
      suite:..., \
      setup:xxx-setup, \
      teardown:xxx-teardown, \
      cases:[ \
        case-hoge, \
        case-piyo, \
        case-hogepiyo
      ] \
    }, \
    { \
      suite:..., \
      setup:yyy-setup, \
      teardown:yyy-teardown, \
      cases:[ \
        case-foo, \
        case-bar, \
        case-foobar \
      ] \
    } \
  ] \
}
function nest:test/run
</pre>

unit:... and suite:... set unique strings.

setup:..., teardown:..., and cases:[...] set the aliases defined earlier.

Once testing is complete, delete them using commands like `/test clearthese`.