-- NOTE: Tables are the only built in data structure in Lua
-- They can be used multiple ways

-- This is a table used as a list in Lua
-- In Lua a list can store variables and even functions
local my_cool_list = { "Dezly", 25, false, function() print("Hello World") end }

-- NOTE: In Lua arrays start at index 1 (Yes. Really. 1 based indexing)
-- This is different to other programming languages that start at index 0

print("The first element in my_cool_list is", my_cool_list[1])
print("The second element in my_cool_list is", my_cool_list[2])
