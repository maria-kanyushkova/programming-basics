PROGRAM SortMonth(INPUT, OUTPUT);
USES
  Date1;
VAR
  Mo1, Mo2: Month;
BEGIN {SortMonth}
  ReadMonth(INPUT, Mo1);
  ReadMonth(INPUT, Mo2);
  IF (Mo1 = NoMonth) OR (Mo2 = NoMonth)
  THEN 
    WRITELN('¬ходные данные введены некорректно')
  ELSE        
    IF Mo1 = Mo2
    THEN
      BEGIN
        WRITE('оба мес€ца '); 
        WriteMonth(OUTPUT, Mo1);
        WRITELN
      END
    ELSE
      BEGIN
        WriteMonth(OUTPUT, Mo1);
        IF Mo1 > Mo2
        THEN
          WRITE(' следует за ')
        ELSE
          WRITE(' предшествует '); 
        WriteMonth(OUTPUT, Mo2)
      END; 
  WRITELN
END. {SortMonth}
