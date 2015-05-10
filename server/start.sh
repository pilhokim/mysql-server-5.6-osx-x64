cd ${0%/*}

# Modified by Pil Ho Kim, 5 May 2015
# Check mysql.pid to kill existing process. This ensures to lock ibdata1 and keep the single mysql server instance
if [ -e "mysql.pid" ]
then
    mysqlpId=$(head -n 1 "mysql.pid")
    kill -9 $mysqlpId
fi

if [ -e "data/mysql/mysql.sock" ]
then
    rm -r -f data/mysql/mysql.sock
fi

# Run mysql server
./mysqld --defaults-file=my.cnf --tmpdir=$(mktemp -d -t mysql)