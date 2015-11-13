unit CarTypeControl;

interface

uses
  TypeControl;

const
  _UNKNOWN_CAR_TYPE_: LongInt = -1;
  BUGGY             : LongInt = 0;
  JEEP              : LongInt = 1;
  _CAR_TYPE_COUNT_  : LongInt = 2;

type
  TCarType = LongInt;
  TCarTypeArray = TLongIntArray;
  TCarTypeArray2D = TLongIntArray2D;
  TCarTypeArray3D = TLongIntArray3D;
  TCarTypeArray4D = TLongIntArray4D;
  TCarTypeArray5D = TLongIntArray5D;

implementation

end.
