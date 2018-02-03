PROGRAM InsertSort2 (INPUT, OUTPUT);
TYPE 
  NodePtr = ^Node;
  Node = RECORD
           Next: NodePtr;
           Key: CHAR
         END;

  PROCEDURE PrintValue(VAR FirstPtr, NewPtr: NodePtr);
  BEGIN
    NewPtr := FirstPtr;
    WHILE NewPtr <> NIL
    DO
      BEGIN
        WRITE(NewPtr^.Key);
        NewPtr := NewPtr^.Next
      END;
    WRITELN
  END;

  PROCEDURE InsertSortFile(VAR F1: TEXT);
  VAR
    FirstPtr, NewPtr, Curr, Prev: NodePtr;
    Found: BOOLEAN;
  BEGIN {InsertSortFile}
    FirstPtr := NIL;
    WHILE NOT(EOLN(F1))
    DO
      BEGIN
        NEW(NewPtr);
        READ(F1, NewPtr^.Key);
        {2.1. Поместить NewPtr в надлежащее место}
      END;
    PrintValue(FirstPtr, NewPtr)  
  END; {InsertSortFile}

BEGIN {InsertSort2}
  InsertSortFile(INPUT)
END. {InsertSort2}
