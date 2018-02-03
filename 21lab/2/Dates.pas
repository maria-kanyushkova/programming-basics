UNIT Dates;
INTERFACE
  TYPE
    Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
    DayNum = 1 .. 31;
    Date   = RECORD
               Mo: Month;
               Day: DayNum
             END;
    FileOfDate = FILE OF Date;
    
  FUNCTION  ReadDate(VAR FIn: TEXT): Date; {Читает дату из текстового файла}
  FUNCTION  Less(VAR D1, D2: Date): BOOLEAN; {TRUE, если дата D1 < даты D2}
  PROCEDURE CopyOut(VAR DateFile: FileOfDate); {Вывод файла с датами в текстовый файл}
  PROCEDURE CopyF(VAR DateFile: FileOfDate; VAR TFile: FileOfDate); {Копирует файл}
  
IMPLEMENTATION
  FUNCTION ReadMonth(VAR FIn: TEXT): Month;{Читает первые 3 символа и присваивает ReadMonth соответсвующий месяц}
  VAR
    Ch1, Ch2, Ch3: CHAR;
  BEGIN {ReadMonth}
    READ(FIn, Ch1, Ch2, Ch3);
    IF (Ch1 = 'J') AND (Ch2 = 'A') AND (Ch3 = 'N') THEN ReadMonth := Jan ELSE
    IF (Ch1 = 'F') AND (Ch2 = 'E') AND (Ch3 = 'B') THEN ReadMonth := Feb ELSE
    IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'R') THEN ReadMonth := Mar ELSE
    IF (Ch1 = 'A') AND (Ch2 = 'P') AND (Ch3 = 'R') THEN ReadMonth := Apr ELSE
    IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'Y') THEN ReadMonth := May ELSE
    IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'N') THEN ReadMonth := Jun ELSE
    IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'L') THEN ReadMonth := Jul ELSE
    IF (Ch1 = 'A') AND (Ch2 = 'U') AND (Ch3 = 'G') THEN ReadMonth := Aug ELSE
    IF (Ch1 = 'S') AND (Ch2 = 'E') AND (Ch3 = 'P') THEN ReadMonth := Sep ELSE
    IF (Ch1 = 'O') AND (Ch2 = 'C') AND (Ch3 = 'T') THEN ReadMonth := Oct ELSE
    IF (Ch1 = 'N') AND (Ch2 = 'O') AND (Ch3 = 'V') THEN ReadMonth := Nov ELSE
    IF (Ch1 = 'D') AND (Ch2 = 'E') AND (Ch3 = 'C') THEN ReadMonth := Dec ELSE
    ReadMonth := NoMonth;
  END; {ReadMonth}

  PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);{пишет в FOut соответсвующий Mo месяц}
  BEGIN {WriteMonth}
    IF Mo = Jan THEN WRITE(FOut, 'JAN') ELSE
    IF Mo = Feb THEN WRITE(FOut, 'FEB') ELSE
    IF Mo = Mar THEN WRITE(FOut, 'MAR') ELSE
    IF Mo = Apr THEN WRITE(FOut, 'APR') ELSE
    IF Mo = May THEN WRITE(FOut, 'MAY') ELSE
    IF Mo = Jun THEN WRITE(FOut, 'JUN') ELSE
    IF Mo = Jul THEN WRITE(FOut, 'JUL') ELSE
    IF Mo = Aug THEN WRITE(FOut, 'AUG') ELSE
    IF Mo = Sep THEN WRITE(FOut, 'SEP') ELSE
    IF Mo = Oct THEN WRITE(FOut, 'OCT') ELSE
    IF Mo = Nov THEN WRITE(FOut, 'NOV') ELSE
    IF Mo = Dec THEN WRITE(FOut, 'DEC') ELSE
    WRITE(FOut, 'NoMonth') 
  END; {WriteMonth}

  FUNCTION ReadDate(VAR FIn: TEXT): Date;
  VAR 
    Result1: Date;
  BEGIN {ReadDate}
    Result1.Mo := ReadMonth(FIn);
    READ(FIn, Result1.Day);
    ReadDate := Result1
  END; {ReadDate}

  PROCEDURE WriteDate(VAR FOut: TEXT; VAR Result: Date);{Вывод даты в текстовый файл}
  BEGIN {WriteDate}
    WriteMonth(FOut, Result.Mo);
    WRITE(FOut, Result.Day:3)
  END; {WriteDate}

  FUNCTION Less(VAR D1, D2: Date): BOOLEAN;
  {Less:= D1 < D2}
  BEGIN {Less}
    Less := (D1.Mo < D2.Mo) OR ((D1.Mo = D2.Mo) AND (D1.Day < D2.Day))
  END; {Less}

  PROCEDURE CopyOut(VAR DateFile: FileOfDate);
  VAR
    VarDate: Date;
  BEGIN {CopyOut}
    WHILE NOT EOF(DateFile)
    DO
      BEGIN
        READ(DateFile, VarDate);
        WriteDate(OUTPUT, VarDate);
        WRITELN
      END
  END; {CopyOut}

PROCEDURE CopyF(VAR DateFile: FileOfDate; VAR TFile: FileOfDate);
VAR
  C: Date;
BEGIN  {CopyF}
  WHILE NOT EOF(DateFile)
  DO 
    BEGIN
      READ(DateFile, C);
      WRITE(TFile, C)
    END; 
END;   {CopyF}

BEGIN {Dates}
END.  {Dates}
