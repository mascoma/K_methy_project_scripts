#!/usr/bin/env python

import sys, getopt, io
from Bio.Blast import NCBIXML
def main(argv):
    inputfile = ''
    outputfile = ''
    try:
        opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
    except getopt.GetoptError:
        print ("test.py -i <inputfile> -o <outputfile>")
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print ("test.py -i <inputfile> -o <outputfile>")
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            outputfile = arg
    print ("Input file is " + inputfile)
    print ("Output file is " + outputfile)
    outfile = open(outputfile, 'w')
    outfile.write("qseqid\tqseqdef\tqframe\tqlen\tqstart\tqend\tsseqid\tsseqdef\tslen\tsstart\tsend\tidentity\tpositive\tgaps\talign_len\teValue\n")
    try:
        result_handle = open(inputfile)
        blast_records = NCBIXML.parse(result_handle)
        for record in blast_records:
            for alignment in record.alignments:
                for hsp in alignment.hsps:
                    fields = [record.query_id,record.query,str(hsp.frame),str(record.query_length),str(hsp.query_start),str(hsp.query_end),alignment.hit_id,alignment.hit_def,str(alignment.length),str(hsp.sbjct_start),str(hsp.sbjct_end),str(hsp.identities),str(hsp.positives),str(hsp.gaps),str(hsp.align_length),str(hsp.expect)]
                    outfile.write("\t".join(fields) + "\n")
    except IOError:
        print ("no such file!")
if __name__ == "__main__": main(sys.argv[1:]) 