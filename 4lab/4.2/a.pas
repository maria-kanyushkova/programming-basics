PROGRAM SarahRevere(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN {SarahRevere}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := 'Y';

  WHILE Looking = 'Y'
  DO
    BEGIN
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      IF W4 = '#'
      THEN {Конец данных}
        Looking := 'N';
      
      WRITE(W1, W2, W3, W4,', ')
      { Проверка окна для 'land'}
      { Проверка окна для 'sea'}
    END
  {ñîçäàòü ñîîáùåíèå Sarah}
END. {SarahRevere}