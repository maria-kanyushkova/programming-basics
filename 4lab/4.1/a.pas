PROGRAM PaulRevere(INPUT, OUTPUT);
  {������ ���������������� ��������� ,���������� �� ��������
  �� �����: '...by land' ��� 1; '...by sea' ��� 2;
  ����� ������ ��������� �� ������}
VAR
  Lanterns: CHAR;
BEGIN {PaulRevere}
  READ(Lanterns);3
  IF Lanterns >= '1'  
  THEN
    IF Lanterns <= '2'
    THEN
      WRITE('British are coming by ');
  IF Lanterns = '1'
  THEN
    WRITELN('land.')
  ELSE
    IF Lanterns = '2'
    THEN
      WRITELN('sea.')
    ELSE
      WRITELN('The North Church shows only ''', Lanterns, '''.')
END. {PaulRevere}