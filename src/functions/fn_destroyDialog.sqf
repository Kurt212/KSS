/*
	File: fn_destroyDialog
	Exec: from KSS_fnc_progressBar
	Author: Kurt
	Arguments :
		0 - (DISPLAY) diplay
		1 - (SCALAR) time	
*/	

disableSerialization;

params["_display", "_time"];

_dcoords = [
	[-2, 0],
	[+2, 0],
	[+0, -2],
	[+0, +2],
	[-2, -2],
	[+2, -2],
	[-2, +2],
	[+2, +2]
] call BIS_fnc_selectRandom;

_dcoords params ["_dx", "_dy"];

{
	_pos = ctrlPosition _x;
	_x ctrlSetPosition [(_pos select 0) + _dx, (_pos select 1) + _dy];
	_x ctrlSetFade 1;	
	_x ctrlCommit _time;
}forEach allControls _display;

UIsleep _time;
closeDialog 0;
