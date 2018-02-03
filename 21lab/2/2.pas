PROGRAM SortDate(INPUT, OUTPUT);
USES Dates;
{ ��������� ���� �� �������� ����� FI.TXT }
VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;

BEGIN {SortDate}
  ASSIGN(DateFile, 'DF.DAT');
  ASSIGN(TFile, 'TF.DAT');
  ASSIGN(FInput, 'FI.TXT');
  REWRITE(DateFile);
  RESET(FInput);
  WRITELN('Dates in File:');
  VarDate := ReadDate(FInput);
  READLN(FInput);
  WRITE(DateFile, VarDate);
  WHILE NOT EOF(FInput)
  DO
    BEGIN {��������� ����� ���� � DateFile � ��������������� �����}
      D := ReadDate(FInput);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN
          {�������� �������� �������, ��� D �� DateFile � TFile}
          REWRITE(TFile);
          RESET(DateFile);
          Copying := TRUE;
          WHILE NOT EOF(DateFile) AND Copying
          DO
            BEGIN
              READ(DateFile, VarDate);
              IF Less(VarDate, D)
              THEN
                WRITE(TFile, VarDate)
              ELSE
                Copying := FALSE
            END;         
          {�������� D � TFile}
          WRITE(TFile, D); 
          {�������� ������� DateFile � TFile}
          IF NOT Copying
          THEN
            WRITE(TFile, VarDate);
          CopyF(DateFile, TFile);
          {�������� TFile � DateFile}
          REWRITE(DateFile);
          RESET(TFile);
          CopyF(TFile, DateFile)
        END
    END;
  {�������� DateFile � OUTPUT}
  RESET(DateFile); 
  CopyOut(DateFile)
END. {SortDate}
