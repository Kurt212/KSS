#include "../dik_keyCodes.h"

closeDialog 0;
createDialog "KSS_ProgressBar_Dialog";

_this spawn {
	params ["_time", "_title", ["_startScriptParams", []], ["_startScript", {}], ["_endScriptParams", []],["_endScript", {}]];

	// init vars
	disableSerialization;
	_dialog = uiNamespace getVariable "KSS_ProgressBar";
	_ctrlProgressBar = (_dialog displayCtrl 1600);
	_ctrlProgressBarTitle = (_dialog displayCtrl 1000);

	// in case we cancell action
	KSS_interrupted = false;
	_dialog displayaddEventHandler ["KeyDown",  
		{
			params["_display", "_key"];

			if(_key == DIK_ESCAPE) then {

				[[_display, 0.75],  KSS_fnc_destroyDialog, [], {KSS_interrupted = true}] spawn KSS_fnc_execAfter;

			};

			true;
		}
	];

	_ctrlProgressBarTitle ctrlSetText _title;

	// the filling script
	_progressScript = [_ctrlProgressBar, _time] spawn {

		disableSerialization;
		params ["_bar", "_time"];
		_count = 50;
		_add = 1 / _count;
		_sleep = _time / _count;
		while {progressPosition _bar != 1} do {
			_bar progressSetPosition ((progressPosition _bar) + _add);
			uiSleep _sleep;
		};
	};

	_time = time + _time;
	// start script
	_progressStartScript = _startScriptParams spawn _startScript;

	// in case smth is wrong many conditions
	waitUntil {
	  (isNull _dialog || !alive player || time > _time || KSS_interrupted)
	};

	// stop all scripts we ran before
	terminate _progressScript;
	terminate _progressStartScript;
	closeDialog 0;

	if (!KSS_interrupted and alive player and time >= _time) then {
		// if we secceed - run end script
		_endScriptParams spawn _endScript;
	};
};