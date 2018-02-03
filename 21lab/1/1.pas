PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 100;
TYPE
  SetType = SET OF Min .. Max;
VAR
  Sieve: SetType;
  
  PROCEDURE ScreeningSieve(VAR Sieve: SetType);     //Divider делитель
  VAR                                               //Counter счётчик
    Counter, Divider: INTEGER;
  BEGIN {ScreeningSieve}
    Divider := Min;
    WHILE (Divider * Divider) <= Max
    DO
      BEGIN
        Counter := Divider;   
        {WHILE Counter <= (Max DIV Divider)
        DO
          BEGIN
            IF Counter IN Sieve = true
            THEN
              INC(Counter);
              
          END;} 
        FOR Counter := Divider TO Max DIV Divider
        DO
          Sieve := Sieve - [Counter*Divider];
        INC(Divider) 
      END
  END; {ScreeningSieve}
  
  PROCEDURE PrintSieve(VAR Sieve: SetType);
  VAR
    Counter: INTEGER;
  BEGIN {PrintSieve}
    Counter := Min;
    WHILE Counter <= Max
    DO
      BEGIN
        IF Counter IN Sieve 
        THEN 
          WRITE(Counter :3);
        INC(Counter)
      END;
    WRITELN
  END; {PrintSieve}

BEGIN {Prime}
  Sieve := [Min .. Max];
  ScreeningSieve(Sieve); 
  PrintSieve(Sieve)
END. {Prime}   
