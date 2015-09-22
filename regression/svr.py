#!/usr/bin/python
# -*- coding: utf-8 -*-

from sklearn.cross_validation import train_test_split
from sklearn import svm
from sklearn.metrics import mean_squared_error
from math import sqrt
import numpy as np

# データ取り込み
inpdata=np.loadtxt("reg.tsv", delimiter="\t")
today_data=np.loadtxt("today_data.tsv", delimiter="\t")
data=inpdata[:,1:14]
target=inpdata[:,0]
data_train, data_test, label_train, label_test = train_test_split(data, target)

# 学習
obj_svr=svm.SVR()
obj_svr.fit(data_train, label_train)

# テスト
result=obj_svr.predict(data_test)

# 評価（相関と2乗誤差）
cor=np.corrcoef(label_test, result)[0, 1]
rmse=sqrt(mean_squared_error(label_test, result))

print "cor=%f" % (cor)
print "rmse=%f" % (rmse)

# today予測
today_predict=obj_svr.predict(today_data[0:13])
print "today=%f" % (today_predict)

# 株価
base=today_data[14]
yesterday=today_data[0]*base
today=today_predict*base

print "基準=[%0.2f] 昨日=[%0.2f] 本日=[%0.2f]" % (base, yesterday, today)

