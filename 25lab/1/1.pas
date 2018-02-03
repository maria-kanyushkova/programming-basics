PROGRAM InsertionSort(INPUT, OUTPUT);
{Сортирует символы из INPUT}
CONST
  Max = 16;
  ListEnd = 0;
TYPE
  Interval = 0 .. Max;
  RecArray = ARRAY [1 .. Max] OF 
               RECORD
                 Key: CHAR;
                 Next: Interval
               END;

PROCEDURE Sorting(VAR Arr: RecArray; VAR Index, First: Interval);
VAR
  Prev, Curr: Interval;
  Found: BOOLEAN;
BEGIN {Sorting}
  Prev := ListEnd;
  Curr := First;
  Found := FALSE;
  WHILE (Curr <> ListEnd) AND NOT(Found)
  DO
    IF Arr[Index].Key > Arr[Curr].Key
    THEN
      BEGIN
        Prev := Curr;
        Curr := Arr[Curr].Next
      END
    ELSE
      Found := True;
  Arr[Index].Next := Curr;
  IF Prev = ListEnd  {Первый элемент в списке}
  THEN
    First := Index
  ELSE
    Arr[Prev].Next := Index
END; {Sorting}

PROCEDURE Printing(Arr: RecArray; First: Interval);
VAR
  Counter: Interval; 
BEGIN {Printing}
  Counter := First;
  WHILE Counter <> ListEnd
  DO
    BEGIN
      WRITE(Arr[Counter].Key);  
      Counter := Arr[Counter].Next
    END
END; {Printing}

PROCEDURE Sort(VAR F: TEXT);
VAR
  Arr: RecArray;
  First, Index: Interval;
  Extra: CHAR;
BEGIN {Sort}
  First := ListEnd;
  Index := ListEnd;
  WHILE NOT(EOLN(INPUT))
  DO
    BEGIN
      Index := Index + 1;
      IF Index > Max
      THEN
        BEGIN
          READ(Extra);
          WRITELN('This simbol ', Extra, ' ignoring.');
        END
      ELSE
        BEGIN
          READ(Arr[Index].Key);
          Sorting(Arr, Index, First)
        END
    END; 
    Printing(Arr, First);
    WRITELN
END; {Sort}

BEGIN {InsertionSort}
  Sort(INPUT)
END.  {InsertionSort}
