library(DESeq2)

setwd(dir)

########## run DESeq2

samples <- read.table(file.path(dir, "HTseq_sampletable.txt"), header=TRUE)
sampleFiles <- grep("counts",list.files(dir1),value=TRUE)
sampleCondition <- samples$condition
sampleNames <- samples$sample 
sampleType <- samples$type
sampleTable <- data.frame(sampleName = sampleNames, fileName = sampleFiles, condition = sampleCondition, type = sampleType)

ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = dir1,
                                       design = ~ condition)
                                       
keep <- rowSums(counts(ddsHTSeq)) >= 1
ddsHTSeq <- ddsHTSeq[keep,]
dds <- DESeq(ddsHTSeq)

colData(dds)

########## Generation of normalized values table
res <- results(dds)
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds,normalized=TRUE)),by='row.names',sort=FALSE)
names(resdata)[1]<-'gene'
write.csv(resdata, file=paste0("TSLC","-results-with-normalized.csv"))

########## PCA plot
vsd <- vst(dds, blind=FALSE)

library(ggplot2)
p <- plotPCA(vsd, intgroup=c("condition")) + theme_classic()
p

########## Violoin plot
library(wesanderson)
library(ggplot2)

data_EVT <- read.table(file="Violin_list_EVT_log2list.txt", header=TRUE, sep="\t")
violin1 <- ggplot(data_EVT, aes(x=Type, y=Value, fill=Group)) + geom_violin()+ geom_boxplot(width=0.2, fill="#FFFFFF") + scale_fill_brewer(palette = "Pastel2") + theme_classic() + theme(legend.position = "none") + labs(x="Cell types", y="Log2 (Values+1)")
violin1 + scale_x_discrete(limits=c("iPSTSLC_1","iPSTSLC_2","ESTSLC_1","ESTSLC_2","TSC_1","TSC_2","iPSEVT_1","iPSEVT_2","ESEVT_1","ESEVT_2","EVT_1","EVT_2"))

data_ST <- read.table(file="Violin_list_ST_log2list.txt", header=TRUE, sep="\t")
violin2 <- ggplot(data_EVT, aes(x=Type, y=Value, fill=Group)) + geom_violin()+ geom_boxplot(width=0.2, fill="#FFFFFF") + scale_fill_brewer(palette = "Pastel2") + theme_classic() + theme(legend.position = "none") + labs(x="Cell types", y="Log2 (Values+1)")
violin2 + scale_x_discrete(limits=c("iPSTSLC_1","iPSTSLC_2","ESTSLC_1","ESTSLC_2","TSC_1","TSC_2","iPSST_1","iPSST_2","ESST_1","ESST_2","ST_1","ST_2"))

####### sessionInfo()
R version 4.1.2 (2021-11-01)
Platform: x86_64-apple-darwin17.0 (64-bit)
Running under: macOS Monterey 12.2

Matrix products: default
LAPACK: /Library/Frameworks/R.framework/Versions/4.1/Resources/lib/libRlapack.dylib

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] parallel  stats4    stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] DESeq2_1.32.0               patchwork_1.1.1             SeuratObject_4.0.4          Seurat_4.1.0               
 [5] scran_1.20.1                scuttle_1.2.1               SingleCellExperiment_1.14.1 SummarizedExperiment_1.22.0
 [9] Biobase_2.52.0              GenomicRanges_1.44.0        GenomeInfoDb_1.28.4         IRanges_2.26.0             
[13] S4Vectors_0.30.2            BiocGenerics_0.38.0         MatrixGenerics_1.4.3        matrixStats_0.61.0         
[17] dplyr_1.0.7                 ggplot2_3.3.5               RColorBrewer_1.1-2         

