######### salmon
# salmon-1.6.0_linux_x86_64/

######### INDEX
# gencode.v39.transcripts.fa.gz
# GRCh38.primary_assembly.genome.fa.gz
# gencode.v39.annotation.gtf.gz

######### quant
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/ESC_1_R1.fastq.gz -2 $path/ESC_1_R2.fastq.gz -p 8 -o $path8/ESC_1
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/ESC_2_R1.fastq.gz -2 $path/ESC_2_R2.fastq.gz -p 8 -o $path8/ESC_2
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/iPSC_1_R1.fastq.gz -2 $path/iPSC_1_R2.fastq.gz -p 8 -o $path8/iPSC_1
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/iPSC_2_R1.fastq.gz -2 $path/iPSC_2_R2.fastq.gz -p 8 -o $path8/iPSC_2
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/TSC_1_R1.fastq.gz -2 $path/TSC_1_R2.fastq.gz -p 8 -o $path8/TSC_1
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/TSC_2_R1.fastq.gz -2 $path/TSC_2_R2.fastq.gz -p 8 -o $path8/TSC_2
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/ESTSLC_1_R1.fastq.gz -2 $path/ESTSLC_1_R2.fastq.gz -p 8 -o $path8/ESTSLC_1
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/ESTSLC_2_R1.fastq.gz -2 $path/ESTSLC_2_R2.fastq.gz -p 8 -o $path8/ESTSLC_2
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/iPSTSLC_1_R1.fastq.gz -2 $path/iPSTSLC_1_R2.fastq.gz -p 8 -o $path8/iPSTSLC_1
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/iPSTSLC_2_R1.fastq.gz -2 $path/iPSTSLC_2_R2.fastq.gz -p 8 -o $path8/iPSTSLC_2
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/ST_1_R1.fastq.gz -2 $path/ST_1_R2.fastq.gz -p 8 -o $path8/ST_1
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/ST_2_R1.fastq.gz -2 $path/ST_2_R2.fastq.gz -p 8 -o $path8/ST_2
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/ESST_1_R1.fastq.gz -2 $path/ESST_1_R2.fastq.gz -p 8 -o $path8/ESST_1
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/ESST_2_R1.fastq.gz -2 $path/ESST_2_R2.fastq.gz -p 8 -o $path8/ESST_2
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/iPSST_1_R1.fastq.gz -2 $path/iPSST_1_R2.fastq.gz -p 8 -o $path8/iPSST_1
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/iPSST_2_R1.fastq.gz -2 $path/iPSST_2_R2.fastq.gz -p 8 -o $path8/iPSST_2
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/EVT_1_R1.fastq.gz -2 $path/EVT_1_R2.fastq.gz -p 8 -o $path8/EVT_1
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/EVT_2_R1.fastq.gz -2 $path/EVT_2_R2.fastq.gz -p 8 -o $path8/EVT_2
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/ESEVT_1_R1.fastq.gz -2 $path/ESEVT_1_R2.fastq.gz -p 8 -o $path8/ESEVT_1
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/ESEVT_2_R1.fastq.gz -2 $path/ESEVT_2_R2.fastq.gz -p 8 -o $path8/ESEVT_2
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/ESEVT_3_R1.fastq.gz -2 $path/ESEVT_3_R2.fastq.gz -p 8 -o $path8/ESEVT_3
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/ESEVT_4_R1.fastq.gz -2 $path/ESEVT_4_R2.fastq.gz -p 8 -o $path8/ESEVT_4
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/iPSEVT_1_R1.fastq.gz -2 $path/iPSEVT_1_R2.fastq.gz -p 8 -o $path8/iPSEVT_1
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/iPSEVT_2_R1.fastq.gz -2 $path/iPSEVT_2_R2.fastq.gz -p 8 -o $path8/iPSEVT_2
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/iPSEVT_3_R1.fastq.gz -2 $path/iPSEVT_3_R2.fastq.gz -p 8 -o $path8/iPSEVT_3
$path7/salmon quant -i $path6/human_v39_salmon160_index -l A --gcBias --validateMappings -1 $path/iPSEVT_4_R1.fastq.gz -2 $path/iPSEVT_4_R2.fastq.gz -p 8 -o $path8/iPSEVT_4
