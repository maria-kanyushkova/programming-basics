PROGRAM Split(INPUT, OUTPUT);
//DP1A = DP1 + DP1.1
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
          WRITE(Ch);  //write Ch (Odds) in OUTPUT  
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
  
  {copy Odds in OUTPUT}
  {copy Evens in OUTPUT}  

  WRITELN
END. {Split}
