#!/usr/bin/env bash
# wait-for-it.sh

set -e

host="$1"
shift
cmd="$@"

until sqlplus -L -S sys/oracle@//$host:1521/XEPDB1 as sysdba <<< "exit" > /dev/null; do
  >&2 echo "Oracle is unavailable - sleeping"
  sleep 1
done

>&2 echo "Oracle is up - executing command"
exec $cmd