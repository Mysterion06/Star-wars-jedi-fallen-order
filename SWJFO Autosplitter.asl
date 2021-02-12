state("starwarsjedifallenorder")
{
    float IGT: 0x0396BAB8, 0x40, 0x334;
    int menuScreen: 0x0303B290, 0xA68;
    int map: 0x039259E8, 0x8, 0x3A8, 0xB48;
    byte mapBYTE: 0x0303B290, 0xA68;
    int inventory: 0x023F08F0, 0x4BC;
    float playerPos: 0x11B361B0, 0x350, 0x1F0;
    float playerPos2: 0x11B361B0, 0x350, 0x1E0;
    int Bracca: 0x036D8830, 0x8, 0x138, 0x180;
}

init
{
    vars.split = 0;
}

startup
{
    settings.Add("Any%");
    settings.Add("NoPBC");
}

start{
    if(current.playerPos < -7000 && current.playerPos > -8000 && current.IGT > old.IGT && current.map == 0){
        vars.split = 0;
        return true;
    }
}

split
{
    if((current.playerPos > -307352 && current.playerPos < -307350 && current.Bracca == 64 && vars.split == 0)//Bracca 1
    ||
    (current.playerPos > -2600 && current.playerPos < -2540 && current.Bracca == 271 && vars.split == 1)//Bogano 2
    ||
    (current.playerPos > -28900 && current.playerPos < -28845 && current.Bracca == 525 && vars.split == 2 && settings["NoPBC"])//Zeffo 3
    ||
    (current.playerPos > -6660 && current.playerPos < -6500 && current.playerPos2 >-430 && current.Bracca == 1080 && vars.split == 3)//Kashyyyk 4
    ||
    (current.playerPos < -280 && old.playerPos > -280 && current.Bracca == 778 && vars.split == 4)//Dathomir 5
    ||
    (current.playerPos > -2620 && current.playerPos < -2550 && current.Bracca == 267 && vars.split == 5)//Bogano 2 6
    ||
    (current.playerPos > 8130 && current.playerPos < 8202 && current.playerPos2 > 3970 && current.playerPos2 < 4020 && current.Bracca == 129 && vars.split == 6))//Nur 7
    { 
        vars.split++;
        return true;
    }
}

reset
{
    if(current.map == 2048 && current.mapBYTE == 0 && old.mapBYTE == 25){
        vars.split = 0;
        return true;
    }
}


isLoading
{
    if(current.map == 2048 && current.playerPos2 > 402 && current.playerPos2 < 404 || current.playerPos2 == 50f && current.Bracca != 337 && current.Bracca != 185){
        return true;
    }else{
        return false;
    }
}


update{
    print("Current menuScreen: " + current.menuScreen);
    print("Current mapBYTE: " + current.mapBYTE);
    print("Current playerpos" + current.playerPos);
    print("Current split: " + vars.split);
}