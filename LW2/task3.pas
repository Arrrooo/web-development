PROGRAM HelloDear(INPUT, OUTPUT);
USES
  DOS;
VAR
  QueryString: STRING;
  Number: INTEGER;
BEGIN {HelloDear}
  QueryString := GetEnv('QUERY_STRING');
  WRITELN;
  IF (QueryString = '')
  THEN
    WRITELN('Hello Anonymous!')
  ELSE
    BEGIN
      WRITE('Hello dear, ');
      Number := Pos('&', QueryString);
      IF (Number = 0)
      THEN
        WRITELN(Copy(QueryString, 6, Length(QueryString)), '!')
      ELSE
        WRITELN(Copy(QueryString, 6, Number - 6), '!')
    END
END.{HelloDear}
