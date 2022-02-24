PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  DOS;
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  QueryString, Value: STRING;
BEGIN {GetQueryStringParameter}
  QueryString := GetEnv('QUERY_STRING');
  Value := '';
  WHILE QueryString <> ''
  DO
    BEGIN
      IF Copy(QueryString, 1, Pos('=', QueryString) - 1) = Key
      THEN
        BEGIN
          IF Pos('&', QueryString) = 0
          THEN
            Value := Copy(QueryString, Pos('=', QueryString) + 1, Length(QueryString) - Pos('=', QueryString) - 1)
          ELSE
            Value := Copy(QueryString, Pos('=', QueryString) + 1, Pos('&', QueryString) - Pos('=', QueryString) - 1)
        END;
      IF Pos('&', QueryString) = 0
      THEN
        Delete(QueryString, 1 , Length(QueryString))
      ELSE
        Delete(QueryString, 1, Pos('&', QueryString))
    END;
  GetQueryStringParameter := Value
END; {GetQueryStringParameter}
BEGIN {WorkWithQueryString}
WRITELN('Content-Type: text/plain');
WRITELN;
WRITELN('First Name: ', GetQueryStringParameter('first_name'));
WRITELN('Second Name: ', GetQueryStringParameter('last_name'));
WRITELN('Age: ', GetQueryStringParameter('age'))
END. {WorkWithQueryString}