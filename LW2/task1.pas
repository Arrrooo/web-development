PROGRAM ZnacheniaOkruzhenia(INPUT, OUTPUT);
USES
  DOS;
BEGIN {ZnacheniaOkruzhenia}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITELN(GetEnv('REQUEST_METHOD'));
  WRITELN(GetEnv('QUERY_STRING'));
  WRITELN(GetEnv('CONTENT_LENGTH'));
  WRITELN(GetEnv('HTTP_USER_AGENT'));
  WRITELN(GetEnv('HTTP_HOST'))
END. {ZnacheniaOkruzhenia}
