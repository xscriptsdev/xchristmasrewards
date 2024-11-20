--██╗░░██╗  ░██████╗░█████╗░██████╗░██╗██████╗░████████╗░██████╗
--╚██╗██╔╝  ██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
--░╚███╔╝░  ╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░╚█████╗░
--░██╔██╗░  ░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░░╚═══██╗
--██╔╝╚██╗  ██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░██████╔╝
--╚═╝░░╚═╝  ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░
-- Support: https://discord.gg/N74Yuq9ARQ



Config = {}


  -- ____  _____ _______ _____ ____  _   _  _____ 
  -- / __ \|  __ \__   __|_   _/ __ \| \ | |/ ____|
  --| |  | | |__) | | |    | || |  | |  \| | (___  
  --| |  | |  ___/  | |    | || |  | | . ` |\___ \ 
  --| |__| | |      | |   _| || |__| | |\  |____) |
   --\____/|_|      |_|  |_____\____/|_| \_|_____/ 
                                                 

   Config.DatabaseSystem = 'oxmysql' -- Change to 'mysql-async' if using that system or leave it on 'oxmysql' if you are using oxmysql                                                    
   Config.AllowMultipleUses = false -- True if you want players to be able to claim multiple rewards / False if you want players to be able to claim just one reward and to use the command once.

   Config.From = 1 -- Lowest number that player can choose
   Config.To = 10 -- Highest number that player can choose

   Config.Icon = "fas fa-gift" 

--_____  ________          __     _____  _____   _____ 
--|  __ \|  ____\ \        / /\   |  __ \|  __ \ / ____|
--| |__) | |__   \ \  /\  / /  \  | |__) | |  | | (___  
--|  _  /|  __|   \ \/  \/ / /\ \ |  _  /| |  | |\___ \ 
--| | \ \| |____   \  /\  / ____ \| | \ \| |__| |____) |
--|_|  \_\______|   \/  \/_/    \_\_|  \_\_____/|_____/ 
                                                      
                                                      

Config.Rewards = {
    [1] = {type = 'money', value = 1000},
    [2] = {type = 'item', item = 'bread', count = 2}, 
    [3] = {type = 'item', item = 'water', count = 5},   
    [4] = {type = 'weapon', weapon = 'WEAPON_PISTOL'}, 
    [5] = {type = 'money', value = 5000},         
    [6] = {type = 'item', item = 'bandage', count = 3}, 
    [7] = {type = 'item', item = 'burger', count = 2},  
    [8] = {type = 'weapon', weapon = 'WEAPON_KNIFE'},  
    [9] = {type = 'item', item = 'ammo-9', count = 250},   
    [10] = {type = 'money', value = 10000}    
    -- Add more if you need to     
}





--_______ _____            _   _  _____ _            _______ ______ 
--|__   __|  __ \     /\   | \ | |/ ____| |        /\|__   __|  ____|
--  | |  | |__) |   /  \  |  \| | (___ | |       /  \  | |  | |__   
--  | |  |  _  /   / /\ \ | . ` |\___ \| |      / /\ \ | |  |  __|  
--  | |  | | \ \  / ____ \| |\  |____) | |____ / ____ \| |  | |____ 
 -- |_|  |_|  \_\/_/    \_\_| \_|_____/|______/_/    \_\_|  |______|
                                                                   
                                                                   

    Config.AlreadyClaimed = "You have already claimed your reward"
    Config.InvalidReward = "Invalid Reward."
    Config.Received = "You received $"
    Config.YouReceived = "You received "  -- Leave space at the end if u are changing this

    Config.ChooseNumber = "Choose a number (1-10)"
    Config.Label = "Number"
    Config.DidntChooseNumber = "You didn't choose a number"
    Config.InvalidNumber = "Invalid Number"

    Config.YouReceivedAweapon = "You received a "  -- Leave space at the end if u are changing this
    Config.InvalidRewardType = "Invalid Reward Type"