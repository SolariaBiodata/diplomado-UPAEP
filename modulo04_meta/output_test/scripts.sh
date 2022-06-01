#Parallel-Meta  Pipeline Version: 3.6
#The reference sequence database is GreenGenes-13-8 (16S rRNA, 97% level)

#Microbial Community profiling
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-parallel-meta -r /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-01_S1_L001_R1_001.fastq -R /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-01_S1_L001_R2_001.fastq -o output_test/Single_Sample/085-01 -t 8 -f F -k F -D G -v T -c T -d 0.99
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-parallel-meta -r /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-02_S2_L001_R1_001.fastq -R /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-02_S2_L001_R2_001.fastq -o output_test/Single_Sample/085-02 -t 8 -f F -k F -D G -v T -c T -d 0.99
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-parallel-meta -r /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-03_S3_L001_R1_001.fastq -R /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-03_S3_L001_R2_001.fastq -o output_test/Single_Sample/085-03 -t 8 -f F -k F -D G -v T -c T -d 0.99
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-select-taxa -l output_test/Single_Sample.List/taxa.list -o output_test/Abundance_Tables/taxa -L 7 -m 0 -n 0 -z 0 -v 0 -q 0 -D G -r T

#Feature Selection
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-select-taxa -T output_test/Abundance_Tables/taxa.OTU.Count -o output_test/Abundance_Tables/taxa -L 1 -m 0 -n 0 -D G -r T
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Distribution.R -m output_test/meta.txt -i output_test/Abundance_Tables/taxa.phylum.Abd -o output_test/Abundance_Tables -p taxa.phylum.Abd
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-select-taxa -T output_test/Abundance_Tables/taxa.OTU.Count -o output_test/Abundance_Tables/taxa -L 5 -m 0 -n 0 -D G -r T
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Distribution.R -m output_test/meta.txt -i output_test/Abundance_Tables/taxa.genus.Abd -o output_test/Abundance_Tables -p taxa.genus.Abd

#Function Prediction
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-predict-func -T output_test/Abundance_Tables/taxa.OTU.Count -o output_test/Abundance_Tables/func -t 8 -D G
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-predict-func-nsti -T output_test/Abundance_Tables/taxa.OTU.Count -o output_test/Abundance_Tables/func.nsti -D G
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-select-func -T output_test/Abundance_Tables/func.KO.Count -o output_test/Abundance_Tables/func -L 2 -D G
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Distribution.R -m output_test/meta.txt -i output_test/Abundance_Tables/func.l2.Abd -o output_test/Abundance_Tables -p func.l2.Abd
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-select-func -T output_test/Abundance_Tables/func.KO.Count -o output_test/Abundance_Tables/func -L 3 -D G
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Distribution.R -m output_test/meta.txt -i output_test/Abundance_Tables/func.l3.Abd -o output_test/Abundance_Tables -p func.l3.Abd

#Sample visualization
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-plot-taxa -T output_test/Abundance_Tables/taxa.OTU.Count -o output_test/Sample_Views/ -D G

#Dist Calculation
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-comp-taxa -T output_test/Abundance_Tables/taxa.OTU.Count -o output_test/Distance_Matrix/taxa.dist -t 8 -P T -c 2 -D G
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-comp-taxa -T output_test/Abundance_Tables/taxa.OTU.Count -o output_test/Distance_Matrix/taxa.unweighted.dist -t 8 -P T -c 2 -D G -M 1
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-comp-func -T output_test/Abundance_Tables/func.KO.Count -o output_test/Distance_Matrix/func.dist -t 8 -P T -c 2 -D G

#Correlation Calculation
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-comp-corr -i output_test/Abundance_Tables/taxa.phylum.Count -o output_test/Network/taxa.phylum -f 1 -N T -G 0.500000
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-comp-corr -i output_test/Abundance_Tables/taxa.genus.Count -o output_test/Network/taxa.genus -f 1 -N T -G 0.500000

#Rarefaction Analysis
/home/centos/diplomadoUPAEP/parallel-meta-suite/bin//PM-rare-curv -i output_test/Abundance_Tables/taxa.OTU.Count -o output_test/Alpha_Diversity -p taxa.OTU -b 10

