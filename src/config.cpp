class CfgPatches
{
	class KSS
	{
		name = "Kurt's Survival System";
		author = "Kurt";
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};


class cfgFunctions 
{
	#include "cfgFunctions.hpp"
};

class cfgWeapons
{
	#include "cfgWeapons.hpp"
};

class CfgSounds
{
	sounds[] = {};
	#include "CfgSounds.hpp"
};

#include "dialogs.hpp"