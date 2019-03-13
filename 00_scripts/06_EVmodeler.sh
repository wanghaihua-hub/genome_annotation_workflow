#!/bin/bash
#PBS -N EVM
#PBS -o 98_log_files/log-prep_commands.EVM.out
#PBS -l walltime=12:00:00
#PBS -l mem=5g
#PBS -r n

cd $PBS_O_WORKDIR


GENOME="01_info_files/sspace.final.scaffolds.fasta"
WEIGHT="1_info_files/weight.txt"
OUTPUT="EVM_output.txt"
GENOME_NAME="sspace.final.scaffolds.fasta"

#Converter augustus gtf to gff3
#augustus_GTF_to_EVM_GFF3.pl in utilitis scripts

# Check .gff3 files
gff3_gene_prediction_file_validator.pl transcript.test.gff3 >test.tr

partition_EVM_inputs.pl --genome "$GENOME" \
     --gene_predictions denovo.test.gff3 --protein_alignments homology.test.gff3 \
     --transcript_alignments transcript.test.gff3 \
    --segmentSize 100000 --overlapSize 10000 --partition_listing partitions_list.out


write_EVM_commands.pl --genome "$GENOME" --weights "$WEIGHT" \
      --gene_predictions denovo.test.gff3 --protein_alignments homology.test.gff3 \
      --transcript_alignments transcript.test.gff3 \
      --output_file_name "$OUTPUT" --partitions partitions_list.out >commands.list
