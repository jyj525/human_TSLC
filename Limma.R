options(connectionObserver = NULL)
library(pheatmap)
library(tidyverse)
library(RColorBrewer)
library(readxl)
library(openxlsx)
library(gdata)
library(gplots)
library(clusterProfiler)
library(RColorBrewer)
library(zoo)
library(DESeq2)
library(biomaRt)
library(stringr)
library(limma)

df = read.csv("fpkm+1.csv") %>% as.data.frame()
rownames(df) = df$Gene %>% make.unique()
df = df %>% dplyr::select(-Gene)
df = df-1

fpkmToTpm <- function(fpkm){
  exp(log(fpkm) - log(sum(fpkm)) + log(1e6))
}

fpkm = df %>% dplyr::select(-average)
average = df$average
SD = apply(fpkm,1,sd)

diff = sweep(fpkm,1,average,FUN = "-")
z.fpkm = sweep(diff,1,SD,FUN = "/")

TPM = fpkmToTpm(fpkm)

###### limma
logfpkm = log2(fpkm+1)

pd = data.frame(cell=str_sub(colnames(fpkm),1,nchar(colnames(fpkm))-1))
rownames(pd) = colnames(fpkm)

design <- model.matrix(~0+cell,data=pd)
colnames(design) <- gsub("cell","",colnames(design))
contrast.matrix <- makeContrasts("TSct_vs_EVTTSct"=TSct-EVTTSct, 
                                 "TSct_vs_STTSct"=TSct-STTSct,
                                 levels=design)
fit <- lmFit(logfpkm, design)
fit <- contrasts.fit(fit, contrast.matrix)
fit <- eBayes(fit, trend=TRUE)

sigGenes = list()
sigGenes[["TSct_vs_EVTTSct"]] = topTable(fit, coef="TSct_vs_EVTTSct", number=nrow(logfpkm), adjust.method="BH")
sigGenes[["TSct_vs_STTSct"]] = topTable(fit, coef="TSct_vs_STTSct", number=nrow(logfpkm), adjust.method="BH")

write.csv(sigGenes[["TSct_vs_EVTTSct"]], file=paste0("TSct_vs_EVTct.csv"))
write.csv(sigGenes[["TSct_vs_STTSct"]], file=paste0("TSct_vs_STct.csv"))
