PROGRAM BubbleSort(INPUT, OUTPUT);
  { ��������� ������ ������ INPUT � OUTPUT }
VAR
  Sorted: CHAR;
  F1: TEXT;
  
  PROCEDURE CopyString(VAR F1, F2: TEXT);
  VAR
    Ch: CHAR;
  BEGIN {CopyString}
    RESET(F1);
    REWRITE(F2);
    WHILE NOT(EOLN(F1)) AND NOT(EOF(F1))
    DO
      BEGIN
        READ(F1, Ch);
        WRITE(F2, Ch)
      END;
    WRITELN(F2)
  END; {CopyString}
  
BEGIN { BubbleSort }
  CopyString(INPUT, F1);
  Sorted := 'N';
  {���������� F1 }
  {WHILE Sorted = 'N'
  DO
    BEGIN
      {�������� F1 � F2,�������� �����������������
       � ����������� ������ �������� ������� �� �������}
      {�������� F2 � F1}
   { END;   }       
  CopyString(F1, OUTPUT)
END.{BubbleSort}

