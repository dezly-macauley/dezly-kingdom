local function greet_user(user_name)
    print("Hello", user_name)
end

greet_user("Dezly")
-------------------------------------------------------------------------------
-- SECTION: Functions that return multiple values

function buy_weapon_pack()
    return 15, 29, 38
end

local swords, arrows, knives = buy_weapon_pack()

print(swords)
print(arrows)
print(knives)

-------------------------------------------------------------------------------
