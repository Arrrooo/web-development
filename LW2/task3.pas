PROGRAM HelloDear(INPUT, OUTPUT);
USES
  DOS;
VAR
  QueryString: STRING;
BEGIN {HelloDear}
  QueryString := GetEnv('QUERY_STRING');
  WRITELN;
  IF (QueryString = '')
  THEN
    WRITELN('Hello Anonymous!')
  ELSE
    WRITELN('Hello dear, ', QueryString, ' !')
END.{HelloDear}
