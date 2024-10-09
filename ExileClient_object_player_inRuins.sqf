private ["_bdg"];
_bdg = "";
lineIntersectsSurfaces [getPosWorld _this,getPosWorld _this vectorAdd [0,0,0.1],_this,objNull,true,1,"GEOM","NONE"] select 0 params ["","","","_bdg"];
if((_bdg isKindOf "Building")||(_bdg isKindOf "House"))exitWith{if((str typeOf _bdg find "ruin" > -1)||(str typeOf _bdg find "dam" > -1)||(str typeOf _bdg find "_d_" > -1))then{true;};};
false