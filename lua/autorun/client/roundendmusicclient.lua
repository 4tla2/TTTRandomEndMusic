--[[
    Written by 4tla2
    Using the Unlicense
    https://unlicense.org
]]
if CLIENT then
    CreateConVar("ttt_end_random_music_source", 0, FCVAR_REPLICATED, "Switches search place from data/ to sound/", 0, 1)
    CreateConVar("ttt_end_random_music_branch", 0, FCVAR_REPLICATED, "Branch", 0, 1)
    //if (SystemType == "/") then --Check OS Type
    //    print ("[End_Random_Music] OS check successful: Using Unixlike OS.")
    //elseif (SystemType == "\\") then
    //    print ("[End_Random_Music] OS check successful: Using Windows.")
    //else
    //    print ("[End_Random_Music] Error: Couldn't determine your OS.")
    //end
    if (GetConVar("ttt_end_random_music_branch"):GetString() == "1") then
        branch = ttt2
    elseif (GetConVar("ttt_end_random_music_branch"):GetString() == "0") then
        branch = ttt
    end

    if (string.find(table.ToString(engine.GetAddons(), "modliste", true), "1357204556", 1) != nil) then --Check for TTT2
        print("[End_Random_Music] Hello TTT2. Nice to meet you.")
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
    if (string.find(table.ToString(engine.GetAddons(), "modliste", true), "2045444087", 1) != nil) then --Check for modified version of Custom Roles for TTT
        ttt_custom_roles_true = 1
        print ("[End_Random_Music] Found modified version of Custom Roles for TTT")
    elseif (string.find(table.ToString(engine.GetAddons(), "modliste", true), "1215502383", 1) != nil) then --Check for Custom Roles for TTT
        ttt_custom_roles_true = 1
        print ("[End_Random_Music] Found Custom Roles for TTT")
    end


    if (file.Exists("music/end_random_music/innocent" , "DATA") && file.Exists("music/end_random_music/traitor" , "DATA") && file.Exists("music/end_random_music/other" , "DATA")) then --Check for folder
        print ("[End_Random_Music] Basic folder check successful.")
        print ("[End_Random_Music] Checking for extra folders.")
    else
        print ("[End_Random_Music] Basic folder check failed. Creating missing folders.");
        file.CreateDir("music/end_random_music/innocent");
        file.CreateDir("music/end_random_music/traitor");
        file.CreateDir("music/end_random_music/other");
        print ("[End_Random_Music] Checking for extra folders.")
    end
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
    elseif (branch == ttt) then
        if (ttt_custom_roles_true == 1) then
            if (file.Exists("music/end_random_music/custom_jester", "DATA")) then
                print ("[End_Random_Music] Found Jester folder.")
            else
                print ("[End_Random_Music] Missing Jester folder. Creating...")
                file.CreateDir("music/end_random_music/custom_jester")
            end
            if (file.Exists("music/end_random_music/custom_killer", "DATA")) then
                print ("[End_Random_Music] Found Killer folder.")
            else
                print ("[End_Random_Music] Missing Killer folder. Creating...")
                file.CreateDir("music/end_random_music/custom_killer")
            end
            if (file.Exists("music/end_random_music/custom_monsters", "DATA")) then
                print ("[End_Random_Music] Found Monsters folder.")
            else
                print ("[End_Random_Music] Missing Monsters folder. Creating...")
                file.CreateDir("music/end_random_music/custom_monsters")
            end
        end
    end


    net.Receive( "ttt_end_random_music", function( byte, Player )
    if (GetConVar("ttt_end_random_music_source"):GetString() == "0") then
        filePath = "data/"
    elseif (GetConVar("ttt_end_random_music_source"):GetString() == "1") then
        filePath = "sound/"
    else
        print ("[End_Random_Music] Error with ConVar")
    end
    local text = net.ReadString( );
    playurl = filePath .. "music/end_random_music/" .. text;
    print ("[End_Random_Music] trying to play:" .. playurl);
    sound.PlayFile( playurl, "noplay", function( station, errCode, errStr )
        if ( IsValid( station ) ) then
            station:Play()
            else
                print( "[End_Random_Music] Error playing sound!", errCode, errStr )
            end
        end )
    end )
end
end