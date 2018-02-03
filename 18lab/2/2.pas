PROGRAM SarahRevere(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN;

PROCEDURE MoveWindow;
BEGIN {MoveWindow}
  W1 := W2;
  W2 := W3;
  W3 := W4;
  IF NOT(EOLN(INPUT))
  THEN
    READ(W4)
END; {MoveWindow}

BEGIN {SarahRevere}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Land := False;
  Sea := False;
  Looking := True;
  WHILE Looking AND NOT (Land OR Sea)
  DO
    BEGIN
      MoveWindow;
      Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');
      Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a');
      IF EOLN(INPUT)
      THEN
        Looking := False
    END;
  IF Land 
  THEN 
    WRITELN('The British coming by land') 
  ELSE
    IF Sea 
    THEN 
      WRITELN('The British coming by sea') 
    ELSE
      WRITELN('Sarah didn`t say')
END. {SarahRevere}
        

