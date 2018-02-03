PROGRAM SortDate(INPUT, OUTPUT);
USES Dates;
{ Сортирует даты из входного файла FI.TXT }
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
    BEGIN {Поместить новую дату в DateFile в соответствующее место}
      D := ReadDate(FInput);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN
          {Копируем элементы меньшие, чем D из DateFile в TFile}
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
          {Копируем D в TFile}
          WRITE(TFile, D); 
          {Копируем остаток DateFile в TFile}
          IF NOT Copying
          THEN
            WRITE(TFile, VarDate);
          CopyF(DateFile, TFile);
          {Копируем TFile в DateFile}
          REWRITE(DateFile);
          RESET(TFile);
          CopyF(TFile, DateFile)
        END
    END;
  {Копируем DateFile в OUTPUT}
  RESET(DateFile); 
  CopyOut(DateFile)
END. {SortDate}
