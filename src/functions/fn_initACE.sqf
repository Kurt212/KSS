if (! isNil "ace_interact_menu_fnc_createAction") then {
    
    private _condition = {
        params ["_target", "_player", "_params", "_actionData"];

        _c = (alive _target) AND
        (player isEqualTo _target) AND
        ({_x in KSS_usableItems} count (items player) > 0);
        _c;
    };

    private _modifierFunc = {};

    private _insertChildren = {
        params ["_target", "_player", "_params"];
        // systemChat format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

        // Add children to this action
        private _actions = [];
        private _already_added = [];
        {
            if ((_x in KSS_usableItems) && !(_x in _already_added)) then {
                _already_added pushBack _x;
                private _childStatement = {
                    // systemChat format ["using %1", _this];
                    _this select 2 spawn KSS_fnc_useItem;
                };
                private _action = [
                    format ["item:%1",_x],
                    getText(configFile/"CfgWeapons"/_x/"displayName"),
                    getText(configFile/"CfgWeapons"/_x/"picture"),
                    _childStatement,
                    {true},
                    {},
                    [_x]
                ] call ace_interact_menu_fnc_createAction;
                _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
            };
        } forEach (items _player);

        _actions
    };

    private _statement = {

    };

    KSS_ACEACTION = [
        "KSS_ACEACTION",
        localize("STR_KSS_moduleName"),
        "\tf_kss\icon.paa",
        _statement,
        _condition,
        _insertChildren,
        [],
        "",
        0,
        [false, false, false, true, false], 
        _modifierFunc
    ] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions"], KSS_ACEACTION] call ace_interact_menu_fnc_addActionToObject;
};
