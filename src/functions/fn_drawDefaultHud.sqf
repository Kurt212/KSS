/*
	File: fn_drawDefaultHUD
	Exec: anywhere
	Author: Kurt
	Arguments :
		Null
*/



("KSS_HUD_0" call BIS_fnc_rscLayer) cutRsc ["KSS_HUD_0", "PLAIN"];

KSS_fnc_drawHUD = {
	_display = uiNamespace getVariable "RSS_HUD_0";
	if(KSS_progress_hunger) then {
		(_display displayCtrl 2110) ctrlSetText format [
			"Голод : %1",
			missionNamespace getVariable ["KSS_hunger", 0]];
	} else {
		(_display displayCtrl 2110) ctrlSetText "";
	};
	if(KSS_progress_thirst) then {
		(_display displayCtrl 2120) ctrlSetText format [
			"Жажда : %1",
			missionNamespace getVariable ["KSS_thirst", 0]];
	} else {
		(_display displayCtrl 2120) ctrlSetText "";
	};
};

["KSS_HUD_0", "onEachFrame", KSS_fnc_drawHUD] call BIS_fnc_addStackedEventHandler;
