PROGRAM BuildIndex(INPUT, OUTPUT);
USES ForBuildIndex;
VAR
  Overflow, First: BOOLEAN;
  Str: LittleString;
  InF, OutF: TEXT;
BEGIN {BuildIndex}
  ASSIGN(InF, 'C:\fpc\2 stmestre\RGR\with pointer\withUnit\fourthVersion\InF.txt');
  ASSIGN(OutF, 'C:\fpc\2 stmestre\RGR\with pointer\withUnit\fourthVersion\OutF.txt');
  RESET(InF);
  REWRITE(OutF);
  First := FALSE;
  Overflow := FALSE;
  WHILE NOT EOF(InF) AND (Overflow = FALSE)
  DO
    BEGIN
      Str := '';
      ReadWord(InF, Str, Overflow);
      SearchAndInsert(Str, Overflow, First);
    END;
  PrintWords(OutF, Overflow);
  CLOSE(InF);
  CLOSE(OutF)
END.  {BuildIndex}

// подумать на счёт удаления из параметров процедур Overflow и First;
// возможно где-то нужно использовать функцию.
