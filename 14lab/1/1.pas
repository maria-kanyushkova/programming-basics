PROGRAM SortFile(INPUT, OUTPUT);
CONST
  SwitchOn = '1';
  SwitchOff = '2';

VAR
  F: TEXT;

PROCEDURE CopyFile(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN
  RESET(F1);
  REWRITE(F2);
  WHILE NOT(EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END;
  WRITELN(F2)
END;
     
PROCEDURE Split(VAR F1, F2, F3: TEXT);
{Разбивает F1 на F2, F3}
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  Switch := SwitchOn;
  WHILE NOT (EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      IF (Switch = SwitchOn)
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := SwitchOff
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := SwitchOn
        END
    END;
  WRITELN(F2);
  WRITELN(F3);
  CopyFile(F2, OUTPUT);
  CopyFile(F3, OUTPUT);
END; {Split}


PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR 
  F2, F3: TEXT;
  {Ch: CHAR;
}{PROCEDURE Split(VAR F1, F2, F3: TEXT)
 Разбивает F1 на F2 и F3}
{PROCEDURE Merge(VAR F1, F2, F3: TEXT)
 Сливает F2 и F3 в F1}
BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT (EOLN(F1))
  THEN
    BEGIN
      IF NOT (EOLN(F1))
      THEN {Файл имеет как минимум 2 символа}
        BEGIN
          Split(F1, F2, F3);
          {RecursiveSort(F2);
          RecursiveSort(F3);
          Merge(F1, F2, F3);}
        END
    END
END; {RecursiveSort}

BEGIN {SortFile}
  CopyFile(INPUT, F);
  RecursiveSort(F);
  CopyFile(F, OUTPUT)
END. {SortFile}
