PROGRAM Equation2(INPUT, OUTPUT);
TYPE
  Koef = RECORD
           A, B, C: REAL
         END;
  Roots = RECORD
            X1, X2: REAL;
            Q: REAL
          END;
VAR
  K: Koef;
  R: Roots;
  D: REAL;

FUNCTION ReadKoefs(VAR F: TEXT; VAR Ko: Koef): BOOLEAN;
BEGIN
  READ(F, Ko.A, Ko.B, Ko.C);
  IF Ko.A = 0
  THEN
    ReadKoefs := FALSE
  ELSE
    ReadKoefs := TRUE
END;

PROCEDURE Discriminant(VAR Di: REAL; Ko: Koef);
BEGIN
  Di := (Ko.B * Ko.B) - (4 * Ko.A * Ko.C);
END;

FUNCTION RootsEquation(VAR Ro: Roots; Di: REAL): INTEGER;
BEGIN
  IF Di > 0
  THEN
    BEGIN
      RootsEquation := 2;
      Ro.Q := 2
    END
  ELSE
    IF Di = 0
    THEN    
      BEGIN
        RootsEquation := 1; 
        Ro.Q := 1 
      END
    ELSE  
      BEGIN
        RootsEquation := 0;
        Ro.Q := 0 
      END
END;

PROCEDURE FindingRoots(VAR Ro: Roots; Ko: Koef);
BEGIN
  IF (Ro.Q = 2) OR (Ro.Q = 1)
  THEN
    BEGIN
      Ro.X1 := (-Ko.B + SQRT(D))/(2 * Ko.A);
      Ro.X2 := Ro.X1;
      IF Ro.Q = 2
      THEN
        Ro.X2 := (-Ko.B - SQRT(D))/(2 * Ko.A);
      WRITELN('1 Root & 2 Root = ', Ro.X1:4:2, ' & ', Ro.X2:4:2)
    END
  ELSE
    IF Ro.Q = 0
    THEN
      WRITELN('NO ROOTS.')
END;

BEGIN {Equation2}
  IF ReadKoefs(INPUT, K)
  THEN
    BEGIN
      Discriminant(D, K);
      WRITELN('Equation Roots = ', RootsEquation(R, D));
      FindingRoots(R, K);
      WRITELN
    END
  ELSE
    WRITELN('Equation is not square')
END.  {Equation2}