#PCoA Calculation
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Pcoa.R -m output_test/meta.txt -d output_test/Distance_Matrix/taxa.dist -o output_test/Clustering/taxa.pcoa.pdf
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Pcoa.R -m output_test/meta.txt -d output_test/Distance_Matrix/taxa.unweighted.dist -o output_test/Clustering/taxa.unweighted.pcoa.pdf
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Pcoa.R -m output_test/meta.txt -d output_test/Distance_Matrix/func.dist -o output_test/Clustering/func.pcoa.pdf

#PCA Calculation
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Pca.R -m output_test/meta.txt -i output_test/Abundance_Tables/taxa.phylum.Abd -o output_test/Clustering/taxa.phylum.pca.pdf
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Pca.R -m output_test/meta.txt -i output_test/Abundance_Tables/taxa.genus.Abd -o output_test/Clustering/taxa.genus.pca.pdf
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Pca.R -m output_test/meta.txt -i output_test/Abundance_Tables/func.l2.Abd -o output_test/Clustering/func.l2.pca.pdf
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Pca.R -m output_test/meta.txt -i output_test/Abundance_Tables/func.l3.Abd -o output_test/Clustering/func.l3.pca.pdf

#Multivariate Statistical Analysis
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Adiversity.R -m output_test/meta.txt -i output_test/Abundance_Tables/taxa.phylum.Abd -o output_test/Alpha_Diversity -p taxa.phylum
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Adiversity.R -m output_test/meta.txt -i output_test/Abundance_Tables/taxa.genus.Abd -o output_test/Alpha_Diversity -p taxa.genus
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Adiversity.R -m output_test/meta.txt -i output_test/Abundance_Tables/taxa.OTU.Abd -o output_test/Alpha_Diversity -p taxa.OTU
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Bdiversity.R -m output_test/meta.txt -d output_test/Distance_Matrix/taxa.dist -o output_test/Beta_Diversity -p taxa.dist -n Meta-Storms
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Bdiversity.R -m output_test/meta.txt -d output_test/Distance_Matrix/taxa.unweighted.dist -o output_test/Beta_Diversity -p taxa.unweighted.dist -n Meta-Storms-unweighed
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Adiversity.R -m output_test/meta.txt -i output_test/Abundance_Tables/func.l2.Abd -o output_test/Alpha_Diversity -p func.l2
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Adiversity.R -m output_test/meta.txt -i output_test/Abundance_Tables/func.l3.Abd -o output_test/Alpha_Diversity -p func.l3
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Bdiversity.R -m output_test/meta.txt -d output_test/Distance_Matrix/func.dist -o output_test/Beta_Diversity -p func.dist -n Cosine

#Marker Analysis
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Marker_Test.R -i output_test/Abundance_Tables/taxa.phylum.Abd -m output_test/meta.txt -o output_test/Markers -p taxa.phylum -P F
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Marker_RFscore.R -i output_test/Abundance_Tables/taxa.phylum.Abd -m output_test/meta.txt -o output_test/Markers -p taxa.phylum
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Marker_Corr.R -i output_test/Abundance_Tables/taxa.phylum.Abd -m output_test/meta.txt -o output_test/Markers -p taxa.phylum
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Marker_Test.R -i output_test/Abundance_Tables/taxa.genus.Abd -m output_test/meta.txt -o output_test/Markers -p taxa.genus -P F
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Marker_RFscore.R -i output_test/Abundance_Tables/taxa.genus.Abd -m output_test/meta.txt -o output_test/Markers -p taxa.genus
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Marker_Corr.R -i output_test/Abundance_Tables/taxa.genus.Abd -m output_test/meta.txt -o output_test/Markers -p taxa.genus
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Marker_Test.R -i output_test/Abundance_Tables/func.l2.Abd -m output_test/meta.txt -o output_test/Markers -p func.l2 -P F
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Marker_RFscore.R -i output_test/Abundance_Tables/func.l2.Abd -m output_test/meta.txt -o output_test/Markers -p func.l2
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Marker_Corr.R -i output_test/Abundance_Tables/func.l2.Abd -m output_test/meta.txt -o output_test/Markers -p func.l2
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Marker_Test.R -i output_test/Abundance_Tables/func.l3.Abd -m output_test/meta.txt -o output_test/Markers -p func.l3 -P F
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Marker_RFscore.R -i output_test/Abundance_Tables/func.l3.Abd -m output_test/meta.txt -o output_test/Markers -p func.l3
Rscript /home/centos/diplomadoUPAEP/parallel-meta-suite/Rscript/PM_Marker_Corr.R -i output_test/Abundance_Tables/func.l3.Abd -m output_test/meta.txt -o output_test/Markers -p func.l3
