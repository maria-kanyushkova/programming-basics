PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN {BubbleSort}
 { ASSIGN(F1, 'F1.TXT');
  ASSIGN(F2, 'F2.TXT');}
 
  REWRITE(F1);          {DP8.2}
  WHILE NOT(EOLN(INPUT))
  DO
    BEGIN
      READ(Ch);
      WRITE(F1, Ch)
    END;
  WRITELN(F1);          {//DP8.2}
 
  Sorted := 'N';
  {WHILE Sorted = 'N'
  DO
    BEGIN
      {DP8.1}
      {DP8.4}
   { END;}
 
  RESET(F1);           {DP8.5}
  WHILE NOT (EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(Ch)
    END;
  WRITELN              {//DP8.5}
END. {BubbleSort}
