PROGRAM PaulRevere(INPUT, OUTPUT);
{������ ���������������� ��������� ,���������� �� ��������
�� �����: '...by land' ��� 1; '...by sea' ��� 2;
����� ������ ��������� �� ������}
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