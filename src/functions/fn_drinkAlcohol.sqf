/*
    File: fn_drinkAlcohol.sqf
    Exec: KSS_fnc_progressBar
    Author: Kurt
    Arguments :
        0 - (SCALAR) alcohol
        1 - (STRING) className;
*/

params ["_alcohol", "_className"];


_duration = call compile getText(configFile >> "CfgWeapons" >> _className >> "KSS" >> "duration");

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
        [player, true] call ace_medical_fnc_setUnconscious;
        terminate KSS_alcoholUnconsciousScript;

        KSS_alcoholUnconsciousScript = [] spawn {
            while {time < KSS_alcoholTimeOut * 0.8} do {
                sleep (KSS_alcoholLevel * 10 max 100);
                [player, true] call ace_medical_fnc_setUnconscious;
             };
        };
    };
};