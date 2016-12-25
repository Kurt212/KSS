/*
    File: fn_Drink
    Exec: KSS_fnc_progressBar
    Author: Kurt
    Arguments :
        0 - (SCALAR) water
*/

KSS_thirst = KSS_thirst + (_this select 0);
KSS_thirst = KSS_thirst min 100;

if(KSS_thirst <= 0) then {
    KSS_thirst = 0;
    hint localize "STR_KSS_lowThirst_death";
    player setDamage 1;
};
