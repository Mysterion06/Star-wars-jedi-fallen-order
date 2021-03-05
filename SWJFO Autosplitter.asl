//By Mysterion_06_
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
    byte LRT: 0x036C4D50, 0x8D0, 0x3D8;
    byte LRT2: 0x36E7200;
}

init
{
    vars.split = 0;
}

startup
{
    settings.Add("Any%");
    settings.Add("Any%-NoPBC");
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
    (current.playerPos > -29000 && current.playerPos < -28700 && current.playerPos2 > 17400 && current.Bracca == 535 && vars.split == 2 && settings["Any%-NoPBC"])//Zeffo 3
    ||
    (current.playerPos > -28680 && current.playerPos < -28395 && current.playerPos2 > 17500 && current.playerPos2 < 17800 && current.Bracca == 525 && vars.split == 2 && settings["Any%"])//Zeffo 3 skip
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
    if(current.LRT2 != 0 && current.LRT == 1){
        return true;
    } else{
        return false;
    }
}
