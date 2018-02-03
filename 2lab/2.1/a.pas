PROGRAM Cope(INPUT, OUTPUT);
{копирует первые 2 символа из INPUT в OUTPUT}
VAR
  Letter: CHAR;
BEGIN
  READ(Letter);
  WRITE(Letter);
  READ(Letter);
  WRITELN(Letter)
END.