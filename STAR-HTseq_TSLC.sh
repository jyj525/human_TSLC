##################  Align to Gene with STAR
############################################################################################
##########################       RNA-seq analysis (hg38)    ################################
############################################################################################
##################  Genome generation (for indexing)
# https://physiology.med.cornell.edu/faculty/skrabanek/lab/angsd/lecture_notes/STARmanual.pdf

##################  Mapping
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/ESC_1_R1.fastq $path/ESC_1_R2.fastq --outFileNamePrefix $path1/ESC_1
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/ESC_2_R1.fastq $path/ESC_2_R2.fastq --outFileNamePrefix $path1/ESC_2
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/iPSC_1_R1.fastq $path/iPSC_1_R2.fastq --outFileNamePrefix $path1/iPSC_1
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/iPSC_2_R1.fastq $path/iPSC_2_R2.fastq --outFileNamePrefix $path1/iPSC_2
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/TSC_1_R1.fastq $path/TSC_1_R2.fastq --outFileNamePrefix $path1/TSC_1
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/TSC_2_R1.fastq $path/TSC_2_R2.fastq --outFileNamePrefix $path1/TSC_2
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/ESTSLC_1_R1.fastq $path/ESTSLC_1_R2.fastq --outFileNamePrefix $path1/ESTSLC_1
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/ESTSLC_2_R1.fastq $path/ESTSLC_2_R2.fastq --outFileNamePrefix $path1/ESTSLC_2
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/iPSTSLC_1_R1.fastq $path/iPSTSLC_1_R2.fastq --outFileNamePrefix $path1/iPSTSLC_1
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/iPSTSLC_2_R1.fastq $path/iPSTSLC_2_R2.fastq --outFileNamePrefix $path1/iPSTSLC_2
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/ST_1_R1.fastq $path/ST_1_R2.fastq --outFileNamePrefix $path1/ST_1
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/ST_2_R1.fastq $path/ST_2_R2.fastq --outFileNamePrefix $path1/ST_2
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/ESST_1_R1.fastq $path/ESST_1_R2.fastq --outFileNamePrefix $path1/ESST_1
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/ESST_2_R1.fastq $path/ESST_2_R2.fastq --outFileNamePrefix $path1/ESST_2
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/iPSST_1_R1.fastq $path/iPSST_1_R2.fastq --outFileNamePrefix $path1/iPSST_1
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/iPSST_2_R1.fastq $path/iPSST_2_R2.fastq --outFileNamePrefix $path1/iPSST_2
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/EVT_1_R1.fastq $path/EVT_1_R2.fastq --outFileNamePrefix $path1/EVT_1
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/EVT_2_R1.fastq $path/EVT_2_R2.fastq --outFileNamePrefix $path1/EVT_2
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/ESEVT_1_R1.fastq $path/ESEVT_1_R2.fastq --outFileNamePrefix $path1/ESEVT_1
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/ESEVT_2_R1.fastq $path/ESEVT_2_R2.fastq --outFileNamePrefix $path1/ESEVT_2
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/ESEVT_3_R1.fastq $path/ESEVT_3_R2.fastq --outFileNamePrefix $path1/ESEVT_3
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/ESEVT_4_R1.fastq $path/ESEVT_4_R2.fastq --outFileNamePrefix $path1/ESEVT_4
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/iPSEVT_1_R1.fastq $path/iPSEVT_1_R2.fastq --outFileNamePrefix $path1/iPSEVT_1
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/iPSEVT_2_R1.fastq $path/iPSEVT_2_R2.fastq --outFileNamePrefix $path1/iPSEVT_2
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/iPSEVT_3_R1.fastq $path/iPSEVT_3_R2.fastq --outFileNamePrefix $path1/iPSEVT_3
STAR --runThreadN 20 --genomeDir $path4/STAR_Human --readFilesIn $path/iPSEVT_4_R1.fastq $path/iPSEVT_4_R2.fastq --outFileNamePrefix $path1/iPSEVT_4

##################  Quantification with HTseq

htseq-count -t exon $path1/ESC_1Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/ESC_1_HTseq.counts
htseq-count -t exon $path1/ESC_2Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/ESC_2_HTseq.counts
htseq-count -t exon $path1/iPSC_1Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/iPSC_1_HTseq.counts
htseq-count -t exon $path1/iPSC_2Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/iPSC_2_HTseq.counts
htseq-count -t exon $path1/TSC_1Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/TSC_1_HTseq.counts
htseq-count -t exon $path1/TSC_2Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/TSC_2_HTseq.counts
htseq-count -t exon $path1/ESTSLC_1Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/ESTSLC_1_HTseq.counts
htseq-count -t exon $path1/ESTSLC_2Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/ESTSLC_2_HTseq.counts
htseq-count -t exon $path1/iPSTSLC_1Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/iPSTSLC_1_HTseq.counts
htseq-count -t exon $path1/iPSTSLC_2Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/iPSTSLC_2_HTseq.counts
htseq-count -t exon $path1/EVT_1Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/EVT_1_HTseq.counts
htseq-count -t exon $path1/EVT_2Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/EVT_2_HTseq.counts
htseq-count -t exon $path1/ESEVT_1Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/ESEVT_1_HTseq.counts
htseq-count -t exon $path1/ESEVT_2Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/ESEVT_2_HTseq.counts
htseq-count -t exon $path1/ESEVT_3Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/ESEVT_3_HTseq.counts
htseq-count -t exon $path1/ESEVT_4Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/ESEVT_4_HTseq.counts
htseq-count -t exon $path1/iPSEVT_1Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/iPSEVT_1_HTseq.counts
htseq-count -t exon $path1/iPSEVT_2Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/iPSEVT_2_HTseq.counts
htseq-count -t exon $path1/iPSEVT_3Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/iPSEVT_3_HTseq.counts
htseq-count -t exon $path1/iPSEVT_4Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/iPSEVT_4_HTseq.counts
htseq-count -t exon $path1/ST_1Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/ST_1_HTseq.counts
htseq-count -t exon $path1/ST_2Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/ST_2_HTseq.counts
htseq-count -t exon $path1/ESST_1Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/ESST_1_HTseq.counts
htseq-count -t exon $path1/ESST_2Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/ESST_2_HTseq.counts
htseq-count -t exon $path1/iPSST_1Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/iPSST_1_HTseq.counts
htseq-count -t exon $path1/iPSST_2Aligned.out.sam $path2/Homo_sapiens_genecode.v35.annotation.gtf > $path3/iPSST_2_HTseq.counts
