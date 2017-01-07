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
    private _display = uiNamespace getVariable ["RSS_HUD_0", displayNull];
    if (isNull _display) then {
        ("KSS_HUD_0" call BIS_fnc_rscLayer) cutRsc ["KSS_HUD_0", "PLAIN"];
    };
    if(KSS_progress_hunger) then {
        (_display displayCtrl 2110) ctrlSetText format [
            localize("STR_KSS_hudHunger"),
            missionNamespace getVariable ["KSS_hunger", 0]];
    } else {
        (_display displayCtrl 2110) ctrlSetText "";
    };
    if(KSS_progress_thirst) then {
        (_display displayCtrl 2120) ctrlSetText format [
            localize("STR_KSS_hudThirst"),
            missionNamespace getVariable ["KSS_thirst", 0]];
    } else {
        (_display displayCtrl 2120) ctrlSetText "";
    };
};

["KSS_HUD_0", "onEachFrame", KSS_fnc_drawHUD] call BIS_fnc_addStackedEventHandler;
