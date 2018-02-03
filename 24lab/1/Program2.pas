PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
  Min = 1;
  Null = 0;
TYPE
  Str = ARRAY [Min .. Len] OF CHAR;
  Chiper = ARRAY [CHAR] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I, StringLength: INTEGER;

PROCEDURE Initialize(VAR Code: Chiper);
BEGIN {Initialize}
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
  Code[' '] := '%'
END; {Initialize}

PROCEDURE Encode(VAR S: Str; StringLength: INTEGER);
VAR
  Index: Min .. Len;
BEGIN {Encode}
  FOR Index := Min TO Len
  DO
    IF Code[S[Index]] = ''
    THEN 
      WRITE(S[Index])
    ELSE
      WRITE(Code[S[Index]]);
  WRITELN
END; {Encode}


BEGIN {Encryption}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      I := Null;
      StringLength := Null;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          INC(StringLength);
          INC(I);
          READ(Msg[I]);
          WRITE(Msg[I])
        END;
      READLN;
      WRITELN;
      Encode(Msg, StringLength)
    END
END. {Encryption}

