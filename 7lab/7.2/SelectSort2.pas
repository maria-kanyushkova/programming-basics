PROGRAM SelectSort(INPUT, OUTPUT);
//DP1B = DP1A + DP1.2 
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  REWRITE(F1);                 {DP1.1} //Copy INPUT in F1 and echo OUTPUT
  WRITE('INPUT DATA: ');
  READ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(F1, Ch);
      WRITE(Ch);
      READ(Ch)
    END;
  WRITELN;
  WRITELN(F1, '#');             {//DP1.1}
  
  WRITE('SORTED DATA: ');  
  RESET(F1);  
  READ(F1, Ch);  
  WHILE Ch <> '#'  
  DO { Ch <> �#� � Ch1 � ������ ������ F1}    
    BEGIN      
      {�������� ����������� �� F1 b �������� ������� F1 � F2}     
      WRITE(Min, '*');  //���������� �������� ����� ���������� ����������� ��������    
      {�������� F2 � F1}      
      // RESET(F1);      
      READ(F1, Ch)    
    END;  
  WRITELN 
END. {SelectSort}
