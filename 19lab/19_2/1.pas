PROGRAM ConversationString(INPUT, OUTPUT); 
  
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

FUNCTION ReadNumber(VAR F: TEXT): INTEGER;
{Преобразует строку цифр из файла, завершающуюся нецифровым символом, 
 в соответствующее целочисленное значение N, и возвращает N}
VAR
  Ch: CHAR;
  Mult, Digit: INTEGER;
BEGIN {ReadNumber}
  Mult := 0;
  Digit := ReadDigit(F);
  WHILE (NOT(EOLN(F))) AND (NOT(EOF(F))) AND (Digit <> -1)
  DO
    BEGIN
      IF (Digit <> -1) AND ((Mult * 10) <= MAXINT)
      THEN
        Mult := Mult * 10 + Digit;
      Digit := ReadDigit(F)
    END;
  IF Digit = -1
  THEN
    ReadNumber := Mult
END; {ReadNumber}
  
BEGIN {SumValues}
  WRITELN(ReadNumber(INPUT))
END. {SumValues}
