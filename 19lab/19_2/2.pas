PROGRAM ConversationString(INPUT, OUTPUT); 
CONST
  Error = -1;
  EndString = -2;
  
FUNCTION CharToInt(VAR Ch: CHAR): INTEGER;
BEGIN {CharToInt}
  IF ('0' <= Ch) AND (Ch <= '9')
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
    CharToInt := EndString
END; {CharToInt} 

FUNCTION ReadDigit(VAR F: TEXT): INTEGER;
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  ReadDigit := Error;
  IF NOT(EOLN(F))
  THEN
    BEGIN
      READ(F, Ch);
      ReadDigit := CharToInt(Ch)
    END
  ELSE
    ReadDigit := EndString 
END; {ReadDigit}        

FUNCTION ReadNumber(VAR F: TEXT): INTEGER;
{Преобразует строку цифр из файла, завершающуюся нецифровым символом, 
 в соответствующее целочисленное значение N, и возвращает N}
VAR
  Mult, Digit: INTEGER;
BEGIN {ReadNumber}
  IF NOT(EOLN(F))
  THEN 
    BEGIN
      Mult := 0;
      Digit := ReadDigit(F);
      IF (Digit = Error) OR (Digit = EndString)
      THEN  
        Mult := Error;  
      WHILE (Digit <> Error) AND (Digit <> EndString)
      DO
        BEGIN  
          IF (Mult <= (MAXINT DIV 10)) AND (Digit <> EndString)
          THEN
            BEGIN
              Mult := Mult * 10 + Digit;
              Digit := ReadDigit(F)
            END
          ELSE
            BEGIN
              IF (Digit <> EndString)
              THEN
                Mult := Error;
              Digit := Error
            END          
        END;
      ReadNumber := Mult                       
    END
  ELSE
    ReadNumber := Error
END; {ReadNumber}
  
BEGIN {SumValues}
  WRITELN(ReadNumber(INPUT))
END. {SumValues}
