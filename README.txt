Data folder contains css & excel files for reading in to scripts. 
Cluster memberships:
PH123_25memberships_Z5_allmiR.csv - clustering run for PH1-3 on zscored data, < 5sd using all miRNAs which passed QC (so including ones missing from CIPHER). Memberships output for k2-k25

PH12345_25memberships_Z5_allmiR.csv - clustering run for all PH (PH1-5) on zscored data, < 5sd using all miRNAs which passed QC (so including ones missing from CIPHER). Memberships output for k2-k25

UpdatedPheno060223.csv - most up-to-date phenotype data for patients

Validation_with_k5predictsion.csv - Validation Partition (zscored separately, including memberships for k5)

z_TI_noout_5_PH12345.csv - miR data, zscored training and interim data, values < 5sd, all PH (PH1-5)

z_V_noout_5_PH12345.csv - miR data, zscored validation partition data (processed separately), values < 5sd, all PH (PH1-5)


Multivar_models.rds - Multivariable model for clusters (PH1-5)


SCRIPTS

OmadaPH12345_Z5.Rmd - Run OMADA on all PH, using zscored data (<5sd)

Z5_ClusterComparisons.Rmd - PH1-5 cluster memberships compared using heatmaps, tsne etc

Z5_PH12345_k5.Rmd - for clusters trained on z-score data (< 5 sd from mean), with k = 5, look at clinical parameters between clusters. ALso survival curves

Z5_k5_multivarmodels.Rmd - create multivariable glm model for zscored data (keeping < 5 sd from mean). Clusters trained using training + interim. Models for each cluster trained on training set alone, using interim as test.

custom_optimalClustering.R - script from Sokratis to custom set clustering voting

