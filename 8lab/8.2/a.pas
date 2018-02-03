PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN {BubbleSort}
  ASSIGN(F1, 'F1.TXT');
  ASSIGN(F2, 'F2.TXT');

  REWRITE(F1);          {DP8.2}
  WHILE NOT(EOLN(INPUT))
  DO
    BEGIN
      READ(Ch);
      WRITE(F1, Ch)
    END;
  WRITELN(F1);          {//DP8.2}

  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN

      Sorted := 'Y';           {DP8.1}
      RESET(F1);
      REWRITE(F2);
      IF NOT (EOLN(F1))
      THEN
        BEGIN
          READ(F1, Ch1);
          WHILE NOT (EOLN(F1))
          DO
            BEGIN
              READ(F1, Ch2);

              IF Ch1 <= Ch2       {DP8.1.1}
              THEN
                BEGIN
                  WRITE(F2, Ch1);
                  WRITE(Ch1);   /////
                  Ch1 := Ch2
                END
              ELSE
                BEGIN
                  WRITE(F2, Ch2);
                  WRITE(Ch2);   /////
                  Sorted := 'N'
                END               {//DP8.1.1}

            END;
          WRITELN(Ch1);   ////
          WRITELN(F2, Ch1)     {//DP8.1}
        END;

      RESET(F2);           {DP8.4}
      REWRITE(F1);
      WHILE NOT (EOLN(F1))
      DO
        BEGIN
          READ(F2, Ch);
          WRITE(F1, Ch)
        END;
      WRITELN(F1)          {//DP8.4}

    END;

  RESET(F1);           {DP8.5}
  WHILE NOT (EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(Ch)
    END;
  WRITELN              {//DP8.5}
END. {BubbleSort}