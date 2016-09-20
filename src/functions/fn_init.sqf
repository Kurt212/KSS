#include "\x\cba\addons\main\script_macros_common.hpp"

#define def_HUNGER_DELAY 72
#define def_THIRST_DELAY 36

KSS_delay_hunger = [] call {
	private _c = missionConfigFile / "KSS_Settings" / "Hunger";
	if (isClass(_c)) then {
		getNumber(_c / "delay");
	} else {
		def_HUNGER_DELAY;
	};
};



KSS_delay_thirst = [] call {
	private _c = missionConfigFile / "KSS_Settings" / "Thirst";
	if (isClass(_c)) then {
		getNumber(_c / "delay");
	} else {
		def_THIRST_DELAY;
	};
};

KSS_progress_hunger = true;
KSS_progress_thirst = true;

[] spawn {
	diag_log("KSS: Hunger init");

	KSS_hunger = 100;
	KSS_sleepTime_hunger = time;

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
				case 1: {
					hint localize "STR_KSS_lowHunger_death";
					player setDamage 1;
				};
			};
		};

		KSS_sleepTime_hunger = time + KSS_delay_hunger;
	};
};

[] spawn {
	diag_log("KSS: Thirst init");

	KSS_thirst = 100;
	KSS_sleepTime_thirst = time;

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
				case 1: {
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

player addEventHandler [ 
	"Killed", 
	{
		KSS_progress_hunger = false;
		KSS_progress_thirst = false;
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

		((findDisplay 602) displayCtrl 638) ctrladdEventHandler ["LBDblClick", "_this spawn KSS_fnc_onItemUsed"];  
		((findDisplay 602) displayCtrl 633) ctrladdEventHandler ["LBDblClick", "_this spawn KSS_fnc_onItemUsed"];  
		((findDisplay 602) displayCtrl 619) ctrladdEventHandler ["LBDblClick", "_this spawn KSS_fnc_onItemUsed"];    
	};
}];