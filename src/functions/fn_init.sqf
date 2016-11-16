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

private _logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
private _activated = [_this,2,true,[true]] call BIS_fnc_param;

if(isDedicated or not _activated or not isNil "KSS_progress") exitWith {
	diag_log("KSS: can't init KSS. Something went wrong.");
};

KSS_delay_hunger = _logic call {
	private _tmp = _this getVariable ["hungerDelay", def_HUNGER_DELAY];
	_return = _tmp * 60 / 100;
	_return
};

KSS_delay_thirst = _logic call {
	private _tmp = _this getVariable ["thirstDelay", def_THIRST_DELAY];
	private _return = _tmp * 60 / 100;
	_return
};

KSS_drawingHUD = _logic getVariable ["drawHUD", False];

KSS_progress = true;
KSS_progress_hunger = true;
KSS_progress_thirst = true;

KSS_hungerScript = [] spawn {
	diag_log("KSS: Hunger init");

	KSS_hunger = 100;
	KSS_sleepTime_hunger = time + KSS_delay_hunger;

	while {true} do 
	{
		waitUntil {time >= KSS_sleepTime_hunger};

		if(KSS_progress_hunger) then {
			DEC(KSS_hunger);
			switch(KSS_hunger) do {
				case 60: {
					hint localize "STR_KSS_lowHunger_1";
				};
				case 40: {
					hint localize "STR_KSS_lowHunger_2";
				};
				case 20: {
					hint localize "STR_KSS_lowHunger_3";
				};
				case 10: {	
					hint localize "STR_KSS_lowHunger_4";
					player setDamage (damage player) * 1.5;
				};
				case 0: {
					hint localize "STR_KSS_lowHunger_death";
					player setDamage 1;
				};
			};
		};

		KSS_sleepTime_hunger = time + KSS_delay_hunger;
	};
};

KSS_thirstScript = [] spawn {
	diag_log("KSS: Thirst init");

	KSS_thirst = 100;
	KSS_sleepTime_thirst = time + KSS_delay_thirst;

	while {true} do 
	{
		waitUntil {time >= KSS_sleepTime_thirst};
		
		if (KSS_progress_thirst) then { 
			DEC(KSS_thirst);
			switch(KSS_thirst) do {
				case 60: {
					hint localize "STR_KSS_lowThirst_1";
				};
				case 40: {
					hint localize "STR_KSS_lowThirst_2";
				};
				case 20: {
					hint localize "STR_KSS_lowThirst_3";
				};
				case 10: {	
					hint localize "STR_KSS_lowThirst_4";
					player setDamage (damage player) * 1.5;
				};
				case 0: {
					hint localize "STR_KSS_lowThirst_death";
					player setDamage 1;
				};
			};
		};

		KSS_sleepTime_thirst = time + KSS_delay_thirst;
	};
};

KSS_usableItems = [];
_cfg = configFile / "CfgWeapons";
for "_i" from 1 to (count _cfg - 1) do {
	_item = _cfg select _i;
	if (isClass (_item / "KSS")) then {
		PUSH(KSS_usableItems, configName _item);
	};
};

[] spawn {
	waitUntil {sleep 1; !isNull player};

	if(KSS_drawingHUD) then {
		[] call KSS_fnc_drawDefaultHud;
	};

	player addEventHandler [
		"Killed",
		{
			KSS_progress_hunger = false;
			KSS_progress_thirst = false;

			KSS_alcoholLevel = 0;
			KSS_alcoholTimeOut = 0;
			terminate KSS_alcoholUnconsciousScript;
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
};

KSS_alcoholLevel = 0;
KSS_alcoholTimeOut = 0;
KSS_camShakeFrequency = 2;

true