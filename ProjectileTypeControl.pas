unit ProjectileTypeControl;

interface

uses
  TypeControl;

const
  _UNKNOWN_PROJECTILE_TYPE_: LongInt = -1;
  WASHER                   : LongInt = 0;
  TIRE                     : LongInt = 1;
  _PROJECTILE_TYPE_COUNT_  : LongInt = 2;

type
  TProjectileType = LongInt;
  TProjectileTypeArray = TLongIntArray;
  TProjectileTypeArray2D = TLongIntArray2D;
  TProjectileTypeArray3D = TLongIntArray3D;
  TProjectileTypeArray4D = TLongIntArray4D;
  TProjectileTypeArray5D = TLongIntArray5D;

implementation

end.
