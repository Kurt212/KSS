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

addCamShake [KSS_alcoholLevel, _duration * 2, KSS_camShakeFrequency];

if (KSS_alcoholLevel >= 6) then {

    if !(isNil"ace_medical_fnc_setUnconscious") then {
        [] spawn {
            sleep (random 5);
            [player, true] call ace_medical_fnc_setUnconscious;
        };
    };
};