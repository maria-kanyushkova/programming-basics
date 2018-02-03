PROGRAM Split(INPUT, OUTPUT);
//DP1B = DP1A + DP2.1
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

  {copy Evens in OUTPUT} 

  WRITELN
END. {Split}
