unit Base32U;

interface

uses
  System.SysUtils, System.Classes;

type
  Base32 = class
  public
    class function Decode(const inString: String): String;
    class function DecodeToBytes(const inString: String): TBytes;
    class function Encode(const inData: TBytes): String; overload;
    class function Encode(const inData: String): String; overload;
  end;

const
  ValidChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';

implementation

{$REGION 'Base32 Decode'}

function Base32Decode(const source: String): String;
var
  UpperSource: String;
  p, i, l, n, j: Integer;
begin
  UpperSource := UpperCase(source);

  l := Length(source);
  n := 0; j := 0;
  Result := '';

  for i := 1 to l do
  begin
    n := n shl 5;

    p := Pos(UpperSource[i], ValidChars);
    if p >= 0 then
      n := n + (p - 1);

    j := j + 5;

    if (j >= 8) then
    begin
      j := j - 8;
      Result := Result + chr((n AND ($FF shl j)) shr j);
    end;
  end;
end;

{$ENDREGION}

{$REGION 'Base32 Encode'}

function Base32Encode(const Data: TBytes): String;
var
  i, Index, BitCount: Integer;
  CurrentByte, NextByte: Byte;
  Buffer: Integer;
begin
  Result := '';
  Index := 0;
  BitCount := 0;
  Buffer := 0;

  for i := 0 to Length(Data) - 1 do
  begin
    Buffer := (Buffer shl 8) or Data[i];
    BitCount := BitCount + 8;

    while BitCount >= 5 do
    begin
      Result := Result + ValidChars[(Buffer shr (BitCount - 5)) and $1F + 1];
      BitCount := BitCount - 5;
    end;
  end;

  if BitCount > 0 then
  begin
    Buffer := Buffer shl (5 - BitCount);
    Result := Result + ValidChars[(Buffer and $1F) + 1];
  end;
end;

{$ENDREGION}

{ Base32 }
class function Base32.DecodeToBytes(const inString: String): TBytes;
var
  Decoded: String;
  I: Integer;
begin
  Decoded := Decode(inString); // Mevcut Decode
  SetLength(Result, Length(Decoded));
  for I := 1 to Length(Decoded) do
    Result[I - 1] := Ord(Decoded[I]); // String ? Byte array
end;

class function Base32.Decode(const inString: String): String;
begin
  Result := Base32Decode(inString);
end;

class function Base32.Encode(const inData: TBytes): String;
begin
  Result := Base32Encode(inData);
end;

class function Base32.Encode(const inData: String): String;
begin
  Result := Base32Encode(BytesOf(inData));
end;

end.

