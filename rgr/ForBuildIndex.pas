UNIT ForBuildIndex;
//
INTERFACE
CONST
  Letters = ['A' .. 'Z', 'a' .. 'z', 'А' .. 'п', 'р' .. 'я'];
  max = 30;
TYPE
  LittleString = STRING[31];
  Keys = RECORD
           S: LittleString;
           I: INTEGER
         END;
  Pointers = ^Node;
  Node = RECORD
           Key: Keys;
           Next: Pointers
         END;
PROCEDURE ReadWord(VAR InpF: TEXT; VAR Strg: LittleString; VAR Overfloww: BOOLEAN);
PROCEDURE SearchAndInsert(VAR Strg: LittleString; VAR Overfloww, Firstt: BOOLEAN);
PROCEDURE PrintWords(VAR OutpF: TEXT; Overfloww: BOOLEAN);
//
IMPLEMENTATION
VAR
  FirstPtrr, NewPtrr: Pointers;

PROCEDURE ReadWord(VAR InpF: TEXT; VAR Strg: LittleString; VAR Overfloww: BOOLEAN);
VAR
  Ch: CHAR;
BEGIN
  READ(InpF, Ch);
  WHILE (Overfloww = FALSE) AND (Ch IN Letters)
  DO
    BEGIN
      Strg := Strg + Ch;
      READ(InpF, Ch);
      IF (LENGTH(Strg) > max)
      THEN
        Overfloww := TRUE
    END;
END;

PROCEDURE Inserting(Equall: BOOLEAN; VAR NewPtrr, Currr, Prevv, FirstPtrr: Pointers; VAR Strg: LittleString);
BEGIN
  IF Equall = FALSE
  THEN
    BEGIN
      NEW(NewPtrr);
      NewPtrr^.Key.I := 1;
      NewPtrr^.Key.S := Strg;
      NewPtrr^.Next := Currr;
      IF Prevv = NIL 
      THEN
        FirstPtrr := NewPtrr
      ELSE
        Prevv^.Next := NewPtrr
    END
END;

PROCEDURE SearchAndInsert(VAR Strg: LittleString; VAR Overfloww, Firstt: BOOLEAN);
VAR
  Foundd, Equall: BOOLEAN;
  Prevv, Currr, FirstPtrrr, NewPtrrr: Pointers;
BEGIN
  IF (Strg <> '') AND (Overfloww = FALSE)
  THEN
    BEGIN
      IF Firstt = FALSE
      THEN
        BEGIN
          FirstPtrrr := NIL;
          Firstt := TRUE
        END;
      Prevv := NIL;
      Currr := FirstPtrr;
      Foundd := FALSE;
      Equall := FALSE;
      WHILE (Currr <> NIL) AND NOT Foundd
      DO
        IF Strg > Currr^.Key.S
        THEN
          BEGIN
            Prevv := Currr;
            Currr := Currr^.Next
          END
        ELSE
          IF Strg = Currr^.Key.S
          THEN
            BEGIN
              INC(Currr^.Key.I);
              Equall := TRUE;
              Foundd := TRUE
            END
          ELSE
            Foundd := TRUE;
      Inserting(Equall, NewPtrrr, Currr, Prevv, FirstPtrrr, Strg);
    END;
  FirstPtrr := FirstPtrrr;
  NewPtrr := NewPtrrr;
END;

PROCEDURE PrintWords(VAR OutpF: TEXT; Overfloww: BOOLEAN);
BEGIN
  IF Overfloww = FALSE
  THEN
    BEGIN
      NewPtrr := FirstPtrr;
      WHILE NewPtrr <> NIL
      DO
        BEGIN
          WRITELN(OutpF, NewPtrr^.Key.S, ' - ', NewPtrr^.Key.I);
          NewPtrr := NewPtrr^.Next
        END
    END
  ELSE
    IF (Overfloww = TRUE)
    THEN
      WRITELN(OutpF, 'ERROR. Word has more 30 chars.');
END;

BEGIN {ForBuildIndex}
  // здесь можно инициализировать все переменные для модуля.
END.  {ForBuildIndex}
