#! /bin/sh

TABLENAME="$(basename "$PATH_INFO")"

if ! echo "$TABLENAME" | egrep --quiet --ignore-case '^[0-9a-z_]+$';
then
	echo "Status: 400 Bad Request"
	echo "Content-Type: text/plain"
	echo
	echo "Bad Request: tablename '$TABLENAME' not of form ^[0-9a-z_]+$"
	exit
fi

sql() {
	sqlite3 -header -csv -batch /home/scraperwiki.sqlite "$@"
}

if ! ERROR="$(sql "SELECT * FROM $TABLENAME LIMIT 0" 2>&1)";
then
	echo "Status: 404 Not Found"
	echo "Content-Type: text/plain"
	echo 
	echo "Not Found or other error:"
	printf "%s\n" "$ERROR"
	exit
fi

echo "Status: 200 OK"
echo "Content-Type: text/csv; charset=utf8; header=present"
echo

sql "SELECT * FROM $TABLENAME"
