/*
    File: fn_effectLoop.sqf
    Exec: KSS_fnc_init
    Author: Kurt
    Arguments :
        Null
*/

KSS_effect_sounds = [
    "WoundedGuyA_01",
    "WoundedGuyA_02",
    "WoundedGuyA_03",
    "WoundedGuyA_04",
    "WoundedGuyA_05",
    "WoundedGuyA_06",
    "WoundedGuyA_07",
    "WoundedGuyA_08",
    "WoundedGuyB_01",
    "WoundedGuyB_02",
    "WoundedGuyB_03",
    "WoundedGuyB_04",
    "WoundedGuyB_05",
    "WoundedGuyB_06",
    "WoundedGuyB_07",
    "WoundedGuyB_08",
    "WoundedGuyC_01",
    "WoundedGuyC_02",
    "WoundedGuyC_03",
    "WoundedGuyC_04",
    "WoundedGuyC_05"
];

KSS_fnc_colorCorrection = {
    params ["_par", "_duration", ["_prior", 1000]];
    _eff = ppEffectCreate ["ColorCorrections", _prior];
    _eff ppEffectAdjust _par;
    _eff ppEffectEnable true;
    _eff ppEffectCommit _duration;
    if (canSuspend) then {
        waitUntil {ppEffectCommitted _eff};
        ppEffectDestroy _eff;
    } else {
        _eff spawn {
            waitUntil {ppEffectCommitted _this};
            ppEffectDestroy _this;
        };
    };
};

KSS_last_blackout = -10 * 60;

KSS_hungerEffect_script = [] spawn {
    while {sleep KSS_delay_hunger; true} do {
        if ((alive player) && (KSS_hunger <= 50) && (5 >= random 100) 
        && (time - KSS_last_blackout > (10 * 60))) then {
            KSS_last_blackout = time;
            _sound = selectRandom KSS_effect_sounds;
            [player, _sound] remoteExec ["say3D", 0];
            /*
            addCamShake [40 / KSS_hunger, 10, 1];
            private _brightness = KSS_hunger / 100;
            private _contrast = KSS_hunger / 100;
            [
                [
                    _brightness min 0.6,
                    _contrast min 0.6,
                    0, 
                    0, 0, 0, 0, 
                    1, 1, 1, 1, 
                    0.299, 0.587, 0.114, 0
                ],
                3 + (floor random 5)
            ] call KSS_fnc_colorCorrection;
            */
        };
    };
};
