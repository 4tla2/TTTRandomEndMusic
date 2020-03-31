--[[
    Written by 4tla2
    Using the Unlicense
    https://unlicense.org
]]
if SERVER then

    --Init basic stuff
    local SystemType = package.config:sub(1,1)
    CreateConVar("ttt_end_random_music_wintype", 0, FCVAR_SERVER_CAN_EXECUTE, "Enable if you want teamspecific win music at the end of the round", 0, 1)
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
    else
        branch = "ttt"
    end
    if(file.Exists("music/end_random_music/innocent" , "DATA") && file.Exists("music/end_random_music/traitor" , "DATA") && file.Exists("music/end_random_music/other" , "DATA")) then --Check for folder
        print ("[End_Random_Music] Folder check successful.")
    else
        print ("[End_Random_Music] Folder check failed. Creating missing folders. It is likely that you need to restart your game to load added musicfiles");
        file.CreateDir("music/end_random_music/innocent");
        file.CreateDir("music/end_random_music/traitor");
        file.CreateDir("music/end_random_music/other");
    end

    --The Magic
    function roundend(wintype)
        print ("[End_Random_Music] Wintype is: "..wintype)

        --Search for files
        filesGlobal = {}
        filesInnocent = {}
        filesOther = {}
        filesTraitor = {}
        print ("[End_Random_Music] Searching files:")
        filesInnocent = file.Find("music/end_random_music/innocent/*.wav", "DATA")
        resource.AddFile( "data/music/end_random_music/innocent/*.wav" )
        if (filesInnocent != nil) then
            for i = 1, table.getn(filesInnocent), 1 do
                table.insert(filesGlobal, "innocent/"..filesInnocent[i])
            end
        end
        resource.AddFile( "music/end_random_music/innocent/*.wav" )
        filesTraitor = file.Find("music/end_random_music/traitor/*.wav", "DATA")
        resource.AddFile( "data/music/end_random_music/traitor/*.wav" )
        if (filesTraitor != nil) then
            for i = 1, table.getn(filesTraitor), 1 do
                table.insert(filesGlobal, "traitor/"..filesTraitor[i])
            end
        end
        filesOther = file.Find("music/end_random_music/other/*.wav", "DATA")
        resource.AddFile( "data/music/end_random_music/other/*.wav" )
        if (filesOther != nil) then
            for i = 1, table.getn(filesOther), 1 do
                table.insert(filesGlobal, "other/"..filesOther[i])
            end
        end
        if (filesGlobal != nil) then
            for i = 1, table.getn(filesGlobal), 1 do
                print ("[End_Random_Music] Found "..filesGlobal[i])
            end
        end

        --Shuffel and send info to client
        if (filesGlobal != nil) then
            --Unspecific wintype
            if (GetConVar("ttt_end_random_music_wintype"):GetString() == "0") then
                for n = 0, 10 do
                    math.randomseed(os.time())
                    musicTitle = math.random(table.getn(filesGlobal))
                end
                net.Start("ttt_end_random_music");
                    net.WriteString( filesGlobal[musicTitle] );
                net.Broadcast();
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
    concommand.Add("ttt_endroundmusic_reloadstart", function()
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
        else
            branch = "ttt"
        end
        if(file.Exists("music/end_random_music/innocent" , "DATA") && file.Exists("music/end_random_music/traitor" , "DATA") && file.Exists("music/end_random_music/other" , "DATA")) then --Check for folder
            print ("[End_Random_Music] Folder check successful.")
        else
            print ("[End_Random_Music] Folder check failed. Creating missing folders. It is likely that you need to restart your game to load added musicfiles");
            file.CreateDir("music/end_random_music/innocent");
            file.CreateDir("music/end_random_music/traitor");
            file.CreateDir("music/end_random_music/other");
        end
    end)
end