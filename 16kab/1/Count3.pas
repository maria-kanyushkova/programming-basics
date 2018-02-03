UNIT Count3;
INTERFACE
CONST
  No = 'F';
  Yes = 'T';
  PROCEDURE Start;
  PROCEDURE Bump;
  PROCEDURE GetValue(VAR V1, V10, V100, Over: CHAR);
IMPLEMENTATION
VAR
  Ones, Tens, Hundreds, Overflow: CHAR;
    
  PROCEDURE Start;
    {���������� ������� � ����}
  BEGIN{Start}
    Ones := '0';
    Tens := '0';
    Hundreds := '0'
    Overflow := No;
  END;{Start}

 
  PROCEDURE Bump;
    {����������� 3-�������� ������� ������������   Ones, Tens, Hundreds
     �� ������� ,���� �� ��������� � ����a���� �� 0 �� 999 }
   
  PROCEDURE NextDigit(VAR Digit: CHAR);
  BEGIN {NextDigit}
    IF Digit = '0' THEN Digit := '1' ELSE
    IF Digit = '1' THEN Digit := '2' ELSE
    IF Digit = '2' THEN Digit := '3' ELSE
    IF Digit = '3' THEN Digit := '4' ELSE
    IF Digit = '4' THEN Digit := '5' ELSE
    IF Digit = '5' THEN Digit := '6' ELSE
    IF Digit = '6' THEN Digit := '7' ELSE
    IF Digit = '7' THEN Digit := '8' ELSE
    IF Digit = '8' THEN Digit := '9' ELSE
    IF Digit = '9' THEN Digit := '0'
  END;{NextDigit}
  
  
  BEGIN {Bump}
    NextDigit(Ones);
    IF  Ones = '0'
    THEN
      BEGIN
        NextDigit(Tens);
        IF Tens = '0'
        THEN
          BEGIN
            NextDigit(Hundreds);
            IF Hundreds = '0'
            THEN
              Overflow := Yes
          END
      END
  END; {Bump}
  
  PROCEDURE GetValue(VAR V1, V10, V100, OverflowOfCounter: CHAR);
  {���������� ���������� ��������}
  BEGIN {GetValue}
    V100 := Hundreds;
    V10 := Tens;
    V1 := Ones;
    OverflowOfCounter := Overflow
  END; {GetValue}

BEGIN {UNIT Count3}
  Start
END. {UNIT Count3}
