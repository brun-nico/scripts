#!/bin/bash
# Author ftravaglia
# Write the 24/12/2014
# This script is use for simplify the use of the pg_dump command.


usage() {
	echo "This script is use for simplify the use of the pg_dump command."
	echo ""
	echo "Usage of the dump command:"
	echo "-u,  --user : database user"
	echo "-h,  --host : database host"
	echo "-p,  --port : database port"
	echo "-db, --database-name : database name"
	echo "-f,  --file : the dump file"
}




while [ "$1" != "" ]; do
    case $1 in
        -u | --user )           shift
                                USER_NAME=$1
                                ;;
        -h | --host )    	shift
				HOST=$1
                                ;;
        -p | --port )           shift
				PORT=$1
                                ;;
        -db | --database-name ) shift
				DB_NAME=$1
                                ;;
        -f | --file )    	shift
				DUMP_NAME=$1
                                ;;
        -help | --help )        usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done


pg_dump --host $HOST --port $PORT --username $USER_NAME --no-password  --format plain --encoding UTF8 --inserts --verbose --file $DUMP_NAME $DB_NAME

