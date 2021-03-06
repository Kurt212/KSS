params ["_item"];

sleep 0.1;

// systemChat str [__FILE__, _item];

_startScript = {
    params ["_type", "_time"];

    private _sound = "";

    switch ( _type) do { 
        case "food" : {
            _sound = "KSS_food";
        };
        case "drink" : {
            _sound = "KSS_drink";
        };
        case "both2";
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

    ["KSS_usedItem", [_item, _type]] call CBA_fnc_localEvent;

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
        case "both2" : {
            _add params ["_addFood", "_addWater"];
            [_addWater] call KSS_fnc_Drink;
            [_addFood] call KSS_fnc_Eat;

            KSS_sleepTime_hunger = time + KSS_delay_hunger;
            KSS_sleepTime_thirst = time + KSS_delay_thirst;
        };
        case "alcohol" : {
            _duration = call compile getText(configFile >> "CfgWeapons" >> _item >> "KSS" >> "duration");
            _addWater = call compile getText(configFile >> "CfgWeapons" >> _item >> "KSS" >> "addWater");

            [_addWater] call KSS_fnc_Drink;
            [_add, _duration] call KSS_fnc_drinkAlcohol;

            KSS_sleepTime_thirst = time + KSS_delay_thirst;
        };
    };
};

if (_item in KSS_usableItems) then {
    private _cfg = configFile >> "CfgWeapons" >> _item;
    private _missionCfg = missionConfigFile >> "CfgKSS" >> _item;
    private _title = getText(_cfg >> "displayName");
    _delay = 0;
    _type = "";
    _add = 0;
    if (isNumber (_missionCfg / "delay")) then {
        _delay = getNumber(_missionCfg / "delay");
    } else {
        _delay = getNumber(_cfg >> "KSS" >> "delay");
    };
    if (isText (_missionCfg / "type")) then {
        _type = getText(_missionCfg / "type");
    } else {
        _type = getText(_cfg / "KSS" / "type");
    };
    if (isText (_missionCfg / "add")) then {
        _add = call compile getText(_missionCfg / "add");
    } else {
        _add = call compile getText(_cfg / "KSS" / "add");
    };
    // systemChat str [_delay, _type, _add];
    [
        _delay,
        _title,
        [_type, _delay],
        _startScript,
        [_item, _type, _add],
        _endScript
    ] call KSS_fnc_progressBar;
};
