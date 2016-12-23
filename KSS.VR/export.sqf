// Export Github wiki

KSS_export_Line = "";

_txt = "
#Types
1. **Food** - adds points only to **Hunger** 
2. **Drink** - adds points only to **Thirst**
3. **Both** - adds points both to **Thirst** and **Hunger** 
4. **Alcohol** - adds points to **Alcohol**, and sometimes increases or decreases **Thirst**

#Table
| Display Name | Class name | Type | Add | Duration in seconds | Add to Thirst |
| ------------- |:-------------:|:-------------:|:-------------:|:-------------:| -----:|
";

_arr = +KSS_usableItems;
_arr sort true;

_br = toString [13,10];

#define AddLine(A) _txt = _txt + A + _br

{
    _config = configFile >> "CfgWeapons" >> _x;
    _name = getText(_config >> "displayName");
    _type = getText(_config >> "KSS" >> "type");
    _add = getText(_config >> "KSS" >> "add");
    _delay = getNumber(_config >>  "KSS" >> "delay");
    private "_line";
    if (_type == "alcohol") then {
        _addWater = getText(_config >> "KSS" >> "addWater");
        _line = format ["| %1 | %2 | %3 | %4 | %5 | %6 |", _name, _x, _type, _add, _delay, _addWater];
    } else {
        _line = format ["| %1 | %2 | %3 | %4 | %5 |   |", _name, _x, _type, _add, _delay];
    };

    AddLine(_line);

} forEach _arr;

copyToClipboard _txt;
hintSilent _txt;
KSS_export_Line = _txt;
