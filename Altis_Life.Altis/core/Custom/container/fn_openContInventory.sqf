/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine 
	Modified: Cammygames
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data"];
if(dialog) exitWith {};
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

if((_vehicle getVariable ["trunk_in_use",false])) exitWith {hint "This Container is in use, only one person can use it at a time."};
_vehicle setVariable["trunk_in_use",true,true];
if(!createDialog "TrunkMenu") exitWith {"Failed Creating Dialog Blame Cammygames";}; //Couldn't create the menu?
disableSerialization;

_veh_data = [_vehicle] call life_fnc_contWeight;
if(_veh_data select 0 == -1) exitWith {closeDialog 0};

ctrlSetText[3504,format["Weight: %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call life_fnc_contInventory;
life_cont_vehicle = _vehicle;

[_vehicle] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["trunk_in_use",false,true];
};