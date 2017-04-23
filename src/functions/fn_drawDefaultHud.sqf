/*
    File: fn_drawDefaultHUD
    Exec: Module
    Author: Kurt
    Arguments :
        Null
*/

if ( !isNull(uiNamespace getVariable ["KSS_HUD_0", displayNull]) ) exitWith {};

("KSS_HUD_0" call BIS_fnc_rscLayer) cutRsc ["KSS_HUD_0", "PLAIN"];

while {uiSleep 0.1; true} do {
    disableSerialization;
    private _display = uiNamespace getVariable ["KSS_HUD_0", displayNull];
    if (isNull _display) then {
        ("KSS_HUD_0" call BIS_fnc_rscLayer) cutRsc ["KSS_HUD_0", "PLAIN"];
    };
    if(KSS_progress_hunger) then {
        if !(ctrlShown (_display displayCtrl 2110)) then {
            (_display displayCtrl 2110) ctrlShow true;
        };
        (_display displayCtrl 2110) ctrlSetText format [
            localize("STR_KSS_hudHunger"),
            missionNamespace getVariable ["KSS_hunger", 0]
        ];
        _progress = KSS_hunger / 100;
        if !(ctrlShown (_display displayCtrl 2111)) then {
            (_display displayCtrl 2111) ctrlShow true;
        };
        (_display displayCtrl 2111) progressSetPosition _progress;
    } else {
        if (ctrlShown (_display displayCtrl 2110)) then {
            (_display displayCtrl 2110) ctrlShow false;
        };
        if (ctrlShown (_display displayCtrl 2111)) then {
            (_display displayCtrl 2111) ctrlShow false;
        };
    };
    if(KSS_progress_thirst) then {
        if !(ctrlShown (_display displayCtrl 2120)) then {
            (_display displayCtrl 2120) ctrlShow true;
        };
        (_display displayCtrl 2120) ctrlSetText format [
            localize("STR_KSS_hudThirst"),
            missionNamespace getVariable ["KSS_thirst", 0]
        ];
        _progress = KSS_thirst / 100;
        if !(ctrlShown (_display displayCtrl 2121)) then {
            (_display displayCtrl 2121) ctrlShow true;
        };
        (_display displayCtrl 2121) progressSetPosition _progress;
    } else {
        if (ctrlShown (_display displayCtrl 2120)) then {
            (_display displayCtrl 2120) ctrlShow false;
        };
        if (ctrlShown (_display displayCtrl 2121)) then {
            (_display displayCtrl 2121) ctrlShow false;
        };
    };
};
