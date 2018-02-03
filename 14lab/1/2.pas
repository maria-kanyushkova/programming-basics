PROGRAM SortFile(INPUT, OUTPUT);
CONST
  SwitchOn = '1';
  SwitchOff = '2';
  No = 'N';
  Yes = 'Y';

VAR
  F: TEXT;
  Ch: CHAR;

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

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR 
  F2, F3: TEXT;
  
  PROCEDURE Split(VAR F1, F2, F3: TEXT);
  VAR 
    Ch, Switch: CHAR;
  BEGIN {Split}
    RESET(F1);
    REWRITE(F2);
    REWRITE(F3);
    Switch := SwitchOn;
    WHILE NOT(EOLN(F1))
    DO
      BEGIN
        READ(F1, Ch);
        IF Switch = SwitchOn
        THEN
          BEGIN
            WRITE(F2, Ch);
            Switch := SwitchOff;
          END
        ELSE
          BEGIN
            WRITE(F3, Ch); 
            Switch := SwitchOn;
          END
      END;        
    WRITELN(F2);
    WRITELN(F3)
  END; {Split}

  PROCEDURE Merge(VAR F1, F2, F3: TEXT);
  VAR 
    Ch2, Ch3, Sorted : CHAR;
  BEGIN {Merge}
    RESET(F2);
    RESET(F3);
    REWRITE(F1);
    {connection file}
    IF NOT(EOLN(F2)) OR NOT(EOLN(F3))
    THEN
      IF NOT(EOLN(F2))
      THEN
        CopyFile(F2, F1)
      ELSE
        CopyFile(F3, F1)
    ELSE
      WRITELN(F1)
  END; {Merge}   

BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT(EOLN(F1))
  THEN
    BEGIN
      READ(F1, Ch);
      IF NOT(EOLN(F1))
      THEN 
        BEGIN
          Split(F1, F2, F3);
          RecursiveSort(F2);
          RecursiveSort(F3);
          Merge(F1, F2, F3)
        END    
    END
END; {RecursiveSort}

BEGIN {SortFile}
  CopyFile(INPUT, F);
  RecursiveSort(F);
  CopyFile(F, OUTPUT)
END. {SortFile}
