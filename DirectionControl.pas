unit DirectionControl;

interface

uses
  TypeControl;

const
  _UNKNOWN_DIRECTION_: LongInt = -1;
  LEFT               : LongInt = 0;
  RIGHT              : LongInt = 1;
  UP                 : LongInt = 2;
  DOWN               : LongInt = 3;
  _DIRECTION_COUNT_  : LongInt = 4;

type
  TDirection = LongInt;
  TDirectionArray = TLongIntArray;
  TDirectionArray2D = TLongIntArray2D;
  TDirectionArray3D = TLongIntArray3D;
  TDirectionArray4D = TLongIntArray4D;
  TDirectionArray5D = TLongIntArray5D;

implementation

end.
