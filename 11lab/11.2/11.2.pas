PROGRAM Last(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN {Last}
  ASSIGN(INPUT, 'INPUT.TXT');
  RESET(INPUT);
  IF (NOT(EOF)) AND (NOT(EOLN))
  THEN
    WHILE (NOT(EOF)) AND (NOT(EOLN))
    DO
      BEGIN
        WHILE NOT(EOLN) 
        DO
          READ(Ch);
        IF EOLN
        THEN
          READLN;
        IF EOF
        THEN
          WRITE(Ch)
      END
  ELSE
    WRITELN
END. {Last}
