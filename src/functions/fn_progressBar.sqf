/*
    File: fn_progressBar
    Exec: KSS_fnc_onItemUsed
    Author: Kurt
    Arguments :
        0 - (SCALAR) duration
        1 - (STRING) bar's title
        2 - (ARRAY) start script params
        3 - (SCRIPT}) start script
        4 - (ARRAY) end script params
        5 - (SCRIPT) end script
*/

#include "../dik_keyCodes.h"
// #define DEBUG

#ifdef DEBUG
systemChat str [__FILE__, _this];
#endif

while {dialog} do {
    closeDialog 0;
};
createDialog "KSS_ProgressBar_Dialog";

_this spawn {
    params ["_duration", "_title", ["_startScriptParams", []], ["_startScript", {}], ["_endScriptParams", []], ["_endScript", {}]];

    #ifdef DEBUG
    _debugStartTime = time;
    _debugDelay = _this select 0;
    #endif

    // init vars
    disableSerialization;
    _dialog = uiNamespace getVariable ["KSS_ProgressBar", displayNull];
    if (isNull _dialog) exitWith {
        diag_log("KSS: unable to create KSS_ProgressBar_Dialog");
    };
    _ctrlProgressBar = (_dialog displayCtrl 1600);
    _ctrlProgressBarTitle = (_dialog displayCtrl 1000);

    // in case we cancell action
    KSS_interrupted = false;
    _dialog displayaddEventHandler [
        "KeyDown",
        {
            params["_display", "_key"];
            if(_key == DIK_ESCAPE) then {
                KSS_interrupted = true;
                [_display, 1] spawn KSS_fnc_destroyDialog;
            };
            true;
        }
    ];

    // if playing with TFAR add handlers to dialog
    if (isClass (configFile / "CfgPatches" / "task_force_radio")) then {
        _dialog displayAddEventHandler ["KeyUp", "_this call TFAR_fnc_onSwTangentReleasedHack"];
        _dialog displayAddEventHandler ["keyDown", "_this call TFAR_fnc_onSwTangentPressedHack"];
        _dialog displayAddEventHandler ["keyUp", "_this call TFAR_fnc_onLRTangentReleasedHack"];
        _dialog displayAddEventHandler ["keyUp", "_this call TFAR_fnc_onDDTangentReleasedHack"];
    };

    // the filling script
    [
        "KSS_Timer",
        "onEachFrame",
        {
            params["_start", "_end", "_barCtrl", "_titleCtrl", "_itemName"];
            _progress = linearConversion[ _start, _end, time, 0, 1];
            _barCtrl progressSetPosition _progress;
            _titleCtrl ctrlSetText format ["%1 (%2%3)", _itemName, round (_progress * 100), "%"];
            // _title ctrlSetStructuredText parseText format["%1%2", round(100*_progress), "%"];
            if ((_progress > 1) || (isNull (ctrlParent _barCtrl))) then {
                ["KSS_Timer", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
            };
        },
        [
            time,
            time + _duration,
            _ctrlProgressBar,
            _ctrlProgressBarTitle,
            _title
        ]
    ] call BIS_fnc_addStackedEventHandler;

    // start script
    _progressStartScript = _startScriptParams spawn _startScript;

    // in case smth is wrong many conditions
    _endTime = time + _duration;
    waitUntil {
        (isNull _dialog) || !(alive player) || (time > _endTime)
    };

    // stop all scripts we ran before
    terminate _progressStartScript;
    closeDialog 0;

    // if we succeed - run end script
    if (!(KSS_interrupted) and (alive player) and (time >= _endTime)) then {
        _endScriptParams spawn _endScript;
    };

    #ifdef DEBUG
    systemChat str ["Start", _debugStartTime, "End", time, "Diff", time - _debugStartTime, "Delay", _debugDelay];
    #endif
};
