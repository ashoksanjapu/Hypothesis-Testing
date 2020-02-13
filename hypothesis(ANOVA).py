# -*- coding: utf-8 -*-
"""
Created on Fri Jan  3 10:20:51 2020

@author: User
"""
import pandas as pd
from scipy import stats
from statsmodels.stats import weightstats as stests
df_anova = pd.read_csv("C:\\Users\\User\\Downloads\\Cutlets.csv")
df_anova = df_anova[['UnitA','UnitB']]
grps = pd.unique(df_anova.UnitB.values)
d_data = {grp:df_anova['UnitA'][df_anova.UnitB == grp] for grp in grps}
 
F, p = stats.f_oneway(d_data['ctrl'], d_data['trt1'], d_data['trt2'])
print("p-value for significance is: ", p)
if p<0.05:
    print("reject null hypothesis")
else:
    print("accept null hypothesis")