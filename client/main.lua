local Core = exports.vorp_core:GetCore()
local Menu = exports.vorp_menu:GetMenuData()

RegisterNetEvent("vote:sucess", function ()
      Core.NotifyTip(CONFIG.Language["VOTE_MSG"], 5000)
end)


RegisterCommand("myname", function ()
    print(getFormatedName())
    print(isAllowedToVote())
    OpenMenu()
end, false)




function OpenMenu()
    
local canVote = isAllowedToVote()
local playerName = getFormatedName()
    -- close any menu before opening
    Menu.CloseAll()

    local menuElements = {
        { 
            label = "Dein Name: " .. getFormatedName(),
            value = "playername",
            desc = "Hier siehst du deinen Namen den du auf der Vote-Seite benutzen musst",
            itemHeight = "4vh" 
        },
        { 
            label = "Voteberechtigt: " .. isAllowedToVote(),
            value = "canvote",
            desc = "Hier siehst du ob dein Name in RedM richtig eingestellt ist und ob du Voten kannst",
            itemHeight = "4vh" 
        }
    }


    

    Menu.Open("default", GetCurrentResourceName() , "OpenMenu", -- unique namespace will allow the menu to open where you left off
        {
            title = "title",
            subtext = "subtext",
            align = "top-left", -- top-right , top-center , top-left
            elements = menuElements, -- elements needed -- if you wish to go back to the previous menu , or remove (optional)
            maxVisibleItems = 6,                                      -- max visible items in the menu
            hideRadar = true,                                         -- hides the radar
            soundOpen = true,                                         -- plays the open sound of the menu
            skipOpenEvent = false,                                     

        },
        function(data, menu) -- submit callback
          -- triggers when pressing/clicking enter 
    
        --   print("current key of MenuElements is " .. data.current.index)
        --   print("current value of MenuElements is " .. data.current.value)
            -- to go back to lastmenu if any
    
            if (data.current == "backup") then --(optional)  if lastmenu is defined
                return  _G[data.trigger](any,any) -- or the function of the last menu
            end
            
        end,

        function(data,menu) -- cancel callback THIS IS OPTIONAL
            -- when menu closes if lastmenu isn't defined
            Menu.Close(true, true) 
        end,
        -- do not use the below unless you really need, it causes the menu to spike when you press up and down because the submit callback is doing the same thing.
        function(data, menu) -- change callback THIS IS OPTIONAL 
            -- if theres no previous menu close menu on backspace press
           -- is called when scrolling through the elements, also when the type = "slider" is changed i dont know why.
              Menu.Close(true, true) 
        end,

        function(data,menu) -- close callback THIS IS OPTIONAL
            -- when menu closes if lastmenu isnt defined
           -- Menu.Close(showRadar, soundClose) 
        end)
end


function getFormatedName()
    local name = GetPlayerName(PlayerId()):gsub("[^a-zA-Z0-9%s]", "")
    return name
end


function isAllowedToVote()
    local isAllowed = getFormatedName() == GetPlayerName(PlayerId())
    return isAllowed
end
