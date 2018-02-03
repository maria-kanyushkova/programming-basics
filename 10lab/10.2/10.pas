PROGRAM FormattingCode(INPUT, OUTPUT);
VAR
  W1, W2: CHAR;

PROCEDURE Move;
BEGIN {Move}
  W1 := W2;
  READ(W2)
END; {Move}

PROCEDURE Comment;
BEGIN {Comment}
  IF W2 = '{'
    THEN
      BEGIN
        WRITE(W2);
        WHILE W2 <> '}'
        DO
          BEGIN
            IF W2 = ','
            THEN
              WRITE(W2, ' ');
            IF W2 <> ' ' 
            THEN
              WRITE(W2);
            Move
          END;
        WRITELN('}');
        Move
      END
  ELSE
    WRITELN
END; {Comment}

PROCEDURE Action;
BEGIN {Action}
  Move;
  IF W2 = 'L' 
  THEN
    BEGIN
      WRITE('LN');
      Move;
      Move
    END;
  IF W2 = '('
  THEN
    BEGIN
      WHILE W2 <> ')'
      DO
        BEGIN
          IF W2 = ','
          THEN
            WRITE(', ');
          IF (W2 <> ' ') AND (W2 <> ',') 
          THEN
            WRITE(W2);
          Move
        END;
      WRITE(')');
      Move
    END;
  IF W2 = ';' 
  THEN
    BEGIN
      WRITE(W2, ' ');
      Comment;
      WRITE('  ');
      Move
    END
  ELSE
    WRITELN
END; {Action}


BEGIN {FormattingCode}
  Assign(input, 'input.txt');
  Reset(input);
  Assign(output, 'output.txt');
  Rewrite(output);
  
  W1 := ' ';
  W2 := ' ';
  
  WHILE NOT(EOF) 
  DO
    BEGIN
      Move;
      IF (W1 = 'N') AND (W2 = ' ')
      THEN
        BEGIN
          WRITELN;
          WRITE('  ');
          Move
        END;
      IF (W1 = 'T') AND (W2 = 'E')
      THEN
        BEGIN
          WRITE('E');
          Action
        END;
      IF (W1 = 'A') AND (W2 = 'D')
      THEN
        BEGIN
          WRITE('D');
          Action
        END
      ELSE 
        BEGIN
          IF (W1 = W2) AND ((W1 = ' ') OR (W2 = ';'))
          THEN
            Move
          ELSE 
            BEGIN
              IF (W1 = ':') AND (W2 = '=')
              THEN
                WRITE(':= ')
              ELSE
                IF (W1 <> ' ') AND (W2 = ' ')
                THEN
                  WRITE(' ')
                ELSE
                  IF W2 = ';'
                  THEN
                    Comment
                  ELSE  
                    WRITE(W2)
            END
        END
    END;
  
  Close(input);
  Close(output);
END. {FormattingCode}
