PROGRAM HelloDear(INPUT, OUTPUT);
USES
  DOS;
VAR
  QueryString: STRING;
  Number: INTEGER;
BEGIN {HelloDear}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  QueryString := GetEnv('QUERY_STRING');
  WRITELN;
  IF ((Copy(QueryString, 0, 5)) = 'name=')
  THEN
    BEGIN
      WRITE('Hello dear, ');
      Number := Pos('&', QueryString);
      IF (Number = 0)
      THEN
        WRITELN(Copy(QueryString, 6, Length(QueryString)), '!')
      ELSE
        WRITELN(Copy(QueryString, 6, Number - 6), '!')
    END
  ELSE
    WRITELN('Hello Anonymous!')
END.{HelloDear}
