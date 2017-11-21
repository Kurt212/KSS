/*
    File: fn_drinkAlcohol.sqf
    Exec: KSS_fnc_progressBar
    Author: Kurt
    Arguments :
        0 - (SCALAR) alcohol
        1 - (SCALAR) effect duration;
*/

params ["_alcohol", "_duration"];

if (time < KSS_alcoholTimeOut) then {
    _alcohol = KSS_alcoholLevel + _alcohol;
    _duration = _duration * 1.5;
};

KSS_alcoholLevel = _alcohol;
KSS_alcoholTimeOut = time + _duration;

addCamShake [KSS_alcoholLevel, _duration /* * 2 */, KSS_camShakeFrequency];
/* Blur effect */
/* level 6 is value 1 for blur */
if (isNil "KSS_blurEffect") then {
    while {
        KSS_blurEffect = ppEffectCreate ["DynamicBlur", 600];
        KSS_blurEffect < 0 
    } do { 
        KSS_blurEffect = KSS_blurEffect + 1; 
    };
    KSS_blurEffect ppEffectEnable true;
};

KSS_blurEffect ppEffectAdjust [1 min (1 / 6 * KSS_alcoholLevel)];
KSS_blurEffect ppEffectCommit 0;
KSS_blurEffect ppEffectAdjust [0];
KSS_blurEffect ppEffectCommit _duration;

if (KSS_alcoholLevel >= 6) then {

    if !(isNil"ace_medical_fnc_setUnconscious") then {
        [] spawn {
            sleep (random 5);
            [player, true] call ace_medical_fnc_setUnconscious;
        };
    };
};
