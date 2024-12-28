-- NOTE: Tables are the only built in data structure in Lua
-- They can be used multiple ways

-- This is a table used as a map in Lua
--  A map stores info as a key value pair

local ninja = {
    user_name = "Kakashi",
    ["Current Age"] = 40
}

print(ninja.user_name)
print(ninja["Current Age"]) 
