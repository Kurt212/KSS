/*
    File: fn_disalbe
    Exec: from module
    Author: Kurt
    Arguments :
        0 - (OBJECT) module
        1 - (ARRAY) synched onjects
        2 - (BOOL) activated
*/

if (isDedicated || !isNil"KSS_disabled") exitWith {};

/* better run in unscheduled env */
if (canSuspend) exitWith {
    [KSS_fnc_disable, _this] call CBA_fnc_directCall;  
};

// systemChat str _this;

params [
    ["_logic", objNull],
    ["_synched", []],
    ["_activated", true]
];

_type = _logic getVariable ["DisableType", 0];

switch (_type) do { 
    case 0 : {
        if (player in _synched) then {
            KSS_disabled = true;
        }
    }; 
    case 1 : {
        if (!isMultiplayer || isServer || (call BIS_fnc_admin) > 0) then {
            KSS_disabled = true;
        }
    }; 
};

if (isNil "KSS_disableModulesInited") then {
    KSS_disableModulesInited = 1;
} else {
    KSS_disableModulesInited = KSS_disableModulesInited + 1;
};

true
