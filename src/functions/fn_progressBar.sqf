closeDialog 0;
createDialog "KSS_ProgressBar_Dialog";

_this spawn {
	params ["_time", "_title", ["_startScriptParams", []], ["_startScript", {}], ["_endScriptParams", []],["_endScript", {}]];

	disableSerialization;
	_dialog = uiNamespace getVariable "KSS_ProgressBar";
	_ctrlProgressBar = (_dialog displayCtrl 1600);
	_ctrlProgressBarTitle = (_dialog displayCtrl 1000);

	KSS_interrupted = false;
	_dialog displaySetEventHandler ["KeyDown", "KSS_interrupted = true;"];
	_ctrlProgressBarTitle ctrlSetText _title;

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

	_progressStartScript = _startScriptParams spawn _startScript;

	waitUntil {
	  (isNull _dialog || !alive player || time > _time || KSS_interrupted)
	};

	terminate _progressScript;
	terminate _progressStartScript;
	closeDialog 0;

	if (!KSS_interrupted and alive player and time >= _time) then {
		_endScriptParams spawn _endScript;
	};
};