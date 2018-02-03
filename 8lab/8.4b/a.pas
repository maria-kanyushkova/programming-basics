PROGRAM BubbleSortMLB(INPUT, OUTPUT);
  {8.1aС = 8.1aB + DP4.1.1}
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN { BubbleSort }
  REWRITE(F1);      {DP4.2}
  WHILE NOT EOF
  DO
    BEGIN
      READ(Ch);
      WRITE(F1, Ch)
    END;
  WRITELN(F1);      {//DP4.2}
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';                            {DP4.1}
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1, Ch1);
          WHILE NOT EOLN(F1)
          DO { По крайней мере два символа остается для Ch1,Ch2 }
            BEGIN
              READ(F1, Ch2);
              IF Ch1 <= Ch2        {DP4.1.1}
              THEN
                BEGIN
                  WRITE(F2, Ch1);
                  Ch1 := Ch2
                END
              ELSE
                BEGIN
                  WRITE(F2, Ch2);
                  Sorted := 'N'
                END                {//DP4.1.1}
            END;
          WRITELN(F2, Ch1) { Выводим последний символ в F2 }
        END;                                   {//4.1}
      RESET(F2);         {DP4.4}
      REWRITE(F1);
      WHILE NOT EOLN
      DO
        BEGIN
          READ(F2, Ch);
          WRITE(F1, Ch)
        END;
      WRITELN(F1);       {//DP4.4}
    END;
  RESET(F1);           {DP4.5}
  WHILE NOT EOLN
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(Ch)
    END;
  WRITELN              {//DP4.5}
END.{ BubbleSort }