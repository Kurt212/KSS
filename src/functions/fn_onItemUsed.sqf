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
    _data = "getText (_x >> 'displayName') == _text && isClass (_x >> 'KSS')" configClasses(configFile >> "CfgWeapons");
    if (count _data > 0) then {
        _item = configName (_data select 0);
    };
};

[_item] spawn KSS_fnc_useItem;
