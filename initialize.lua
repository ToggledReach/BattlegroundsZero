local environment = {} -- Defining our environment/preset API we'll be using
if getenv().BGZ then
    return warn("Battlegrounds Zero Environment is already loaded")
end

getenv().BGZ = environment

function environment.load(path)
    if not path then
        return warn("Invalid Pathway for loading module")
    end
    if type(path) == "string" then
        return loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ToggledReach/BattlegroundsZero/master/".. path ".lua?token=AKWUNB6C4AOLLCM77SXQ2LK6K37LA"))()
    elseif type(path) == "number" then
        return game:GetObjects("rbxassetid://" .. path)[1]
    end
end