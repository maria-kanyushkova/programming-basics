PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
  MaxAlphabet = 27;
  LatAlbhabet = 26;
  Space = ' ';
  ReplaceSpace = '%';  

TYPE
  Chiper = ARRAY [1 .. MaxAlphabet] OF CHAR;
VAR
  CodeIn, CodeOut: Chiper;

  PROCEDURE Initialize(VAR CodeIn, CodeOut: Chiper);
  VAR
    Ch: CHAR;
    I: INTEGER;
  BEGIN {Initialize}
    Ch := 'A';
    FOR I := 1 TO LatAlbhabet
    DO
      BEGIN
        CodeIn[I] := Ch;
        Ch := SUCC(Ch)
      END;
    CodeIn[27] := Space;

    CodeOut[1] := 'Z';
    CodeOut[2] := 'Y';
    CodeOut[3] := 'X';
    CodeOut[4] := '#';
    CodeOut[5] := 'V';
    CodeOut[6] := 'U';
    CodeOut[7] := 'T';
    CodeOut[8] := 'S';
    CodeOut[9] := 'I';
    CodeOut[10] := 'Q';
    CodeOut[11] := 'P';
    CodeOut[12] := '!';
    CodeOut[13] := 'N';
    CodeOut[14] := 'M';
    CodeOut[15] := '2';
    CodeOut[16] := 'K';
    CodeOut[17] := '$';
    CodeOut[18] := 'D';
    CodeOut[19] := 'H';
    CodeOut[20] := '*';
    CodeOut[21] := 'F';
    CodeOut[22] := 'E';
    CodeOut[23] := 'T';
    CodeOut[24] := 'C';
    CodeOut[25] := 'B';
    CodeOut[26] := 'A';
    CodeOut[27] := ReplaceSpace;
  END; {Initialize}
    
  PROCEDURE Encode(VAR MassageString: Chiper; LengthString: INTEGER);
  VAR
    Index: 1 .. Len;
    Counter: 0 .. MaxAlphabet;
    IsInRange: BOOLEAN;
  BEGIN {Encode}
    FOR Index := 1 TO LengthString
    DO
      BEGIN
        IsInRange := TRUE; 
        Counter := 0;
        WHILE IsInRange
        DO
          BEGIN
            INC(Counter);
            IF MassageString[Index] = CodeIn[Counter] 
            THEN
              BEGIN
                WRITE(CodeOut[Counter]);
                IsInRange := FALSE
              END
          END
      END;
    WRITELN
  END; {Encode}     

  PROCEDURE HandleMassage(VAR F1: TEXT);
  VAR                                                   
    Msg: Chiper;
    I, LengthString: INTEGER;
  BEGIN
    WHILE NOT(EOF(F1))
    DO
      BEGIN
        I := 0;
        LengthString := 0;
        WHILE NOT(EOLN(F1)) AND (I < Len)
        DO
          BEGIN
            INC(LengthString);
            INC(I);
            READ(Msg[I]);
            WRITE(Msg[I])
          END;
        READLN;
        WRITELN;
        Encode(Msg, LengthString)
      END     
  END;


BEGIN {Encryption}
  Initialize(CodeIn, CodeOut);
  HandleMassage(INPUT);
END. {Encryption}

