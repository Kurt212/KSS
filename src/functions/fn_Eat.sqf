/*
    File: fn_Eat
    Exec: KSS_fnc_progressBar
    Author: Kurt
    Arguments :
        0 - (SCALAR) food
*/

KSS_hunger = KSS_hunger + (_this select 0);
KSS_hunger = KSS_hunger min 100;

if(KSS_hunger <= 0) then {
    KSS_hunger = 0;
    player setDamage 1;
};
