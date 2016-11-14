/*
	File: fn_onItemUsed
	Exec: KSS_fnc_init
	Author: Kurt
	Arguments :
		0 - (CTRL) one of the 3 inventory ctrl's
		1 - (SCALAR) index of the selected item
*/

disableserialization;
private ["_ctrl","_index","_text","_item","_data"];
_ctrl = _this select 0;
_index = _this select 1;  

_text = _ctrl lbText _index;
_item = _ctrl lbData _index;

if (_item == "") then {
	_data = "getText (_x >> 'displayName') == _text" configClasses(configFile >> "CfgWeapons");
	if (count _data > 0) then {
		_item = configName (_data select 0);
	};
};

//closeDialog 2;
sleep 0.001;

_startScript = {
	params ["_type", "_time"];

	_sound = "";

	switch ( _type) do { 
		case "food" : {  
			_sound = "KSS_food";
		}; 
		case "drink" : { 
			_sound = "KSS_drink";
		};  
		case "both" : {
			_sound = "KSS_food";
		};
		case "alcohol" : {
			_sound = "KSS_drink";
		};
	};

	_end = time + _time * 0.8;

	while {time < _end} do 
	{
		[[player, _sound], { 
			params ["_unit", "_sound"];
			if (player distance _unit <= 5) then {
				_unit say3D _sound;
			};
		}] remoteExec ["bis_fnc_spawn"];
		sleep ((random 4) + 2); 
	};
};

_endScript = {
	params ["_item", "_type", "_add"];

	player removeItem _item;

	switch ( _type) do { 
		case "food" : {  
			[_add] call KSS_fnc_Eat;

			KSS_sleepTime_hunger = time + KSS_delay_hunger;
		}; 
		case "drink" : { 
			[_add] call KSS_fnc_Drink;

			KSS_sleepTime_thirst = time + KSS_delay_thirst;
		};  
		case "both" : {
			[_add] call KSS_fnc_Eat;
			[_add] call KSS_fnc_Drink;

			KSS_sleepTime_hunger = time + KSS_delay_hunger;
			KSS_sleepTime_thirst = time + KSS_delay_thirst;
		};
		case "alcohol" : {
			[_add, _item] call KSS_fnc_drinkAlcohol;

			_addWater = call compile getText(configFile >> "CfgWeapons" >> _item >> "KSS" >> "addWater");
			[_addWater] call KSS_fnc_Drink;

			KSS_sleepTime_thirst = time + KSS_delay_thirst;
		};
	};
};
	
if (_item in KSS_usableItems) then {
	_cfg = configFile >> "CfgWeapons" >> _item;
	_delay = getNumber(_cfg >> "KSS" >> "delay");
	_title = getText(_cfg >> "displayName");
	_type = getText(_cfg >> "KSS" >> "type");
	_add = call compile getText(_cfg >> "KSS" >> "add");
	[
		_delay,
		_title,
		[_type, _delay],
		_startScript,
		[_item, _type, _add],
		_endScript
	] call KSS_fnc_progressBar;
};
