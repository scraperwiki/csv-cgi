CSV CGI
=======


To run the tests install urchin with `npm install -g urchin` or
similar, and run:

```
urchin test
```


CRLF
====

As per RFC 4180, CSVs should contain `\r\n` between records.
`sqlite3 -csv` ordinarily outputs plain newlines,
so `fix-sqlite3.sh` builds a fixed `sqlite3`.
