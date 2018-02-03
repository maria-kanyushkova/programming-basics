PROGRAM IsPrime(INPUT, OUTPUT);

  FUNCTION CheckOnPrime: BOOLEAN;
  VAR 
	Number, Counter: INTEGER;
	Prime: BOOLEAN;
  BEGIN {CheckOnPrime}
    READ(Number);
	Prime := TRUE;
	Counter := 2;
	IF Number <= 1
	THEN
	  Prime := FALSE;
	WHILE ((Counter * Counter) <= Number) AND Prime
	DO
	  BEGIN       
	    IF Number MOD Counter = 0
	    THEN
	      Prime := FALSE;
	    INC(Counter)
	  END;
	  CheckOnPrime := Prime
  END; {CheckOnPrime}

BEGIN {IsPrime}
  IF CheckOnPrime
  THEN
    WRITELN('Prime')
  ELSE
    WRITELN('Not prime')
END. {IsPrime}
