--[[
    Written by 4tla2
    Using the Unlicense
    https://unlicense.org
]]
if CLIENT then
    if(file.Exists("music/end_random_music/innocent" , "DATA") && file.Exists("music/end_random_music/traitor" , "DATA") && file.Exists("music/end_random_music/other" , "DATA")) then
        print ("[End_Random_Music] Folder check successful.")
    else
        print ("[End_Random_Music] Folder check failed. Creating missing folders. It is likely that you need to restart your game to load added musicfiles");
        file.CreateDir("music/end_random_music/innocent");
        file.CreateDir("music/end_random_music/traitor");
        file.CreateDir("music/end_random_music/other");
    end
    net.Receive( "ttt_end_random_music", function( byte, Player )
        local text = net.ReadString( );
        playurl = "data/music/end_random_music/"..text;
        print ("[End_Random_Music] trying to play:"..playurl);
        sound.PlayFile( playurl, "noplay", function( station, errCode, errStr )
            if ( IsValid( station ) ) then
                station:Play()
            else
                print( "[End_Random_Music] Error playing sound!", errCode, errStr )
            end
        end )
    end )
end