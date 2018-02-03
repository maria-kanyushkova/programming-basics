PROGRAM SumValues(INPUT, OUTPUT);
  
FUNCTION CharToInt(VAR Ch: CHAR): INTEGER;
BEGIN {CharToInt}
  IF (Ch >= '0') AND (Ch <= '9')
  THEN
    BEGIN
      IF Ch = '0' THEN CharToInt := 0 ELSE
      IF Ch = '1' THEN CharToInt := 1 ELSE
      IF Ch = '2' THEN CharToInt := 2 ELSE
      IF Ch = '3' THEN CharToInt := 3 ELSE
      IF Ch = '4' THEN CharToInt := 4 ELSE
      IF Ch = '5' THEN CharToInt := 5 ELSE
      IF Ch = '6' THEN CharToInt := 6 ELSE
      IF Ch = '7' THEN CharToInt := 7 ELSE
      IF Ch = '8' THEN CharToInt := 8 ELSE
      IF Ch = '9' THEN CharToInt := 9
    END
  ELSE
    CharToInt := -1
END; {CharToInt} 

FUNCTION ReadDigit(VAR F: TEXT): INTEGER;
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  IF (NOT(EOLN(F))) AND (NOT(EOF(F)))
  THEN
    BEGIN
      READ(F, Ch);
      ReadDigit := CharToInt(Ch)
    END
  ELSE
    ReadDigit := -1
END; {ReadDigit}        
  
FUNCTION SumChar(VAR F: TEXT): INTEGER;
VAR
  Ch: CHAR;
  Sum: INTEGER;
BEGIN {SumChar}
  Sum := 0;
  IF (NOT(EOLN(F))) AND (NOT(EOF(F)))
  THEN
    BEGIN
      WHILE (NOT(EOLN(F))) AND (NOT(EOF(F)))
      DO
        Sum := Sum + ReadDigit(F);
      SumChar := Sum
    END
  ELSE
    SumChar := 0 
END; {SumChar}

BEGIN {SumValues}
  WRITELN(SumChar(INPUT))
END. {SumValues}
