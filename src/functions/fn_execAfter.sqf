/*
    File: fn_execAfter
    Exec: postInit
    Author: Kurt
    Arguments :
        0 - (ARRAY) first script params
        1 - (SCRIPT) first script
        2 - (ARRAY) second script params
        3 - (SCRIPT) second script
*/

params [["_startScriptParams", []], ["_startScript", {}], ["_endScriptParams", []], ["_endScript", {}]];

private _firstScript = _startScriptParams spawn _startScript;

waitUntil { scriptDone _firstScript };

_endScriptParams spawn _endScript;
