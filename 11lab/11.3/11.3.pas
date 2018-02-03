PROGRAM WithoutLast(INPUT, OUTPUT);
VAR
  Ch1, Ch2: CHAR;
BEGIN {WithoutLast}
  ASSIGN(INPUT, 'INPUT.TXT');
  RESET(INPUT);
  
    WHILE (NOT(EOF)) AND (NOT(EOLN))
    DO
      BEGIN
        WHILE NOT(EOF) 
        DO
          BEGIN
            READ(Ch2);
            IF EOLN
            THEN
              READLN;
            IF (NOT(EOF)) AND (NOT(EOLN))
            THEN
              Ch1 := Ch2
          END;     
        WRITE(Ch1)  
      END
  ELSE
    WRITELN
END. {WithoutLast}
