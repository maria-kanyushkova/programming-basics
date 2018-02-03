PROGRAM CountReverse(INPUT, OUTPUT);
USES 
  Count3;
    
PROCEDURE MoveWindow(VAR F1: TEXT; VAR W1, W2, W3: CHAR);
BEGIN {MoveWindow}
  W1 := W2;
  W2 := W3;
  READ(F1, W3)
END; {MoveWindow}

PROCEDURE CountingReverses(VAR F1: TEXT);
VAR
  W1, W2, W3: CHAR;
BEGIN {CountingReverses}
  IF NOT(EOLN(F1))
  THEN
    BEGIN
      READ(W2);
      IF NOT(EOLN(F1))
      THEN
        READ(W3);
      Start;
      WHILE NOT(EOLN(F1))
      DO
        BEGIN 
          MoveWindow(F1, W1, W2, W3);
          IF ((W2 < W1) AND (W2 < W3)) OR ((W2 > W1) AND (W2 > W3))
          THEN
            Bump
        END;
    END;
END; {CountingReverses}

PROCEDURE PrintNumberOfRevers;
VAR            
  X1, X10, X100, Overflow: CHAR;
BEGIN {PrintNumberOfRevers}
  GetValue(X1, X10, X100, Overflow);
  IF Overflow <> Count3.No
  THEN
    BEGIN
      WRITELN('Количество реверсов: ', X100, X10, X1)
    END
  ELSE
    WRITELN('Слишком большое количество реверсов')
END; {PrintNumberOfRevers}
  
BEGIN {CountReverse}
  CountingReverses(INPUT);   
  PrintNumberOfRevers
END.{CountReverse}

