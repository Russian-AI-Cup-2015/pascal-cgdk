unit BonusTypeControl;

interface

uses
  TypeControl;

const
  _UNKNOWN_BONUS_TYPE_: LongInt = -1;
  REPAIR_KIT          : LongInt = 0;
  AMMO_CRATE          : LongInt = 1;
  NITRO_BOOST         : LongInt = 2;
  OIL_CANISTER        : LongInt = 3;
  PURE_SCORE          : LongInt = 4;
  _BONUS_TYPE_COUNT_  : LongInt = 5;

type
  TBonusType = LongInt;
  TBonusTypeArray = TLongIntArray;
  TBonusTypeArray2D = TLongIntArray2D;
  TBonusTypeArray3D = TLongIntArray3D;
  TBonusTypeArray4D = TLongIntArray4D;
  TBonusTypeArray5D = TLongIntArray5D;

implementation

end.
