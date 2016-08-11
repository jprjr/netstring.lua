# netstring.lua

An implementation of DJB's [netstring](https://cr.yp.to/proto/netstrings.txt)
encoding format for Lua/LuaJIT.

## Synopsis

```lua
local netstring = require'netstring'

print(netstring.encode(1,"hey","here's","some","netstrings",""))
-- 1:1,3:hey,6:here's,4:some,10:netstrings,0:,   nil

-- you can also encode a table, provided it's like an array
-- keys are sorted numerically before encoding into netstrings
print(netstring.encode({ [50]="is", "this", [100]="supported" }))
-- 4:this,2:is,9:supported,  nil

-- if the table has non-numeric keys, you'll get a table of errors
-- as the second return value. numeric keys are still encoded
local ns, errs = netstring.encode({ "this is fine", problem="this is not fine", "this is also fine"})
print(ns)
-- 12:this is fine,17:this is also fine,

for i in pairs(errs) do
    print(errs[i])
end
-- arg 1 key "problem" is not numeric

local results, remains =  netstring.decode("3:cat,4:dogs,5:uhohthisiswrong,")

for k,v in pairs(results) do
    print(k,v)
end
-- 1	cat
-- 2	dogs

print(remains)
-- 5:uhohthisiswrong,
```

## Usage

* `string, errs = netstring.encode(...)`

Takes any number of arguments and returns a string of concatenated
netstrings, and a table of strings describing encoding errors.

* `table, string = netstring.decode(string)`

Attempts to decode each netstring passed to it, returns a table
of decoded netstrings, and a string containing any unprocessed data.

## License

The MIT License (see LICENSE)
