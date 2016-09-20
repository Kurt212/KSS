("KSS_HUD_0" call BIS_fnc_rscLayer) cutRsc ["KSS_HUD_0", "PLAIN"];

KSS_fnc_drawHUD = {
	_display = uiNamespace getVariable "RSS_HUD_0";
	(_display displayCtrl 2110) ctrlSetText format ["Голод : %1", KSS_hunger];
	(_display displayCtrl 2120) ctrlSetText format ["Жажда : %1", KSS_thirst];
};

["KSS_HUD_0", "onEachFrame", KSS_fnc_drawHUD] call BIS_fnc_addStackedEventHandler;