/*
    File: fn_Drink
    Exec: KSS_fnc_progressBar
    Author: Kurt
    Arguments :
        0 - (SCALAR) water
*/

KSS_thirst = KSS_thirst + (_this select 0);
KSS_thirst = (KSS_thirst min 100) max 0;

if (KSS_enableHints) then {
    switch(KSS_thirst) do {
        case 60: {
            hint localize "STR_KSS_lowThirst_1";
        };
        case 40: {
            hint localize "STR_KSS_lowThirst_2";
        };
        case 20: {
            hint localize "STR_KSS_lowThirst_3";
        };
        case 10: {
            hint localize "STR_KSS_lowThirst_4";
            player setDamage (damage player) * 1.5;
        };
        case 0: {
            hint localize "STR_KSS_lowThirst_death";
            player setDamage 1;
        };
    };
};
