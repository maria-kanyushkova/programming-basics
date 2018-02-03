PROGRAM InsertSort2(INPUT, OUTPUT);
TYPE 
  NodePtr = ^Node;
  Node = RECORD
           Next: NodePtr;
           Key: CHAR
         END; 
VAR
  FirstPtr, NewPtr: NodePtr;

  PROCEDURE FindInsertPosition(VAR Curr, Prev, NewPtr: NodePtr);
  VAR
    IsFound: BOOLEAN;
  BEGIN {FindPositionInsert}
    IsFound := FALSE;
    WHILE (Curr <> NIL) AND NOT(IsFound)
    DO
      IF NewPtr^.Key > Curr^.Key
      THEN
        BEGIN
          Prev := Curr;
          Curr := Curr^.Next
        END
       ELSE
         IsFound := TRUE
  END; {FindPositionInsert}

  PROCEDURE InsertValuesInList(VAR FirstPtr, NewPtr: NodePtr);
  VAR
    Curr, Prev: NodePtr;
  BEGIN {InsertValuesInList}
    Prev := NIL;
    Curr := FirstPtr;
    FindInsertPosition(Curr, Prev, NewPtr);
    NewPtr^.Next := Curr;
    IF Prev = NIL 
    THEN
      FirstPtr := NewPtr
    ELSE
      Prev^.Next := NewPtr
  END; {InsertValuesInList}

  PROCEDURE PrintList(VAR FirstPtr, NewPtr: NodePtr);
  BEGIN {PrintList}
    NewPtr := FirstPtr;
    WHILE NewPtr <> NIL
    DO
      BEGIN
        WRITE(NewPtr^.Key);
        NewPtr := NewPtr^.Next
      END;
    WRITELN
  END; {PrintList}

BEGIN {InsertSort2}
  FirstPtr := NIL;
  WHILE NOT(EOLN(INPUT))
  DO
    BEGIN
      NEW(NewPtr);
      READ(NewPtr^.Key);
      InsertValuesInList(FirstPtr, NewPtr)
    END;
  PrintList(FirstPtr, NewPtr)
END. {InsertSort2}
