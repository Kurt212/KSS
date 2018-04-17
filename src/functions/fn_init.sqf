/*
    File: fn_init
    Exec: module
    Author: Kurt
    Arguments :
        Null
*/

#include "\x\cba\addons\main\script_macros_common.hpp"

#define def_HUNGER_DELAY 72
#define def_THIRST_DELAY 36

/*
private _logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
private _activated = [_this,2,true,[true]] call BIS_fnc_param;
*/

/* wait until all disable modules are inited */

private _disableModules_count = count (allMissionObjects "KSS_Module_Disable");

if (canSuspend && _disableModules_count > 0) then {
    waitUntil {
        uiSleep 0.25;
        !isNil "KSS_disableModulesInited"  && {KSS_disableModulesInited == _disableModules_count}
    };
};

/* better run in unscheduled env */
if (canSuspend) exitWith {
    [KSS_fnc_init, _this] call CBA_fnc_directCall;
};

params [
    ["_logic", objNull],
    "",
    ["_activated", true]
];

if (isDedicated or not _activated or not isNil "KSS_progress") exitWith {
    diag_log text "KSS: can't init KSS. Something went wrong.";
};

if (!isNil "KSS_disabled") exitWith {
    diag_log text "KSS: KSS was disabled by module"
};

// ================================================================
// Reading Module settings
// ================================================================

KSS_delay_hunger = _logic call {
    KSS_rawDelay_hunger = _this getVariable ["hungerDelay", def_HUNGER_DELAY];
    _return = KSS_rawDelay_hunger * 60 / 100;
    _return
};

KSS_delay_thirst = _logic call {
    KSS_rawDelay_thirst = _this getVariable ["thirstDelay", def_THIRST_DELAY];
    private _return = KSS_rawDelay_thirst * 60 / 100;
    _return
};

KSS_drawingHUD = _logic getVariable ["drawHUD", False];

KSS_enableHints = _logic getVariable ["enableHints", True];

KSS_progress = true;

// Write Module settings to diary
[] call KSS_fnc_diaryRecord;

// ================================================================
// Starting Hunger, Thirst and Alocohol
// ================================================================

KSS_progress_hunger = true;
KSS_progress_thirst = true;
KSS_staminaLimit = 60;

KSS_hunger_delay_offset = round random (KSS_delay_hunger * 0.1);
KSS_thirst_delay_offset = round random (KSS_delay_thirst * 0.1);

KSS_hunger = 100;
KSS_thirst = 100;

[
    "KSS_staminaControll",
    "onEachFrame",
    {
        if (KSS_staminaLimit != 60) then {
            player setStamina ((getstamina player) min (KSS_staminaLimit));
        };
    }
] call BIS_fnc_addStackedEventHandler;

// So that it is possible to cause death via setting KSS variables
[
    "KSS_variableContoller",
    "onEachFrame",
    {
        if (KSS_hunger <= 0) then {
            if (KSS_enableHints) then {
                hint localize "STR_KSS_lowHunger_death";
            };
            player setDamage 1;
        };
        if (KSS_thirst <= 0) then {
            if (KSS_enableHints) then {
                hint localize "STR_KSS_lowThirst_death";
            };
            player setDamage 1;
        };
    }
] call BIS_fnc_addStackedEventHandler;

KSS_hungerScript = [] spawn {
    diag_log text "KSS: Hunger init";

    KSS_sleepTime_hunger = time + KSS_delay_hunger + KSS_hunger_delay_offset;

    while {true} do
    {
        waitUntil {uiSleep 0.25; time >= KSS_sleepTime_hunger};

        if(KSS_progress_hunger) then {
            [-1] call KSS_fnc_Eat;
        };

        KSS_sleepTime_hunger = time + KSS_delay_hunger;
    };
};

KSS_thirstScript = [] spawn {
    diag_log text "KSS: Thirst init";

    KSS_sleepTime_thirst = time + KSS_delay_thirst + KSS_thirst_delay_offset;

    while {true} do
    {
        waitUntil {uiSleep 0.25; time >= KSS_sleepTime_thirst};

        if (KSS_progress_thirst) then {
            [-1] call KSS_fnc_Drink;
        };

        KSS_sleepTime_thirst = time + KSS_delay_thirst;
    };
};

KSS_alcoholLevel = 0;
KSS_alcoholTimeOut = 0;
KSS_camShakeFrequency = 1;

// ================================================================
// Reading ArmA's config
// ================================================================

KSS_usableItems = [];
{
    private _cfg = configFile / _x;
    for "_i" from 1 to (count _cfg - 1) do {
        _item = _cfg select _i;
        if (isClass (_item / "KSS")) then {
            PUSH(KSS_usableItems, configName _item);
        };
    };
} forEach ["CfgWeapons" /* ,  "CfgMagazines", "CfgAmmo" */ ];

// ================================================================
// Adding necessary event-handlers
// ================================================================

[] spawn {
    waitUntil {sleep 1; !isNull player};

    if (KSS_drawingHUD) then {
        [] spawn KSS_fnc_drawDefaultHud;
    };

    // [] call KSS_fnc_effectLoop;

    player addEventHandler [
        "Killed",
        {
            KSS_progress_hunger = false;
            KSS_progress_thirst = false;

            KSS_alcoholLevel = 0;
            KSS_alcoholTimeOut = 0;
        }
    ];

    player addEventHandler [
        "Respawn",
        {
            KSS_hunger = 100;
            KSS_thirst = 100;

            KSS_progress_hunger = true;
            KSS_progress_thirst = true;
        }
    ];

    player addeventhandler ["InventoryOpened",{
        0 spawn {
            waituntil { !isNull(findDisplay 602) };

            ((findDisplay 602) displayCtrl 638) ctrlAddEventHandler ["LBDblClick", "_this spawn KSS_fnc_onItemUsed"];
            ((findDisplay 602) displayCtrl 633) ctrlAddEventHandler ["LBDblClick", "_this spawn KSS_fnc_onItemUsed"];
            ((findDisplay 602) displayCtrl 619) ctrlAddEventHandler ["LBDblClick", "_this spawn KSS_fnc_onItemUsed"];
        };
    }];

    addMissionEventHandler [
        "Loaded",
        {
            if(KSS_drawingHUD) then {
                [] spawn KSS_fnc_drawDefaultHud;
            };
        }
    ];
};

true
