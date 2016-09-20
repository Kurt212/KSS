class CfgPatches
{
	class KSS
	{
		name = "Kurt's Survival System";
		author[] = {"Kurt"};
		authorUrl = "https://github.com/Kurt212";

		version = 1.1.0;
		versionStr = "1.1.0";
		versionAr[] = {1,1,0};

		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"cba_main"};
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