loaded via a namespace (and not attached):
  [1] utf8_1.2.2                reticulate_1.24           tidyselect_1.1.1          RSQLite_2.2.9            
  [5] AnnotationDbi_1.54.1      htmlwidgets_1.5.4         grid_4.1.2                BiocParallel_1.26.2      
  [9] Rtsne_0.15                munsell_0.5.0             ScaledMatrix_1.0.0        codetools_0.2-18         
 [13] ica_1.0-2                 statmod_1.4.36            future_1.23.0             miniUI_0.1.1.1           
 [17] withr_2.4.3               colorspace_2.0-2          knitr_1.37                rstudioapi_0.13          
 [21] ROCR_1.0-11               tensor_1.5                listenv_0.8.0             labeling_0.4.2           
 [25] GenomeInfoDbData_1.2.6    polyclip_1.10-0           bit64_4.0.5               farver_2.1.0             
 [29] parallelly_1.30.0         vctrs_0.3.8               generics_0.1.1            xfun_0.29                
 [33] R6_2.5.1                  ggbeeswarm_0.6.0          rsvd_1.0.5                locfit_1.5-9.4           
 [37] cachem_1.0.6              bitops_1.0-7              spatstat.utils_2.3-0      reshape_0.8.8            
 [41] DelayedArray_0.18.0       assertthat_0.2.1          promises_1.2.0.1          scales_1.1.1             
 [45] beeswarm_0.4.0            gtable_0.3.0              beachmat_2.8.1            Cairo_1.5-14             
 [49] globals_0.14.0            goftest_1.2-3             rlang_1.0.0               genefilter_1.74.1        
 [53] splines_4.1.2             lazyeval_0.2.2            spatstat.geom_2.3-1       yaml_2.2.2               
 [57] reshape2_1.4.4            abind_1.4-5               httpuv_1.6.5              tools_4.1.2              
 [61] ellipsis_0.3.2            spatstat.core_2.3-2       ggridges_0.5.3            Rcpp_1.0.8               
 [65] plyr_1.8.6                sparseMatrixStats_1.4.2   zlibbioc_1.38.0           purrr_0.3.4              
 [69] RCurl_1.98-1.5            rpart_4.1.16              deldir_1.0-6              pbapply_1.5-0            
 [73] cowplot_1.1.1             zoo_1.8-9                 ggrepel_0.9.1             cluster_2.1.2            
 [77] magrittr_2.0.2            data.table_1.14.2         RSpectra_0.16-0           scattermore_0.7          
 [81] lmtest_0.9-39             RANN_2.6.1                fitdistrplus_1.1-6        mime_0.12                
 [85] evaluate_0.14             xtable_1.8-4              XML_3.99-0.8              gridExtra_2.3            
 [89] compiler_4.1.2            tibble_3.1.6              KernSmooth_2.23-20        crayon_1.4.2             
 [93] htmltools_0.5.2           mgcv_1.8-38               later_1.3.0               geneplotter_1.70.0       
 [97] tidyr_1.1.4               DBI_1.1.2                 MASS_7.3-55               Matrix_1.4-0             
[101] cli_3.1.1                 metapod_1.0.0             igraph_1.2.11             pkgconfig_2.0.3          
[105] plotly_4.10.0             spatstat.sparse_2.1-0     annotate_1.70.0           vipor_0.4.5              
[109] dqrng_0.3.0               XVector_0.32.0            stringr_1.4.0             digest_0.6.29            
[113] sctransform_0.3.3         RcppAnnoy_0.0.19          Biostrings_2.60.2         spatstat.data_2.1-2      
[117] rmarkdown_2.11            leiden_0.3.9              uwot_0.1.11               edgeR_3.34.1             
[121] DelayedMatrixStats_1.14.3 shiny_1.7.1               lifecycle_1.0.1           nlme_3.1-155             
[125] jsonlite_1.7.3            BiocNeighbors_1.10.0      viridisLite_0.4.0         limma_3.48.3             
[129] fansi_1.0.2               pillar_1.6.5              lattice_0.20-45           KEGGREST_1.32.0          
[133] ggrastr_1.0.1             fastmap_1.1.0             httr_1.4.2                survival_3.2-13          
[137] glue_1.6.1                png_0.1-7                 bluster_1.2.1             bit_4.0.4                
[141] stringi_1.7.6             blob_1.2.2                BiocSingular_1.8.1        memoise_2.0.1            
[145] irlba_2.3.5               future.apply_1.8.1
