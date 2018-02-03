PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  ClassTotal: INTEGER;

  PROCEDURE StudentAverages;
  VAR
    WhichScore: 0 .. NumberOfScores;
    Student: 0 .. ClassSize;
    NextScore: Score;
    Num, TotalScore: INTEGER;

    PROCEDURE PrintSurnameStudent;
    VAR
      Ch: CHAR;
    BEGIN {PrintSurnameStudent}
      READ(INPUT, Ch);
      WHILE (Ch <> ' ')
      DO
        BEGIN
          WRITE(OUTPUT, Ch);
          READ(INPUT, Ch)
        END
    END; {PrintSurnameStudent}

    PROCEDURE CountOfAllRatings;      
    BEGIN {CountOfAllRatings}
      WHILE WhichScore < NumberOfScores
      DO
        BEGIN
          READ(NextScore);
          IF (NextScore >= 1) AND (NextScore <= 5)
          THEN
            BEGIN  
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1
            END
          ELSE
            BEGIN
              WRITELN;
              WRITELN('The data entered is incorrect: The mark should be in the range from 1 to 5');
              WhichScore := NumberOfScores;
              Student := ClassSize
            END
        END;
    END; {PCountOfAllRatings}

    PROCEDURE PrintAverageScoreStudent;
    VAR
      Ave: INTEGER;
    BEGIN {PrintAverageScoreStudent}
      IF (Student < ClassSize)
      THEN
        BEGIN   
          READLN;
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
          IF Ave MOD 10 >= 5
          THEN
            WRITELN(' ', Ave DIV 10 + 1)
          ELSE
            WRITELN(' ', Ave DIV 10);
          ClassTotal := ClassTotal + TotalScore;
          Student := Student + 1
        END
    END; {PrintAverageScoreStudent}

  BEGIN {StudentAverages}
    ClassTotal := 0;
    Student := 0;
    Num := 0;
    WHILE Student < ClassSize
    DO 
      BEGIN
        WhichScore := 0;
        TotalScore := 0;
        Num := Num + 1;
        WRITELN(Num, '.', ' Average score:');
        PrintSurnameStudent;
        CountOfAllRatings;
        PrintAverageScoreStudent        
      END
  END; {StudentAverages}

  PROCEDURE ClassAverage;
  BEGIN {ClassAverage}
    ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
    WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
  END; {ClassAverage}

BEGIN {AverageScore}
  WRITELN('Student averages:');
  StudentAverages;
  WRITELN;
  WRITELN('Class average:');
  ClassAverage;
END.  {AverageScore}
