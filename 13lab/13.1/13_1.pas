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
 
PROCEDURE Comparison2Symbol(VAR F2: TEXT; VAR Ch1, Ch2, Sorted: CHAR); {сравнение}
BEGIN {Comparison2Symbol}
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
END; {Comparison2Symbol}

PROCEDURE OnePassString(VAR Ch1, Sorted: CHAR; VAR F, Temp: TEXT);{один проход строки}
VAR
  Ch2: CHAR;
BEGIN {OnePassString}
  WHILE NOT (EOLN(F))
  DO
    BEGIN
      READ(F, Ch2);
      Comparison2Symbol(Temp, Ch1, Ch2, Sorted)
    END;
  WRITELN(Temp, Ch1)        
END; {OnePassString}

PROCEDURE Sorted(VAR F: TEXT);
VAR
  Sorted, Ch1, Ch2: CHAR;
  Temp: TEXT;
BEGIN {Sorted}
  Sorted := No;
  WHILE Sorted = No
  DO
    BEGIN
      Sorted := Yes;
      RESET(F);
      REWRITE(Temp);
      IF NOT (EOLN(F))
      THEN
        BEGIN
          READ(F, Ch1);
          OnePassString(Ch1, Sorted, F, Temp)
        END;
      CopyString(Temp, F)
    END
END; {Sorted} 

BEGIN {BubbleSort}
  CopyString(INPUT, F); {INPUT в F}
  Sorted(F); {сортировка строки}  
  CopyString(F, OUTPUT) {F в OUTPUT}
END. {BubbleSort}
