/*
    File: fn_drawDefaultHUD
    Exec: Module
    Author: Kurt
    Arguments :
        Null
*/

if ( !isNull(uiNamespace getVariable ["RSS_HUD_0", displayNull]) ) exitWith {};

("KSS_HUD_0" call BIS_fnc_rscLayer) cutRsc ["KSS_HUD_0", "PLAIN"];

KSS_fnc_drawHUD = {
    // getting _display from UInamespace
    private _display = uiNamespace getVariable ["RSS_HUD_0", displayNull];
    if (isNull _display) then {
        ("KSS_HUD_0" call BIS_fnc_rscLayer) cutRsc ["KSS_HUD_0", "PLAIN"];
    };

    // defining 2 text ctrls
    private _hungerText = _display displayCtrl 2110;
    private _thirstText = _display displayCtrl 2120;

    // ================================================================
    // Drawing Hunger
    // ================================================================

    if (KSS_progress_hunger) then {
        private _hungerValue = missionNamespace getVariable ["KSS_hunger", 0];
        private _colorText = [] call {
            if (_hungerValue < 20) then {
                "#FF0000"
            } else {
                ""
            }
        };
        _hungerText ctrlSetStructuredText parseText format [
            localize("STR_KSS_hudHunger"),
            _hungerValue,
            _colorText
        ];
    } else {
        _hungerText ctrlSetText "";
    };

    // ================================================================
    // Drawing Hunger
    // ================================================================

    if (KSS_progress_thirst) then {
        private _thirtValue = missionNamespace getVariable ["KSS_thirst", 0];
        private _colorText = [] call {
            systemChat str _thirtValue;
            if (_thirtValue < 20) then {
                "#FF0000"
            } else {
                ""
            }
        };
        _thirstText ctrlSetStructuredText parseText format [
            localize("STR_KSS_hudThirst"),
            _thirtValue,
            _colorText
        ];
    } else {
        _thirstText ctrlSetText "";
    };
};

["KSS_HUD_0", "onEachFrame", KSS_fnc_drawHUD] call BIS_fnc_addStackedEventHandler;
