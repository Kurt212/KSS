/*
    File: fn_showKSSInfo
    Author: Kurt
    Arguments : NONE
*/

if (!canSuspend) exitWith {
    _this spawn KSS_fnc_showKSSInfo;
};

disableSerialization;
// unscheduled

isNil {
    createDialog "KSS_Info";
_display = uiNamespace getVariable "KSS_Info";
_group = uiNamespace getVariable "KSS_Info_Group";
_html = uiNamespace getVariable "KSS_Info_RscHTML";
    _group ctrlSetFade 1;
    _group ctrlCommit 0;
    
    _html ctrlShow false;
    _html ctrlCommit 0;
    if (language isEqualTo "Russian") then {
        _html htmlLoad "http://kurt212.github.io/kss_ru.html";
    } else {
        _html htmlLoad "http://kurt212.github.io/kss_en.html";
    };
    if (!ctrlHTMLLoaded _html) exitWith {
        diag_log text "KSS: htmlLoad failed. Perhaps, you have problems with Internet connection";
        _display closeDisplay 0;
    };
};
_group = uiNamespace getVariable "KSS_Info_Group";
_html = uiNamespace getVariable "KSS_Info_RscHTML";

_group ctrlSetFade 0;
_group ctrlCommit 1;

waitUntil {
    ctrlCommitted _group
};

_html ctrlShow true;
