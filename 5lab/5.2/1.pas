PROGRAM MinSort3(INPUT, OUTPUT);
{Sort 3-line from INPUT to OUTPUT}
//Search min ch
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {MinSort3}
  READ(Ch1, Ch2, Ch3);
  WRITELN('Input ', Ch1, Ch2, Ch3);
  WRITE('Sorting date ');
  IF Ch1 < Ch2
  THEN {Print min(Ch1, Ch3) or Ch1 == Ch3}
    IF Ch1 < Ch3
    THEN
      BEGIN
        WRITE(Ch1);
        Ch1 := Ch3
      END
    ELSE
      WRITE(Ch3)
  ELSE {Print min(Ch2, Ch3) or Ch2 == Ch3}
    IF Ch2 < Ch3
    THEN
      BEGIN
        WRITE(Ch2);
        Ch2 := Ch3
      END
    ELSE
      WRITE(Ch3);
  {  Ch1, Ch2 в OUTPUT };
  WRITELN
END.{Minsort3}