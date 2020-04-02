--[[
    Written by 4tla2
    Using the Unlicense
    https://unlicense.org
]]
if SERVER then

    --Init basic stuff
    local SystemType = package.config:sub(1,1)
    CreateConVar("ttt_end_random_music_wintype", 0, FCVAR_SERVER_CAN_EXECUTE, "Enable if you want teamspecific win music at the end of the round", 0, 1)
    CreateConVar("ttt_end_random_music_silentscan", 0, FCVAR_SERVER_CAN_EXECUTE, "Enable if you don't want to the Addon to print all found files out after Roundend", 0, 1)
    util.AddNetworkString("ttt_end_random_music")

    --On Boot
    if (SystemType == "/") then --Check OS Type
        print ("[End_Random_Music] OS check successful: Using Unixlike OS.")
    elseif (SystemType == "\\") then
        print ("[End_Random_Music] OS check successful: Using Windows.")
    else
        print ("[End_Random_Music] Error: Couldn't determine your OS.")
    end
    if (string.find(table.ToString(engine.GetAddons(), "modliste", true), "1357204556", 1) != nil) then --Check for TTT2
        print("[End_Random_Music] Hello TTT2. Nice to meet you.")
        branch = "ttt2"
        print("[End_Random_Music] Checking for other TTT2 Roles:")
        if (string.find(table.ToString(engine.GetAddons(), "modliste", true), "1392362130", 1) != nil) then --Check for Jackal
            ttt2jackal_true = 1
            print ("[End_Random_Music] Found Jackal")
        end
        if (string.find(table.ToString(engine.GetAddons(), "modliste", true), "1371842074", 1) != nil) then --Check for Infected
            ttt2infected_true = 1
            print ("[End_Random_Music] Found Infected")
        end
        if (string.find(table.ToString(engine.GetAddons(), "modliste", true), "1363049665", 1) != nil) then --Check for Jester
            ttt2jester_true = 1
            print ("[End_Random_Music] Found Jester")
        end
        if (string.find(table.ToString(engine.GetAddons(), "modliste", true), "1777819207", 1) != nil) then --Check for Marker
            ttt2marker_true = 1
            print ("[End_Random_Music] Found Marker")
        end
        if (string.find(table.ToString(engine.GetAddons(), "modliste", true), "1737101500", 1) != nil) then --Check for Pirate
            ttt2pirate_true = 1
            print ("[End_Random_Music] Found Pirate")
        end
        if (string.find(table.ToString(engine.GetAddons(), "modliste", true), "1883650244", 1) != nil) then --Check for Necromancer
            ttt2necromancer_true = 1
            print ("[End_Random_Music] Found Necromancer")
        end
        if (string.find(table.ToString(engine.GetAddons(), "modliste", true), "1363905854", 1) != nil) then --Check for Serialkiller
            ttt2serialkiller_true = 1
            print ("[End_Random_Music] Found Serialkiller")
        end
    else
        branch = "ttt"
    end
    if (file.Exists("music/end_random_music/innocent" , "DATA") && file.Exists("music/end_random_music/traitor" , "DATA") && file.Exists("music/end_random_music/other" , "DATA")) then --Check for folder
        print ("[End_Random_Music] Basic folder check successful.")
        print ("[End_Random_Music] Checking for extra folders.")
        if (branch == "ttt2") then
            if (ttt2jackal_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_jackal", "DATA")) then
                    print ("[End_Random_Music] Found Jackal folder.")
                else
                    print ("[End_Random_Music] Missing Jackal folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_jackal")
                end
            end
            if (ttt2infected_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_infected", "DATA")) then
                    print ("[End_Random_Music] Found Infected folder.")
                else
                    print ("[End_Random_Music] Missing Infected folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_infected")
                end
            end
            if (ttt2jester_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_jester", "DATA")) then
                    print ("[End_Random_Music] Found Jester folder.")
                else
                    print ("[End_Random_Music] Missing Jester folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_jester")
                end
            end
            if (ttt2marker_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_marker", "DATA")) then
                    print ("[End_Random_Music] Found Marker folder.")
                else
                    print ("[End_Random_Music] Missing Marker folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_marker")
                end
            end
            if (ttt2pirate_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_pirate", "DATA")) then
                    print ("[End_Random_Music] Found Pirate folder.")
                else
                    print ("[End_Random_Music] Missing Pirate folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_pirate")
                end
            end
            if (ttt2necromancer_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_necromancer", "DATA")) then
                    print ("[End_Random_Music] Found Necromancer folder.")
                else
                    print ("[End_Random_Music] Missing Necromancer folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_necromancer")
                end
            end
            if (ttt2serialkiller_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_serialkiller", "DATA")) then
                    print ("[End_Random_Music] Found Serialkiller folder.")
                else
                    print ("[End_Random_Music] Missing Serialkiller folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_serialkiller")
                end
            end
        else
        end
    else
        print ("[End_Random_Music] Basic folder check failed. Creating missing folders.");
        file.CreateDir("music/end_random_music/innocent");
        file.CreateDir("music/end_random_music/traitor");
        file.CreateDir("music/end_random_music/other");
        print ("[End_Random_Music] Checking for extra folders.")
        if (branch == "ttt2") then
            if (ttt2jackal_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_jackal", "DATA")) then
                    print ("[End_Random_Music] Found Jackal folder.")
                else
                    print ("[End_Random_Music] Missing Jackal folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_jackal")
                end
            end
            if (ttt2infected_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_infected", "DATA")) then
                    print ("[End_Random_Music] Found Infected folder.")
                else
                    print ("[End_Random_Music] Missing Infected folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_infected")
                end
            end
            if (ttt2jester_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_jester", "DATA")) then
                    print ("[End_Random_Music] Found Jester folder.")
                else
                    print ("[End_Random_Music] Missing Jester folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_jester")
                end
            end
            if (ttt2marker_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_marker", "DATA")) then
                    print ("[End_Random_Music] Found Marker folder.")
                else
                    print ("[End_Random_Music] Missing Marker folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_marker")
                end
            end
            if (ttt2pirate_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_pirate", "DATA")) then
                    print ("[End_Random_Music] Found Pirate folder.")
                else
                    print ("[End_Random_Music] Missing Pirate folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_pirate")
                end
            end
            if (ttt2necromancer_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_necromancer", "DATA")) then
                    print ("[End_Random_Music] Found Necromancer folder.")
                else
                    print ("[End_Random_Music] Missing Necromancer folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_necromancer")
                end
            end
            if (ttt2serialkiller_true == 1) then
                if (file.Exists("music/end_random_music/ttt2_serialkiller", "DATA")) then
                    print ("[End_Random_Music] Found Serialkiller folder.")
                else
                    print ("[End_Random_Music] Missing Serialkiller folder. Creating...")
                    file.CreateDir("music/end_random_music/ttt2_serialkiller")
                end
            end
        else
        end
    end

    --The Magic
    function roundend(wintype)
        print ("[End_Random_Music] Wintype is: " .. wintype)

        --Search for files
        filesGlobal = {}
        filesInnocent = {}
        filesOther = {}
        filesTraitor = {}
        if (ttt2jackal_true == 1) then
            filesTTT2Jackal = {}
        end
        if (ttt2infected_true == 1) then
            filesTTT2Infected = {}
        end
        if (ttt2jester_true == 1) then
            filesTTT2Jester = {}
        end
        if (ttt2marker_true == 1) then
            filesTTT2Marker = {}
        end
        if (ttt2pirate_true == 1) then
            filesTTT2Pirate = {}
        end
        if (ttt2necromancer_true == 1) then
            filesTTT2Necromancer = {}
        end
        if (ttt2serialkiller_true == 1) then
            filesTTT2Serialkiller = {}
        end
        if (GetConVar("ttt_end_random_music_silentscan"):GetString() == "0") then
            print ("[End_Random_Music] Searching files:")
        end
        filesInnocent = file.Find("music/end_random_music/innocent/*.wav", "DATA")
        if (filesInnocent != nil) then
            for i = 1, table.getn(filesInnocent), 1 do
                table.insert(filesGlobal, "innocent/" .. filesInnocent[i])
            end
        end
        resource.AddFile( "music/end_random_music/innocent/*.wav" )
        filesTraitor = file.Find("music/end_random_music/traitor/*.wav", "DATA")
        if (filesTraitor != nil) then
            for i = 1, table.getn(filesTraitor), 1 do
                table.insert(filesGlobal, "traitor/" .. filesTraitor[i])
            end
        end
        filesOther = file.Find("music/end_random_music/other/*.wav", "DATA")
        if (filesOther != nil) then
            for i = 1, table.getn(filesOther), 1 do
                table.insert(filesGlobal, "other/" .. filesOther[i])
            end
        end
        if (file.Exists("music/end_random_music/ttt2_jackal", "DATA")) then
            filesTTT2Jackal = file.Find("music/end_random_music/ttt2_jackal/*.wav", "DATA")
            if (filesTTT2Jackal != nil) then
                for i = 1, table.getn(filesTTT2Jackal), 1 do
                    table.insert(filesGlobal, "ttt2_jackal/" .. filesTTT2Jackal[i])
                end
            end
        end
        if (file.Exists("music/end_random_music/ttt2_infected", "DATA")) then
            filesTTT2Infected = file.Find("music/end_random_music/ttt2_infected/*.wav", "DATA")
            if (filesTTT2Infected != nil) then
                for i = 1, table.getn(filesTTT2Infected), 1 do
                    table.insert(filesGlobal, "ttt2_infected/" .. filesTTT2Infected[i])
                end
            end
        end
        if (file.Exists("music/end_random_music/ttt2_jester", "DATA")) then
            filesTTT2Jester = file.Find("music/end_random_music/ttt2_jester/*.wav", "DATA")
            if (filesTTT2Jester != nil) then
                for i = 1, table.getn(filesTTT2Jester), 1 do
                    table.insert(filesGlobal, "ttt2_jester/" .. filesTTT2Jester[i])
                end
            end
        end
        if (file.Exists("music/end_random_music/ttt2_marker", "DATA")) then
            filesTTT2Marker = file.Find("music/end_random_music/ttt2_marker/*.wav", "DATA")
            if (filesTTT2Marker != nil) then
                for i = 1, table.getn(filesTTT2Marker), 1 do
                    table.insert(filesGlobal, "ttt2_marker/" .. filesTTT2Marker[i])
                end
            end
        end
        if (file.Exists("music/end_random_music/ttt2_pirate", "DATA")) then
            filesTTT2Pirate = file.Find("music/end_random_music/ttt2_pirate/*.wav", "DATA")
            if (filesTTT2Pirate != nil) then
                for i = 1, table.getn(filesTTT2Pirate), 1 do
                    table.insert(filesGlobal, "ttt2_pirate/" .. filesTTT2Pirate[i])
                end
            end
        end
        if (file.Exists("music/end_random_music/ttt2_necromancer", "DATA")) then
            filesTTT2Necromancer = file.Find("music/end_random_music/ttt2_necromancer/*.wav", "DATA")
            if (filesTTT2Necromancer != nil) then
                for i = 1, table.getn(filesTTT2Necromancer), 1 do
                    table.insert(filesGlobal, "ttt2_necromancer/" .. filesTTT2Necromancer[i])
                end
            end
        end
        if (file.Exists("music/end_random_music/ttt2_serialkiller", "DATA")) then
            filesTTT2Serialkiller = file.Find("music/end_random_music/ttt2_serialkiller/*.wav", "DATA")
            if (filesTTT2Serialkiller != nil) then
                for i = 1, table.getn(filesTTT2Serialkiller), 1 do
                    table.insert(filesGlobal, "ttt2_serialkiller/" .. filesTTT2Serialkiller[i])
                end
            end
        end
        if (GetConVar("ttt_end_random_music_silentscan"):GetString() == "0") then
            if (filesGlobal != nil) then
                for i = 1, table.getn(filesGlobal), 1 do
                    print ("[End_Random_Music] Found " .. filesGlobal[i])
                end
            end
        end


        --Shuffel and send info to client
        if (filesGlobal != nil) then
            --Unspecific wintype
            if (GetConVar("ttt_end_random_music_wintype"):GetString() == "0") then
                if (filesGlobal != nil) then
                    for n = 0, 10 do
                        math.randomseed(os.time())
                        musicTitle = math.random(table.getn(filesGlobal))
                    end
                    net.Start("ttt_end_random_music");
                        net.WriteString( filesGlobal[musicTitle] );
                    net.Broadcast();
                else
                    print("[End_Random_Music] Error: No files to play")
                end

            --Custom Wintype
            elseif (GetConVar("ttt_end_random_music_wintype"):GetString() == "1") then
                --Standard TTT
                if (branch == "ttt") then
                    --Inno
                    if (wintype == 3 || wintype == 4) then
                        if (filesInnocent != nil) then
                            for n = 0, 10 do
                                math.randomseed(os.time())
                                musicTitle = math.random(table.getn(filesInnocent))
                            end
                            net.Start("ttt_end_random_music");
                                net.WriteString( "innocent/"..filesInnocent[musicTitle] );
                            net.Broadcast();
                        else
                            print("[End_Random_Music] Error: No files to play for wintype")
                        end
                    --Traitor
                    if (filesTraitor != nil) then
                        elseif (wintype == 2) then
                            for n = 0, 10 do
                                math.randomseed(os.time())
                                musicTitle = math.random(table.getn(filesTraitor))
                            end
                            net.Start("ttt_end_random_music");
                                net.WriteString( "traitor/"..filesTraitor[musicTitle] );
                            net.Broadcast();
                        else
                            print("[End_Random_Music] Error: No files to play for wintype")
                        end
                    --Other
                    else
                        if (filesOther != nil) then
                            for n = 0, 10 do
                                math.randomseed(os.time())
                                musicTitle = math.random(table.getn(filesOther))
                            end
                            net.Start("ttt_end_random_music");
                                net.WriteString( "other/"..filesOther[musicTitle] );
                            net.Broadcast();
                        else
                            print("[End_Random_Music] Error: No files to play for wintype")
                        end
                    end
                --TTT2
                elseif (branch == "ttt2") then
                    --Inno
                    if (wintype == "innocents" || wintype == 4) then
                        if (filesInnocent != nil) then
                            for n = 0, 10 do
                                math.randomseed(os.time())
                                musicTitle = math.random(table.getn(filesInnocent))
                            end
                            net.Start("ttt_end_random_music");
                                net.WriteString( "innocent/"..filesInnocent[musicTitle] );
                            net.Broadcast();
                        else
                            print("[End_Random_Music] Error: No files to play for wintype")
                        end
                    --Traitor
                    elseif (wintype == "traitors") then
                        if (filesTraitor != nil) then
                            for n = 0, 10 do
                                math.randomseed(os.time())
                                musicTitle = math.random(table.getn(filesTraitor))
                            end
                            net.Start("ttt_end_random_music");
                                net.WriteString( "traitor/"..filesTraitor[musicTitle] );
                            net.Broadcast();
                        else
                            print("[End_Random_Music] Error: No files to play for wintype")
                        end
                    --Jackal
                    elseif (wintype == "jackals") then
                        if (filesTTT2Jackal != nil) then
                            for n = 0, 10 do
                                math.randomseed(os.time())
                                musicTitle = math.random(table.getn(filesTTT2Jackal))
                            end
                            net.Start("ttt_end_random_music");
                                net.WriteString( "ttt2_jackal/"..filesTTT2Jackal[musicTitle] );
                            net.Broadcast();
                        else
                            print("[End_Random_Music] Error: No files to play for wintype")
                        end
                    --Infected
                     elseif (wintype == "infecteds") then
                        if (filesTTT2Infected != nil) then
                            for n = 0, 10 do
                                math.randomseed(os.time())
                                musicTitle = math.random(table.getn(filesTTT2Infected))
                            end
                            net.Start("ttt_end_random_music");
                                net.WriteString( "ttt2_infected/"..filesTTT2Infected[musicTitle] );
                            net.Broadcast();
                        else
                            print("[End_Random_Music] Error: No files to play for wintype")
                        end
                    --Jester
                    elseif (wintype == "jesters") then
                        if (filesTTT2Jester != nil) then
                            for n = 0, 10 do
                                math.randomseed(os.time())
                                musicTitle = math.random(table.getn(filesTTT2Jester))
                            end
                            net.Start("ttt_end_random_music");
                                net.WriteString( "ttt2_jester/"..filesTTT2Jester[musicTitle] );
                            net.Broadcast();
                        else
                            print("[End_Random_Music] Error: No files to play for wintype")
                        end
                    --Marker
                    elseif (wintype == "markers") then
                        if (filesTTT2Marker != nil) then
                            for n = 0, 10 do
                                math.randomseed(os.time())
                                musicTitle = math.random(table.getn(filesTTT2Marker))
                            end
                            net.Start("ttt_end_random_music");
                                net.WriteString( "ttt2_marker/"..filesTTT2Marker[musicTitle] );
                            net.Broadcast();
                        else
                            print("[End_Random_Music] Error: No files to play for wintype")
                        end
                    --Pirate
                    elseif (wintype == "pirates") then
                        if (filesTTT2Pirate != nil) then
                            for n = 0, 10 do
                                math.randomseed(os.time())
                                musicTitle = math.random(table.getn(filesTTT2Pirate))
                            end
                            net.Start("ttt_end_random_music");
                                net.WriteString( "ttt2_pirate/"..filesTTT2Pirate[musicTitle] );
                            net.Broadcast();
                        else
                            print("[End_Random_Music] Error: No files to play for wintype")
                        end
                    --Necromancer
                    elseif (wintype == "necromancers") then
                        if (filesTTT2Necromancer != nil) then
                            for n = 0, 10 do
                                math.randomseed(os.time())
                                musicTitle = math.random(table.getn(filesTTT2Necromancer))
                            end
                            net.Start("ttt_end_random_music");
                                net.WriteString( "ttt2_necromancer/"..filesTTT2Necromancer[musicTitle] );
                            net.Broadcast();
                        else
                            print("[End_Random_Music] Error: No files to play for wintype")
                        end
                    --Serialkiller
                    elseif (wintype == "serialkillers") then
                        if (filesTTT2Serialkiller != nil) then
                            for n = 0, 10 do
                                math.randomseed(os.time())
                                musicTitle = math.random(table.getn(filesTTT2Serialkiller))
                            end
                            net.Start("ttt_end_random_music");
                                net.WriteString( "ttt2_serialkiller/"..filesTTT2Serialkiller[musicTitle] );
                            net.Broadcast();
                        else
                            print("[End_Random_Music] Error: No files to play for wintype")
                        end
                    --Other
                    else
                        if (filesOther != nil) then
                            for n = 0, 10 do
                                math.randomseed(os.time())
                                musicTitle = math.random(table.getn(filesOther))
                            end
                            net.Start("ttt_end_random_music");
                                net.WriteString( "other/"..filesOther[musicTitle] );
                            net.Broadcast();
                        else
                            print("[End_Random_Music] Error: No files to play for wintype")
                        end
                    end
                end
            --Error ConVar
            else
                print ("[End_Random_Music] Error: ConVar is out of acceptable Range. It should be 0 or 1.")
            end
        else
            print ("[End_Random_Music] Error: No files provided to load.")
        end
    end
    --Programm itself
    hook.Add("TTTEndRound","lul", roundend)


    --Debug: Will be removed in future releases
    --Reload Start
    concommand.Add("ttt_endroundmusic_reloadstart", function()

    end)
end