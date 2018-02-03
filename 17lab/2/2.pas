PROGRAM FormatSentence(INPUT, OUTPUT);  

CONST
  CharBegin = 'B';
  CharLetter = 'L'; 
  CharSpace = 'S'; 
  CharPoint = 'P'; 
  CharComma = 'C'; 
  CharError = 'E';
  BeginningOfAlphabet = 'A';
  EndingOfAlphabet = 'z';

VAR
  Ch, Status: CHAR;
  
PROCEDURE Begining;
BEGIN {Begining} 
  IF Status = CharBegin 
  THEN
    IF (Ch >= BeginningOfAlphabet) AND (Ch <= EndingOfAlphabet) 
    THEN
      Status := CharLetter 
    ELSE
      IF Ch <> ' ' 
      THEN 
        Status := CharError
END; {Begining}   

PROCEDURE Letter;
BEGIN {Letter}
  IF Status = CharLetter
  THEN
    IF Ch = ' '
    THEN
      Status := CharSpace 
    ELSE
      IF Ch = ','
      THEN
        BEGIN
          Status := CharComma;
          WRITE(Ch)
        END    
      ELSE
        IF Ch = '.' 
        THEN
          BEGIN
            Status := CharPoint;
            WRITE(Ch)
          END   
        ELSE
          IF NOT(Ch >= BeginningOfAlphabet) AND (Ch <= EndingOfAlphabet)
          THEN 
            Status := CharError  
END; {Word}

PROCEDURE Space;
BEGIN {Space}
  IF Status = CharSpace 
  THEN
    IF (Ch >= BeginningOfAlphabet) AND (Ch <= EndingOfAlphabet)
    THEN
      BEGIN
        Status := CharLetter;
        WRITE(' ')
      END  
    ELSE
      IF Ch = ','
      THEN
        BEGIN
          Status := CharComma;
          WRITE(Ch)
        END    
      ELSE
        IF Ch = '.'
        THEN
          BEGIN
            Status := CharPoint;
            WRITE(Ch)
          END  
        ELSE
          IF Ch <> ' '
          THEN
            Status := CharError
END; {Space}

PROCEDURE Comma;
BEGIN {Comma}
  IF Status = CharComma
  THEN
    BEGIN
      IF (Ch >= BeginningOfAlphabet) AND (Ch <= EndingOfAlphabet) 
      THEN
        BEGIN
          Status := CharLetter;
          WRITE(' ') 
        END
      ELSE
        IF (Ch = ',') OR (Ch = '.') OR (Ch <> ' ')
        THEN
          Status := CharError 
    END          
END; {Comma}

PROCEDURE Point;
BEGIN {Point}
  IF (Status = CharPoint) AND (Ch <> ' ')
  THEN
    Status := CharError 
END; {Point}

BEGIN{FormatSentence}
  Status := CharBegin;
  WHILE NOT(EOLN(INPUT)) AND (Status <> CharError)
  DO
    BEGIN 
      READ(Ch);
      Point;
      Begining;
      Comma;
      Letter;
      Space;
      IF Status = CharLetter
      THEN
        WRITE(Ch);  
      IF Status = CharError
      THEN
        BEGIN
          WRITELN;
          WRITE('Unexpected symbol: ', Ch)
        END         
    END;       
  IF (Status <> CharPoint) AND (Status <> CharError)
  THEN
    BEGIN
      WRITELN;
      WRITE('Unexpected end of file')
    END;      
  WRITELN
END.{FormatSentence}
