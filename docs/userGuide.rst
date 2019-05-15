Requirements
============

- Anaconda 1

You can follow the `installation guide <https://docs.anaconda.com/anaconda/install/>`_ .

Installation
============

Clone github repo and enter directory::
   
   git clone https://github.com/lauramilena3/On-rep-seq
   cd On-rep-seq

Create On-rep-seq virtual environment and activate it::
   
   conda env create -n On-rep-seq -f On-rep-seq.yaml
   source activate On-rep-seq

Go into On-rep-seq directory and create variables to your 
basecalled data and the results directory of your choice::
   
   fastqDir="/path/to/your/basecalled/data"
   reusultDir="/path/to/your/desired/results/dir"

Running
=======

Note to Os users (Canu) 
-----------------------
If you are using os then you need to edit the config file to set a new directory for canu::
   
   sed -i'.bak' -e 's/Linux-amd64/Darwin-amd64/g' config.yaml

Download kraken database
------------------------

View the number of avaliable cores and set a number::
   
   nproc
   nCores="n"

If you are using your laptop we suggest you to leave 2 free processors
for other system tasks. 

Download kraken database, notice this step can take up to 48 hours::

   
   kraken2-build --download-taxonomy --db db/NCBI-bacteria --threads $nCores #4h
   kraken2-build --download-library bacteria --db db/NCBI-bacteria --threads $nCores #33h
   kraken2-build --build --db db/NCBI-bacteria --threads $nCores #4h

Running On-rep-seq
------------------


Run the snakemake pipeline with the desired number of cores::
   
   snakemake -j $nCores --use-conda --config basecalled_data=$fastqDir results_dir=$reusultDir


View dag of jobs to visualize the workflow 
++++++++++++++++++++++++++++++++++++++++++

To view the dag run::

   snakemake --dag | dot -Tpdf > dag.pdf

Results 
=======

All results are stored in the data folder

``01_porechopped_data``





