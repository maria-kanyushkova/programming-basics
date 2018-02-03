PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  ClassTotal: INTEGER;

  PROCEDURE PrintAverageScoreStudent(VAR TotalScore: INTEGER);
  VAR
    Ave: INTEGER;
  BEGIN {PrintAverageScoreStudent}
    Ave := TotalScore DIV NumberOfScores;
    IF Ave MOD 10 >= 5
    THEN
      WRITELN('Average score:', Ave DIV 10 + 1)
    ELSE
      WRITELN('Average score:', Ave DIV 10);
  END; {PrintAverageScoreStudent}

  PROCEDURE StudentAverages;
  VAR
    WhichScore: 1 .. NumberOfScores;
    Student: 1 .. ClassSize;
    NextScore: Score;
    TotalScore: INTEGER;
  BEGIN {StudentAverages}
    ClassTotal := 0;
    Student := 1;
    WHILE Student <= ClassSize
    DO 
      BEGIN
        TotalScore := 0;
        WhichScore := 1;
        WHILE WhichScore <= NumberOfScores
        DO
          BEGIN
            READ(NextScore);
            TotalScore := TotalScore + NextScore;
            INC(WhichScore)
          END;
        READLN;
        TotalScore := TotalScore * 10;
        PrintAverageScoreStudent(TotalScore);
        ClassTotal := ClassTotal + TotalScore;
        INC(Student)
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
  ClassAverage
END.  {AverageScore}
