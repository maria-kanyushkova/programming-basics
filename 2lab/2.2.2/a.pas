PROGRAM WhatLetter(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  READ(Ch);
  WRITELN(Ch);
  IF '0' <= Ch
  THEN
    IF Ch <= '9'
    THEN
      WRITELN('YES')
    ELSE
      WRITELN('NO')
  ELSE
    WRITELN('NO')
END.