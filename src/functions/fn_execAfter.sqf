params [["_startScriptParams", []], ["_startScript", {}], ["_endScriptParams", []], ["_endScript", {}]];

_firstScript = _startScriptParams spawn _startScript;

waitUntil { scriptDone _firstScript };

_endScriptParams spawn _endScript;