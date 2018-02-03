PROGRAM TestDate1(INPUT, OUTPUT);
USES
  Date1;
VAR
  Mo1: Month;

BEGIN {TestDate1}
  ReadMonth(INPUT, Mo1);
  WriteMonth(OUTPUT, Mo1)
END. {TestDate1}
