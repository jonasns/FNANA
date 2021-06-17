#!/bin/bash
#script made to count the number of reads aligned to genes in a reference genome file. 
#Made by Jonas N. Søndergaard
#Made on 171106

#run featureCounts
featureCounts \
	-t exon \
	-g gene_id \
	-s 0 \
	-T 1 \
	-p \
	-M \
	-O \
	--fraction \
	-C \
	-a ${GTF_PATH}/gencode.vM15.annotation.noMYX.gtf \
	-o ${OUTPUT_PATH}/171106_FNANA.readCount \
	${BAM_PATH}/*.bam \
	&> ${OUTPUT_PATH}/171106_FNANA.readCount.log


#Readme
#noMYX: X, Y, and mitochondrial genomes removed
#-t: Specify feature type in GTF annotation.
#-g: Specify attribute type in GTF annotation.
#-s: Strandedness. Use '0' if not strand-specific.
#-T: Number of computational cores/threads used for the analysis
#-p: The experiment is paired end
#-M: Multi-mapping reads will also be counted. Each alignment will have 1 count or a fractional count if --fraction is specified
#-O: Allow reads that overlaps multiple features to be counted
#-C: If specified, the chimeric fragments (those fragments that have their two ends aligned to different chromosomes) will NOT be counted.
#-a: Name of the annotation file.
#-o: output file name
