PROGRAM Rewers(INPUT, OUTPUT);
VAR
  Ch: CHAR;
  F1, F2: TEXT;
  
BEGIN {Rewers}
  ASSIGN(INPUT, 'INPUT.TXT');
  RESET(INPUT);
            
  IF NOT(EOLN(INPUT))
  THEN
    BEGIN
      REWRITE(F1);
      WHILE NOT(EOLN(INPUT))  {перекидывание из ин в ф1}
      DO
        BEGIN
          READ(INPUT, Ch);
          WRITE(F1, Ch)
        END;
      WHILE NOT(EOLN(F1))
      DO
        BEGIN
          RESET(F1);
          REWRITE(F2);  
          WHILE NOT(EOLN(F1)) 
          DO
            BEGIN
              READ(F1, Ch);
              IF EOLN
              THEN
                WRITE(OUTPUT, Ch)
              ELSE
                WRITE(F2, Ch)
            END;
          RESET(F2);
          REWRITE(F1);
          WHILE NOT(EOLN(F2))
          DO
            BEGIN
              READ(F2, Ch);
              WRITE(F1, Ch)
            END
        END    
    END
  ELSE
    WRITELN
END.  {Rewers}
