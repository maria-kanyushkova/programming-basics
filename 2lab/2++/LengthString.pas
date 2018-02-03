PROGRAM PrintLengthOfString(INPUT, OUTPUT);
VAR Hundred, Dozen, Units, Ch, Flag: CHAR;
BEGIN
 { ASSIGN(INPUT,'INPUT.TXT');
  RESET(INPUT);
  ASSIGN(OUTPUT,'OUTPUT.TXT');
  REWRITE(OUTPUT);}

  Ch := ' ';
  Hundred := '0';
  Dozen := '0';
  Units := '0';
  Flag := 'T';

  WHILE Flag = 'T'
  DO
    BEGIN
      READ(Ch);
      IF Hundred = '9'
      THEN
        IF Dozen = '9'
        THEN
          IF Units = '9'
          THEN
            Flag := 'F';
      IF Ch = '#'
      THEN
        Flag := 'F';
      IF Flag = 'T'
      THEN
        BEGIN
          IF Units = '9'
          THEN
            BEGIN
              Units := '0';
              IF Dozen = '9'
              THEN
                BEGIN
                  Dozen := '0';
                  IF Hundred = '8'
                  THEN
                    Hundred :='9';
                  IF Hundred = '7'
                  THEN
                    Hundred :='8';
                  IF Hundred = '6'
                  THEN
                    Hundred :='7';
                  IF Hundred = '5'
                  THEN
                    Hundred :='6';
                  IF Hundred = '4'
                  THEN
                    Hundred :='5';
                  IF Hundred = '3'
                  THEN
                    Hundred :='4';
                  IF Hundred = '2'
                  THEN
                    Hundred :='3';
                  IF Hundred = '1'
                  THEN
                    Hundred :='2';
                  IF Hundred = '0'
                  THEN
                    Hundred :='1'
                END
              ELSE
                BEGIN
                  IF Dozen = '8'
                  THEN
                    Dozen := '9';
                  IF Dozen = '7'
                  THEN
                    Dozen := '8';
                  IF Dozen = '6'
                  THEN
                    Dozen := '7';
                  IF Dozen = '5'
                  THEN
                    Dozen := '6';
                  IF Dozen = '4'
                  THEN
                    Dozen := '5';
                  IF Dozen = '3'
                  THEN
                    Dozen := '4';
                  IF Dozen = '2'
                  THEN
                    Dozen := '3';
                  IF Dozen = '1'
                  THEN
                    Dozen := '2';
                  IF Dozen = '0'
                  THEN
                    Dozen := '1'
                END
            END
          ELSE
            BEGIN
              IF Units = '8'
              THEN
                Units := '9';
              IF Units = '7'
              THEN
                Units := '8';
              IF Units = '6'
              THEN
                Units := '7';
              IF Units = '5'
              THEN
                Units := '6';
              IF Units = '4'
              THEN
                Units := '5';
              IF Units = '3'
              THEN
                Units := '4';
              IF Units = '2'
              THEN
                Units := '3';
              IF Units = '1'
              THEN
                Units := '2';
              IF Units = '0'
              THEN
                Units := '1'
            END
        END
    END;
  IF Ch = '#'
  THEN
    WRITELN('Number of characters is ',Hundred,Dozen,Units)
  ELSE
    WRITELN('Overflow')
END.