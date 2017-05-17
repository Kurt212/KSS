/*
    File: fn_Eat
    Exec: KSS_fnc_progressBar
    Author: Kurt
    Arguments :
        0 - (SCALAR) food
*/

KSS_hunger = KSS_hunger + (_this select 0);
KSS_hunger = (KSS_hunger min 100) max 0;

switch (true) do { 
    case ((KSS_hunger > 40) && (KSS_staminaLimit <= 30)) : {
        KSS_staminaLimit = 60;
        setStaminaScheme "Default";
    };
    case ((KSS_hunger <= 15) && (KSS_staminaLimit > 15)) : {
        KSS_staminaLimit = 15;
        setStaminaScheme "Exhausted";
    };
    case ((KSS_hunger <= 40) && (KSS_staminaLimit > 30)) : {
        KSS_staminaLimit = 30;
        setStaminaScheme "Exhausted";
    };
};    

if (KSS_enableHints) then {
    switch(KSS_hunger) do {
        case 60: {
            hint localize "STR_KSS_lowHunger_1";
        };
        case 40: {
            hint localize "STR_KSS_lowHunger_2";
        };
        case 20: {
            hint localize "STR_KSS_lowHunger_3";
        };
        case 10: {
            hint localize "STR_KSS_lowHunger_4";
            player setDamage (damage player) * 1.5;
        };
        case 0: {
            hint localize "STR_KSS_lowHunger_death";
            player setDamage 1;
        };
    };
};
