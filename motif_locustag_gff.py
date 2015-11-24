#this script is to match the motif locations with the gene locus_tag. 
import pandas as pd
import re
import csv
def main():  
   
    f1 = open('all_orfs_gff1.tsv', 'r')  # K. O. genome locus_tag
    f2 = open('GATGC_locations.csv', 'r')  # motif locations
    output = open('motif_locustag.txt','w')  
    print('motif_num\tlocation\ttype\tlocus_tag\n', file = output, end = '\n')
    locationlist = []
    numberlist = []
    countlist = []
    for line2 in f2:
        tmp2 = re.search('^(\d+)\,(\d+)$', line2)
        num = tmp2.group(1)
        local = tmp2.group(2)
        locationlist.append(local) 
        numberlist.append(num)
    #print(len(locationlist))
    for line1 in f1:
        tmp = re.search('^(\d+)\t(\d+)\t(\w+)\t([\w\d]+)\t([\w\d]+)$', line1)
        start = int(tmp.group(1))
        end = int(tmp.group(2))
        type = tmp.group(3)
        tag = tmp.group(5)
        count2 = 0
        while(count2 < len(locationlist)):
            l = int(locationlist[count2])     
            if l >= start and l <= end:
                countlist.append(count2)
                print(count2,'\t', l, '\t', type, '\t', tag, file = output, end='\n')
            count2 = count2 +1    
    print(len(countlist))
    print(countlist)
    count1 = 0
    while(count1 < len(numberlist)):
        index1 = numberlist[count1]
        index1 = int(index1)
         
        if index1 not in countlist:
            print(index1)
            print(index1,'\t',locationlist[index1], '\t','intergene', '\t', 'NA', file = output, end = '\n') 
        count1 = count1 +1
if __name__ == "__main__": main() 