PROGRAM XPrint(INPUT, OUTPUT);
CONST
  Min = 1;
  MaxStringLength = 5;
  Max = 25; 

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

PROCEDURE PrintCharsSet(CharsSet: IntSet; VAR Ch: CHAR);
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
                WRITE(Ch)
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

BEGIN {XPrint}
  IF NOT(EOLN(INPUT)) AND NOT(EOF(INPUT))
  THEN
    BEGIN
      READ(Ch);
      PrintCharsSet(ConvertsCharToSet(Ch), Ch)
    END
  ELSE
    WRITELN     
END. {XPrint}
