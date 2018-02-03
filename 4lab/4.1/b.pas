PROGRAM PaulRevere(INPUT, OUTPUT);
{Печать соответствующего сообщения ,зависящего от величины
на входе: '...by land' для 1; '...by sea' для 2;
иначе печать ссобщения об ошибке}
VAR
  Lanterns: CHAR;
BEGIN {PaulRevere}
  READ(Lanterns);
  IF Lanterns = 'L'
  THEN
    BEGIN
      READ(Lanterns);
      IF lanterns = 'L'
      THEN
        WRITELN('The British are coming by sea.')
      ELSE
        WRITELN('The British are coming by land.')
    END
  ELSE
    WRITELN('The North Church shows only ''', Lanterns, '''.')
END. {PaulRevere}