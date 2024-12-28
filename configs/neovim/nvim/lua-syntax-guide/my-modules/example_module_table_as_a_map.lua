-- NOTE: Creating Modules (Using a Lua table as a map)

-- Lua does not have a specific syntax for turning a file
-- into a module.

-- Once again, Lua uses its only built-in data structure, to create a module.

-------------------------------------------------------------------------------
-- So in Lua, a module is simply a Lua table that contains multiple functions.
-- In this example I will be using a Lua table, as a map.
-- that can be used outside of this file

-- `local M` Creates a Lua table, or more specifically, a map called `M`
-- `M` is just a naming convention that means Module

-------------------------------------------------------------------------------

local M = {

    -- A map contains key-value pairs
    -- The function name is the key, and the functionality is the pair
   
    -- E.g. `add_two_numbers` is the key, 
    -- and everything after the `=` sign is the value
    add_two_numbers = function(num1, num2)
      return num1 + num2
    end,

    -- NOTE: Remember to add a comma after each key-value pair in the map
    -- unless that key-value pair is the last pair in the map

    greet_king = function(name_of_king)
	print("Greetings King", name_of_king)
    end
    
}

-- This line returns the table `M`
-- Any code in the file written after this line will not be processed 
return M

-------------------------------------------------------------------------------

-- NOTE: To use this code in another file, 
-- add the following to the other file:
-- local example_module_taam = require("my-modules.example_module_table_as_a_map")

-- NOTE: require()
-- The filepath should be in quotes and directories 
-- should be separated by a a dot

-- Then you would use functions from the module like this:
-- print(example_module_taam.add_two_numbers(2, 3)) 
-- example_module_taam.greet_king("Dezly")
