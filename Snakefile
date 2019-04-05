import os
import re

#======================================================
# Config files
#======================================================
configfile: "config.yaml"

#======================================================
# Global variables
#======================================================
RULES_DIR = 'rules'
BASECALLED_DIR = config["basecalled_dir"]
BARCODES = config["barcodes"].split()

#======================================================
# Rules
#======================================================
 
rule all:
    input:
        "data/LCPs/LCPs.pdf",
        "runnable_jupyter_on-rep-seq_flowgrams_clustering_heatmaps.html",
        expand("data/peaks/taxonomyFiles_{barcode}.txt", barcode=BARCODES)

include: os.path.join(RULES_DIR, 'demultiplex.smk')
include: os.path.join(RULES_DIR, 'LCPs.smk')
include: os.path.join(RULES_DIR, 'peakCorrection.smk')
include: os.path.join(RULES_DIR, 'taxonomyAssignment.smk')