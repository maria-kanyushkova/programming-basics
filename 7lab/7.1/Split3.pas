PROGRAM Split(INPUT, OUTPUT);
//DP1C = DP1B + DP2.2
VAR
  Ch, Flag: CHAR;
  Odds, Evens: TEXT;
BEGIN {Split}
  REWRITE(Odds);
  REWRITE(Evens);
  Flag := 'O';
  READ(Ch);

  WHILE Ch <> '#'           {DP1.1}  //writing to files: Odds and Evens
  DO
    BEGIN
      IF Flag = 'O'
      THEN
        BEGIN
          WRITE(Odds, Ch);
          Flag := 'E'
        END
      ELSE
        BEGIN
          WRITE(Evens, Ch);
          Flag := 'O'
        END;
      READ(Ch)
    END;
  WRITE(Odds, '#');
  WRITE(Evens, '#');      {//DP1.1}      
  
  RESET(Odds);           {DP2.1}  //copy Odds in OUTPUT
  READ(Odds, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(Ch);
      READ(Odds, Ch)
    END;                 {//DP2.1}

  RESET(Evens);           {DP2.2}  //copy Evens in OUTPUT
  READ(Evens, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(Ch);
      READ(Evens, Ch)
    END;                 {//DP2.2}

  WRITELN
END. {Split}
