PROGRAM Split(INPUT, OUTPUT);
{Копирует в INPUT в OUTPUT, сначала нечётные, а затем чётные элементы}
CONST
  Odd = 'O';
  Even = 'E';

PROCEDURE CopyOut(VAR F: TEXT);
VAR 
  Ch: CHAR;
BEGIN {CopyOut}
  WRITELN(F);
  RESET(F);
  WHILE NOT(EOLN(F))
  DO
    BEGIN
      READ(F, Ch);
      WRITE(OUTPUT, Ch)
    END
END; {CopyOut}

PROCEDURE DivisionOfText(VAR F, Odds, Evens: TEXT);
VAR
  Ch, Next: CHAR;
BEGIN {DivisionOfText}
  Next := Odd;
  WHILE NOT(EOLN(F)) 
  DO
    BEGIN
      READ(F, Ch);
      IF Next = Odd
      THEN
        BEGIN
          WRITE(Odds, Ch);
          Next := Even
        END
      ELSE
        BEGIN
          WRITE(Evens, Ch);
          Next := Odd
        END             
    END 
END; {DivisionOfText}

PROCEDURE CopyOddsEvens(VAR F: TEXT);
VAR
  Odds, Evens: TEXT;
BEGIN
  ASSIGN(Odds, 'Odds.dat');
  ASSIGN(Evens, 'Evens.dat');
  REWRITE(Odds);
  REWRITE(Evens);
  DivisionOfText(F, Odds, Evens);
  CopyOut(Odds);
  CopyOut(Evens);
  WRITELN
END;

  
BEGIN {Split}
  CopyOddsEvens(INPUT);
END. {Split}
