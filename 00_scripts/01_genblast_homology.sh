#!/usr/bin/env bash
#PBS -N genblast_gb
#PBS -o 98_log_files/log-genblast.__BASE__.out
#PBS -l walltime=20:00:00
#PBS -l mem=100g
#PBS -r n


# Global variables
PATHFILE="/home1/datawork/jleluyer/01_projects/genome_augustus"
QUERY=__BASE__
TARGET="/home/datawork-rmpf/p_margaritifera/genome/annotation/01_reference/sspace.final.scaffolds.fasta"
OUTFOLDER="/home1/datawork/jleluyer/01_projects/genome_augustus/04_temp_results"


cd /home1/datahome/jleluyer/softwares/genBlast_v138_linux_x86_64/

genblast -p genblastg -q "$PATHFILE"/"$QUERY".fa -t "$TARGET" -g T -v 2 -c 0.5 -e 0.00001 -r 10 -s 0 -gff -cdna -pro -o "$OUTFOLDER"/output.genblast."$QUERY"