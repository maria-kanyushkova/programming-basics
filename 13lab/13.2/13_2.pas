PROGRAM CompareLengthString(INPUT, OUTPUT);
CONST
  Equally = '0'; {=}
  Less = '1'; {<}
  More = '2'; {>}

VAR
  F1, F2: TEXT;
  Ch: CHAR;

PROCEDURE LetterComparison(VAR Ch1, Ch2, Result: CHAR);
BEGIN {LetterComparison}
  IF (Ch1 < Ch2)
  THEN
    Result := Less
  ELSE
    IF (Ch1 > Ch2)
    THEN
      Result := More
END; {LetterComparison}

PROCEDURE StringComparison(VAR F1, F2: TEXT; VAR Result: CHAR); 
BEGIN {StringComparison}
  IF Result = Equally
  THEN
    IF (NOT(EOLN(F1))) AND (EOLN(F2))
    THEN
      Result := More
    ELSE
      IF (EOLN(F1)) AND (NOT(EOLN(F2)))
      THEN
        Result := Less
END; {StringComparison}


PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
VAR 
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := Equally;
  WHILE (NOT(EOLN(F1))) AND (NOT(EOLN(F2))) AND (Result = Equally)
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      LetterComparison(Ch1, Ch2, Result)
    END;
  StringComparison(F1, F2, Result)
END; {Lexico}

BEGIN {CompareLengthString}
  ASSIGN(F1, 'F1.TXT');
  ASSIGN(F2, 'F2.TXT');
  Lexico(F1, F2, Ch);
  WRITELN(Ch)
  {IF Ch = Equally THEN Ch := '=';  //если не нравится оформление по заданию
  IF Ch = Less THEN Ch := '<';
  IF Ch = More THEN Ch := '>';
  WRITELN('F1 ', Ch, ' F2')  } 
END. {CompareLengthString}

