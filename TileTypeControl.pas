unit TileTypeControl;

interface

uses
  TypeControl;

const
  _UNKNOWN_TILE_TYPE_: LongInt = -1;
  EMPTY              : LongInt = 0;
  VERTICAL           : LongInt = 1;
  HORIZONTAL         : LongInt = 2;
  LEFT_TOP_CORNER    : LongInt = 3;
  RIGHT_TOP_CORNER   : LongInt = 4;
  LEFT_BOTTOM_CORNER : LongInt = 5;
  RIGHT_BOTTOM_CORNER: LongInt = 6;
  LEFT_HEADED_T      : LongInt = 7;
  RIGHT_HEADED_T     : LongInt = 8;
  TOP_HEADED_T       : LongInt = 9;
  BOTTOM_HEADED_T    : LongInt = 10;
  CROSSROADS         : LongInt = 11;
  UNKNOWN            : LongInt = 12;
  _TILE_TYPE_COUNT_  : LongInt = 13;

type
  TTileType = LongInt;
  TTileTypeArray = TLongIntArray;
  TTileTypeArray2D = TLongIntArray2D;
  TTileTypeArray3D = TLongIntArray3D;
  TTileTypeArray4D = TLongIntArray4D;
  TTileTypeArray5D = TLongIntArray5D;

implementation

end.
