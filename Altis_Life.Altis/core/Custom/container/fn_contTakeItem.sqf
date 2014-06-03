#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	Modified: Cammygames
	
	Description:
	Used in the vehicle Container menu, takes the selected item and puts it in the players virtual inventory
	if the player has room.
*/
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if(isNull life_cont_vehicle OR !alive life_cont_vehicle) exitWith {hint "The Container either doesn't exist or is destroyed."};
if(!alive player) exitwith {closeDialog 0;};

if((lbCurSel 3502) == -1) exitWith {hint "You need to select an item!";};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
if(!([_num] call fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};

_index = [_ctrl,((life_cont_vehicle getVariable "Container") select 0)] call fnc_index;
_data = (life_cont_vehicle getVariable "Container") select 0;
_old = life_cont_vehicle getVariable "Container";
if(_index == -1) exitWith {};
_value = _data select _index select 1;
if(_num > _value) exitWith {hint "The Container doesn't have that many of that item."};
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Your inventory is full."};
_weight = ([_ctrl] call life_fnc_itemWeight) * _num;
if(_ctrl == "money") then
{
	if(_num == _value) then
	{
		_data set[_index,-1];
		_data = _data - [-1];
	}
		else
	{
		_data set[_index,[_ctrl,(_value - _num)]];
	};
	
	life_cash = life_cash + _num;
	life_cont_vehicle setVariable["Container",[_data,(_old select 1) - _weight],true];
	[life_cont_vehicle] call life_fnc_contInventory;
}
	else
{
	if([true,_ctrl,_num] call life_fnc_handleInv) then
	{
		if(_num == _value) then
		{
			_data set[_index,-1];
			_data = _data - [-1];
		}
			else
		{
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		life_cont_vehicle setVariable["Container",[_data,(_old select 1) - _weight],true];
		[life_cont_vehicle] call life_fnc_contInventory;
	}
		else
	{
		hint "Couldn't add to your inventory, are you full?";
	};
};