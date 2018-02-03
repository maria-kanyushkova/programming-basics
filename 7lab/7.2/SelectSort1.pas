PROGRAM SelectSort(INPUT, OUTPUT);
//DP1A = DP1 + DP1.1 
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  REWRITE(F1);                 {DP1.1} //Copy INPUT in F1 and echo OUTPUT
  WRITE('INPUT DATA: ');
  READ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(F1, Ch);
      WRITE(Ch);
      READ(Ch)
    END;
  WRITELN;
  WRITELN(F1, '#')             {//DP1.1}

 {Sort F1 in the OUTPUT, using strategy Select Sort}
END. {SelectSort}
