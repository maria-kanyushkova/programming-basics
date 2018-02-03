PROGRAM PrintTextWithoutSpaces(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN {PrintTextWithoutSpaces}
  READ(Ch);
  WRITE('Input string without spaces: ');
  WHILE Ch <> '#'
  DO
    BEGIN
      IF Ch <> ' '
      THEN
        WRITE(Ch);
      READ(Ch)
    END;
  WRITELN
END. {PrintTextWithoutSpaces}
