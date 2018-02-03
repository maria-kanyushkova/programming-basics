PROGRAM BubbleSort(INPUT, OUTPUT);
CONST
  No = 'N';
  Yes = 'Y';

VAR
  F: TEXT;

PROCEDURE CopyString(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyString}
  RESET(F1);
  REWRITE(F2);
  WHILE NOT(EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END;
  WRITELN(F2)
END; {CopyString}
 
PROCEDURE WriteTheLargestSymbol(VAR F2: TEXT; VAR Ch1, Ch2, Sorted: CHAR); {сравнение}
BEGIN {WriteTheLargestSymbol}
  IF Ch1 <= Ch2     
  THEN
    BEGIN
      WRITE(F2, Ch1);
      Ch1 := Ch2
    END
  ELSE
    BEGIN
      WRITE(F2, Ch2);
      Sorted := No
    END
END; {WriteTheLargestSymbol}

PROCEDURE ChangeSimbolsInString(VAR Ch1, Sorted: CHAR; VAR F: TEXT);
VAR
  Ch2: CHAR;
  Temp: TEXT;
BEGIN {ChangeSimbolsInString}
  REWRITE(Temp);
  WHILE NOT(EOLN(F))
  DO
    BEGIN
      READ(F, Ch2);
      WriteTheLargestSymbol(Temp, Ch1, Ch2, Sorted)
    END;
  WRITELN(Temp, Ch1);
  CopyString(Temp, F)     
END; {ChangeSimbolsInString}

PROCEDURE Sort(VAR F: TEXT);
VAR
  Sorted, Ch1, Ch2: CHAR;
BEGIN {Sort}
  Sorted := No;
  WHILE Sorted = No
  DO
    BEGIN
      Sorted := Yes;
      RESET(F);
      IF NOT(EOLN(F))
      THEN
        BEGIN
          READ(F, Ch1);
          ChangeSimbolsInString(Ch1, Sorted, F) 
        END
    END
END; {Sort} 

BEGIN {BubbleSort}
  CopyString(INPUT, F); {INPUT в F}
  Sort(F); {сортировка строки}  
  CopyString(F, OUTPUT) {F в OUTPUT}
END. {BubbleSort}
