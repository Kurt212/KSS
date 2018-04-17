/*
    File: fn_Drink
    Exec: KSS_fnc_progressBar
    Author: Kurt
    Arguments :
        0 - (SCALAR) water
*/

KSS_thirst = KSS_thirst + (_this select 0);
KSS_thirst = (KSS_thirst min 100) max 0;

switch(KSS_thirst) do {
    case 60: {
        if (KSS_enableHints) then {
            hint localize "STR_KSS_lowThirst_1";
        };
    };
    case 40: {
        if (KSS_enableHints) then {
            hint localize "STR_KSS_lowThirst_2";
        };
    };
    case 20: {
        if (KSS_enableHints) then {
            hint localize "STR_KSS_lowThirst_3";
        };
    };
    case 10: {
        if (KSS_enableHints) then {
            hint localize "STR_KSS_lowThirst_4";
        };
        player setDamage (damage player) * 1.5;
    };
    case 0: {
        if (KSS_enableHints) then {
            hint localize "STR_KSS_lowThirst_death";
        };
        player setDamage 1;
    };
};

