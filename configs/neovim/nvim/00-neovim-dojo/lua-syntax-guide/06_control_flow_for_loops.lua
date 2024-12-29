-- A simple list to iterate through
local ninja_names = { "Obito", "Tsunade", "Mei"}

-------------------------------------------------------------------------------
-- Section: Regular For Loop 

-- index = 1 is the start of list. Remember that Lua is 1-based indexing.
-- So the first element is index 1 and not index 0 
-- like most programming languages
-- `#` means until the end of the list 
for index = 1, #ninja_names do
    print(ninja_names[index])
end

-------------------------------------------------------------------------------
-- Section: For In Loop

for index, value in ipairs(ninja_names) do
    print(index, value)
end

-------------------------------------------------------------------------------
-- Section: For In Loop (ignore the index)
for _, value in ipairs(ninja_names) do
    print(value)
end

-------------------------------------------------------------------------------
