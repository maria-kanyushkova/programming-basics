PROGRAM InsertSort2(INPUT, OUTPUT);
TYPE 
  NodePtr = ^Node;
  Node = RECORD
           Next: NodePtr;
           Key: CHAR
         END; 
VAR
  FirstPtr, NewPtr: NodePtr;

  PROCEDURE InsertValuesInList(VAR FirstPtr, NewPtr: NodePtr);
  VAR
    Curr, Prev: NodePtr;
  BEGIN {InsertValuesInSheet}
    Prev := NIL;
    Curr := FirstPtr;
    {2.1.1 Найдем значение Prev и Curr, такие что Prev^.Key <= NewPtr^.Key <= Curr^.Key}
    NewPtr^.Next := Curr;
    IF Prev = NIL 
    THEN
      FirstPtr := NewPtr
    ELSE
      Prev^.Next := NewPtr
  END; {InsertValuesInSheet}

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
