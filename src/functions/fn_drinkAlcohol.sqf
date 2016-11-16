/*
    File: fn_drinkAlcohol.sqf
    Exec: KSS_fnc_progressBar
    Author: Kurt
    Arguments :
        0 - (SCALAR) alcohol
        1 - (STRING) effect duration;
*/

params ["_alcohol", "_duration"];

if (time > KSS_alcoholTimeOut) then {
    KSS_alcoholLevel = _alcohol;
    KSS_alcoholTimeOut = time + _duration;

    addCamShake [KSS_alcoholLevel, _duration, KSS_camShakeFrequency];
} else {
    KSS_alcoholLevel = KSS_alcoholLevel + _alcohol;
    KSS_alcoholTimeOut = time + _duration * 1.5;

    addCamShake [KSS_alcoholLevel, _duration * 1.5, KSS_camShakeFrequency];
};

if (KSS_alcoholLevel >= 6) then {

    if !(isNil"ace_medical_fnc_setUnconscious") then {

        [player, true, (KSS_alcoholLevel * 5 min 30)] call ace_medical_fnc_setUnconscious;
    };
};