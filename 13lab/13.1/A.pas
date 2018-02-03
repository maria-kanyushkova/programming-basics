PROGRAM BubbleSort(INPUT, OUTPUT);
  { Сортируем первую строку INPUT в OUTPUT }
VAR
  Sorted: CHAR;
  F1: TEXT;
  
  PROCEDURE CopyString(VAR F1, F2: TEXT);
  VAR
    Ch: CHAR;
  BEGIN {CopyString}
    RESET(F1);
    REWRITE(F2);
    WHILE NOT(EOLN(F1)) AND NOT(EOF(F1))
    DO
      BEGIN
        READ(F1, Ch);
        WRITE(F2, Ch)
      END;
    WRITELN(F2)
  END; {CopyString}
  
BEGIN { BubbleSort }
  CopyString(INPUT, F1);
  Sorted := 'N';
  {Сортировка F1 }
  {WHILE Sorted = 'N'
  DO
    BEGIN
      {Копируем F1 в F2,проверяя отсортированность
       и переставляя первые соседние символы по порядку}
      {Копируем F2 в F1}
   { END;   }       
  CopyString(F1, OUTPUT)
END.{BubbleSort}

