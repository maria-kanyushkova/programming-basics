PROGRAM XPrint(INPUT, OUTPUT);
CONST
  Min = 1;
  MaxStringLength = 5;
  Max = 250; 
  PrintChar = '*';

TYPE
  IntSet = SET OF Min .. Max;

VAR
  Ch: CHAR;  


FUNCTION ConvertsCharToSet(VAR Ch:CHAR):IntSet;
BEGIN
  CASE Ch OF
    'A': ConvertsCharToSet := [2, 3, 6, 8, 11, 12, 13, 16, 18, 21, 23];
    'B': ConvertsCharToSet := [1, 2, 6, 8, 11, 12, 12, 13, 16, 18, 21, 22, 23];
    'M': ConvertsCharToSet := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25]
    ELSE
      ConvertsCharToSet := []
  END
END;

PROCEDURE PrintCharsSet(CharsSet: IntSet);
VAR
  Counter, CounterX, CounterY: INTEGER;
BEGIN {PrintCharsSet}
  Counter := Min;
  IF CharsSet <> []
  THEN
    BEGIN
      FOR CounterY := Min TO MaxStringLength
      DO
        BEGIN
          FOR CounterX := Min TO MaxStringLength
          DO
            BEGIN
              IF Counter IN CharsSet
              THEN
                WRITE(PrintChar)
              ELSE
                WRITE(' ');
              INC(Counter)
            END;
          WRITELN
        END
    END
  ELSE
    WRITELN('Symbol ''', Ch, ''' is not supported')
END; {PrintCharsSet}

PROCEDURE ReadSet(VAR F1: TEXT);
VAR
  Ch: CHAR;
  Position: INTEGER;
BEGIN {ReadSet}
  WHILE NOT(EOF(F1))
  DO
    BEGIN
      READ(F1, Ch);
      WHILE NOT(EOLN(F1))
      DO
        BEGIN
        
        END
    END
END; {ReadSet}

BEGIN {XPrint}
  IF NOT(EOLN(INPUT)) AND NOT(EOF(INPUT))
  THEN
    BEGIN
      ReadSet(F1);  {
      READ(Ch);
      PrintCharsSet(ConvertsCharToSet(Ch))   }
    END
  ELSE
    WRITELN   }  
END. {XPrint}
