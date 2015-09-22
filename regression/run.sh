#!/bin/sh

STOCK=$1

cat $STOCK.T.csv | awk '{print NR " " $1}' | sort -k1,1nr | cut -d " " -f 2 > re_$STOCK.T.csv
tail -1000 re_$STOCK.T.csv | cut -d "," -f 7 | ./mk_traindata_period_reg.pl 900 14 | ./mk_reindex_reg.pl > reg.tsv
tail -14 re_$STOCK.T.csv | cut -d "," -f 7 | awk '{m=$1"	"m} END{print m}' | sed -e "s/^	//g" | ./mk_reindex_reg.pl > today_data.tsv
python svr.py
