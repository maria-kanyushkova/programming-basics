PROGRAM IFSort3(INPUT, OUTPUT);
{Sort 3-line from INPUT to OUTPUT}
//Supports the sequence: abc, acb, bca, bac, cab, cba
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {IFSort3}
  READ(Ch1, Ch2, Ch3);
  WRITELN('Input ', Ch1, Ch2, Ch3);
  WRITE('Sorting data ');
  IF Ch1 < Ch2
  THEN
    IF Ch2 < Ch3
    THEN                           {Ch1 < Ch2 < Ch3}
      WRITELN(Ch1, Ch2, Ch3)
    ELSE
      IF Ch1 < Ch3
      THEN                         {Ch1 < Ch3 <= Ch2}
        WRITELN(Ch1, Ch3, Ch2)
      ELSE                         {Ch3 <= Ch1 < Ch2}
        WRITELN(Ch3, Ch1, Ch2)
  ELSE                                                       IF Ch1 < Ch3
    THEN                           {Ch2 <= Ch1 < Ch3}
      WRITELN(Ch2, Ch1, Ch3)
    ELSE
      IF Ch2 < Ch3
      THEN                         {Ch2 < Ch3 <= Ch1}
        WRITELN(Ch2, Ch3, Ch1)
      ELSE                         {Ch3 <= Ch2 <= Ch1}
        WRITELN(Ch3, Ch2, Ch1)
END. {IFsort3}

