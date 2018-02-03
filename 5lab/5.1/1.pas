PROGRAM IFSort3(INPUT, OUTPUT);
{Sort 3-line from INPUT to OUTPUT}
//Supports the sequence: abc
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {IFSort3}
  READ(Ch1, Ch2, Ch3);
  WRITELN('Input ', Ch1, Ch2, Ch3);
  WRITE('Sorting data ');
  IF Ch1 < Ch2     
  THEN       
    IF Ch2 < Ch3       
    THEN {Ch1 < Ch2 < Ch3}      
      WRITELN(Ch1, Ch2, Ch3)       
    ELSE         
      {Ch1 < Ch2, Ch3 <= Ch2: sort Ch1, Ch2, Ch3 â OUTPUT}
  ELSE       
    {Ch2 <= Ch1: sort Ch1, Ch2, Ch3 â OUTPUT}
END. {IFsort3}
