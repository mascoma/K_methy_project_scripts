import pandas as pd
import re
import csv
def main():  
    df1 = pd.read_csv('expression_cmp.csv', header = 0)
    df2 = pd.read_csv('motif2.csv', header = 0)
    print(df2)
    df3 = pd.merge(df2, df1,on = 'locus_tag1', how = 'outer')
    print(df3)
    df3.to_csv('motif_expression_cmp.csv')
if __name__ == "__main__": main()     