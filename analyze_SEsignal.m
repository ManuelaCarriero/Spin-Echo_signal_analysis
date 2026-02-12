%% PREPARING DATA

%% read subjects file

subjects_cvr = importdata('/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/subjects_CVR.txt');
subjects_dwi = importdata('/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/subjects_DWI.txt');

n_subjs = length(subjects_dwi);%=subjects_cvr

%% load parametric images

%DWI

V_MD_maps={};

for i = 1:n_subjs         
    subj = subjects_dwi(i);
    subj=subj{1};

    img_path_MD=strcat('/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/DTI/',subj,'_data_dwi_dti_MD_2MNI2mm.nii.gz');

    V_vol_MD = spm_vol(img_path_MD);
    V_MD=spm_read_vols(V_vol_MD);
    V_MD_maps{end+1}=V_MD;
end

%CVR

%GE
V_petCO2_CVRBOLD_GE_maps={};
V_petCO2_CVRASL_GE_maps={};
%SE
V_petCO2_CVRBOLD_SE_maps={};
V_petCO2_CVRASL_SE_maps={};
%GE
V_BOLDGM_CVRBOLD_GE_maps={};
V_BOLDGM_CVRASL_GE_maps={};
%SE
V_BOLDGM_CVRBOLD_SE_maps={};
V_BOLDGM_CVRASL_SE_maps={};

for i = 1:n_subjs     

    subj = subjects_cvr(i);
    subj=subj{1};

    img_path_petCO2_CVRBOLD_GE=strcat('/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/CVR/CVR_maps_div1000/',subj,'_DEXIGESEBH_BOLD_regPETCO2_BOLDCVR2MNI2mm.nii.gz');
    img_path_petCO2_CVRASL_GE=strcat('/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/CVR/CVR_maps_div1000/',subj,'_DEXIGESEBH_BOLD_regPETCO2_CVR2MNI2mm.nii.gz');
    img_path_BOLDGM_CVRBOLD_GE=strcat('/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/CVR/CVR_maps_div1000/',subj,'_DEXIGESEBH_BOLD_regBOLDGM_BOLDCVR2MNI2mm.nii.gz');
    img_path_BOLDGM_CVRASL_GE=strcat('/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/CVR/CVR_maps_div1000/',subj,'_DEXIGESEBH_BOLD_regBOLDGM_CVR2MNI2mm.nii.gz');

    img_path_petCO2_CVRBOLD_SE=strcat('/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/CVR/CVR_maps_div1000/',subj,'_DEXIGESEBH_SEBOLD_regPETCO2_BOLDCVR2MNI2mm.nii.gz');
    img_path_petCO2_CVRASL_SE=strcat('/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/CVR/CVR_maps_div1000/',subj,'_DEXIGESEBH_SEBOLD_regPETCO2_CVR2MNI2mm.nii.gz');
    img_path_BOLDGM_CVRBOLD_SE=strcat('/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/CVR/CVR_maps_div1000/',subj,'_DEXIGESEBH_SEBOLD_regBOLDGM_BOLDCVR2MNI2mm.nii.gz');
    img_path_BOLDGM_CVRASL_SE=strcat('/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/CVR/CVR_maps_div1000/',subj,'_DEXIGESEBH_SEBOLD_regBOLDGM_CVR2MNI2mm.nii.gz');

    %GE

    V_vol_petCO2_CVRBOLD_GE = spm_vol(img_path_petCO2_CVRBOLD_GE);
    V_petCO2_CVRBOLD_GE=spm_read_vols(V_vol_petCO2_CVRBOLD_GE);
    V_petCO2_CVRBOLD_GE_maps{end+1}=V_petCO2_CVRBOLD_GE;

    V_vol_petCO2_CVRASL_GE = spm_vol(img_path_petCO2_CVRASL_GE);
    V_petCO2_CVRASL_GE=spm_read_vols(V_vol_petCO2_CVRASL_GE);
    V_petCO2_CVRASL_GE_maps{end+1}=V_petCO2_CVRASL_GE;

    V_vol_BOLDGM_CVRBOLD_GE = spm_vol(img_path_BOLDGM_CVRBOLD_GE);
    V_BOLDGM_CVRBOLD_GE=spm_read_vols(V_vol_BOLDGM_CVRBOLD_GE);
    V_BOLDGM_CVRBOLD_GE_maps{end+1}=V_BOLDGM_CVRBOLD_GE;

    V_vol_BOLDGM_CVRASL_GE = spm_vol(img_path_BOLDGM_CVRASL_GE);
    V_BOLDGM_CVRASL_GE=spm_read_vols(V_vol_BOLDGM_CVRASL_GE);
    V_BOLDGM_CVRASL_GE_maps{end+1}=V_BOLDGM_CVRASL_GE;

    %SE
    V_vol_petCO2_CVRBOLD_SE = spm_vol(img_path_petCO2_CVRBOLD_SE);
    V_petCO2_CVRBOLD_SE=spm_read_vols(V_vol_petCO2_CVRBOLD_SE);
    V_petCO2_CVRBOLD_SE_maps{end+1}=V_petCO2_CVRBOLD_SE;

    V_vol_petCO2_CVRASL_SE = spm_vol(img_path_petCO2_CVRASL_SE);
    V_petCO2_CVRASL_SE=spm_read_vols(V_vol_petCO2_CVRASL_SE);
    V_petCO2_CVRASL_SE_maps{end+1}=V_petCO2_CVRASL_SE;

    V_vol_BOLDGM_CVRBOLD_SE = spm_vol(img_path_BOLDGM_CVRBOLD_SE);
    V_BOLDGM_CVRBOLD_SE=spm_read_vols(V_vol_BOLDGM_CVRBOLD_SE);
    V_BOLDGM_CVRBOLD_SE_maps{end+1}=V_BOLDGM_CVRBOLD_SE;

    V_vol_BOLDGM_CVRASL_SE = spm_vol(img_path_BOLDGM_CVRASL_SE);
    V_BOLDGM_CVRASL_SE=spm_read_vols(V_vol_BOLDGM_CVRASL_SE);
    V_BOLDGM_CVRASL_SE_maps{end+1}=V_BOLDGM_CVRASL_SE;
end

%% load PVE maps
%PVE
V_PVE_GM_dwi_maps={};

for i = 1:n_subjs         
    subj = subjects_dwi(i);
    subj=subj{1};

    img_path_PVE_GM_dwi=strcat('/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/PVE/',subj,'_t1_mp2rage_sag_p3_iso_fast_UNI_brain_pve_1_2MNI2mm.nii.gz');

    V_vol_PVE_GM_dwi = spm_vol(img_path_PVE_GM_dwi);
    V_PVE_GM_dwi=spm_read_vols(V_vol_PVE_GM_dwi);
    V_PVE_GM_dwi_maps{end+1}=V_PVE_GM_dwi;
end

V_PVE_GM_cvr_maps={};

for i = 1:n_subjs         
    subj = subjects_cvr(i);
    subj=subj{1};

    img_path_PVE_GM_cvr=strcat('/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/PVE/',subj,'_t1_mp2rage_sag_p3_iso_fast_UNI_brain_pve_1_2MNI2mm.nii.gz');

    V_vol_PVE_GM_cvr = spm_vol(img_path_PVE_GM_cvr);
    V_PVE_GM_cvr=spm_read_vols(V_vol_PVE_GM_cvr);
    V_PVE_GM_cvr_maps{end+1}=V_PVE_GM_cvr;
end

%% PROCESSING
%multiply maps by the GM map
%save all vectorized maps in one variable
%compute the MEDIAN across voxels
%compute correlation coefficient
MD_map_GM_subjs = {};
petCO2_CVRBOLD_GE_map_GM_subjs = {};
petCO2_CVRASL_GE_map_GM_subjs = {};
BOLDGM_CVRBOLD_GE_map_GM_subjs = {};
BOLDGM_CVRASL_GE_map_GM_subjs = {};

petCO2_CVRBOLD_SE_map_GM_subjs = {};
petCO2_CVRASL_SE_map_GM_subjs = {};
BOLDGM_CVRBOLD_SE_map_GM_subjs = {};
BOLDGM_CVRASL_SE_map_GM_subjs = {};

CVRratio_petCO2_GE_subjs = {};
CVRratio_BOLDGM_GE_subjs = {};

CVRratio_petCO2_SE_subjs = {};
CVRratio_BOLDGM_SE_subjs = {};

for i = 1:n_subjs
    %load dwi
    MD_map = V_MD_maps{i};

    %load cvr
    petCO2_CVRBOLD_GE_map = V_petCO2_CVRBOLD_GE_maps{i};
    petCO2_CVRASL_GE_map = V_petCO2_CVRASL_GE_maps{i};
    BOLDGM_CVRBOLD_GE_map = V_BOLDGM_CVRBOLD_GE_maps{i};
    BOLDGM_CVRASL_GE_map = V_BOLDGM_CVRASL_GE_maps{i};

    petCO2_CVRBOLD_SE_map = V_petCO2_CVRBOLD_SE_maps{i};
    petCO2_CVRASL_SE_map = V_petCO2_CVRASL_SE_maps{i};
    BOLDGM_CVRBOLD_SE_map = V_BOLDGM_CVRBOLD_SE_maps{i};
    BOLDGM_CVRASL_SE_map = V_BOLDGM_CVRASL_SE_maps{i};

    %load pve
    PVE_GM_dwi_map = V_PVE_GM_dwi_maps{i};
    PVE_GM_cvr_map = V_PVE_GM_cvr_maps{i};

    %binarize
    PVE_GM_dwi_map(PVE_GM_dwi_map>0.5)=1;
    PVE_GM_dwi_map(PVE_GM_dwi_map<1)=0;   
    PVE_GM_cvr_map(PVE_GM_cvr_map>0.5)=1;
    PVE_GM_cvr_map(PVE_GM_cvr_map<1)=0; 

    % PVE_GM_dwi_map(PVE_GM_dwi_map==0)=NaN;
    % PVE_GM_cvr_map(PVE_GM_cvr_map==0)=NaN;

    %select GM

    MD_map_GM = MD_map.*PVE_GM_dwi_map;

    petCO2_CVRBOLD_GE_map_GM = petCO2_CVRBOLD_GE_map.*PVE_GM_cvr_map;
    petCO2_CVRASL_GE_map_GM = petCO2_CVRASL_GE_map.*PVE_GM_cvr_map;
    BOLDGM_CVRBOLD_GE_map_GM = BOLDGM_CVRBOLD_GE_map.*PVE_GM_cvr_map;
    BOLDGM_CVRASL_GE_map_GM = BOLDGM_CVRASL_GE_map.*PVE_GM_cvr_map;

    petCO2_CVRBOLD_SE_map_GM = petCO2_CVRBOLD_SE_map.*PVE_GM_cvr_map;
    petCO2_CVRASL_SE_map_GM = petCO2_CVRASL_SE_map.*PVE_GM_cvr_map;
    BOLDGM_CVRBOLD_SE_map_GM = BOLDGM_CVRBOLD_SE_map.*PVE_GM_cvr_map;
    BOLDGM_CVRASL_SE_map_GM = BOLDGM_CVRASL_SE_map.*PVE_GM_cvr_map;
    
    %put all zeros equal to NaN

    MD_map_GM(MD_map_GM==0)=NaN;

    petCO2_CVRBOLD_GE_map_GM(petCO2_CVRBOLD_GE_map_GM==0)=NaN;
    petCO2_CVRASL_GE_map_GM(petCO2_CVRASL_GE_map_GM==0)=NaN;
    BOLDGM_CVRBOLD_GE_map_GM(BOLDGM_CVRBOLD_GE_map_GM==0)=NaN;
    BOLDGM_CVRASL_GE_map_GM(BOLDGM_CVRASL_GE_map_GM==0)=NaN;

    petCO2_CVRBOLD_SE_map_GM(petCO2_CVRBOLD_SE_map_GM==0)=NaN;
    petCO2_CVRASL_SE_map_GM(petCO2_CVRASL_SE_map_GM==0)=NaN;
    BOLDGM_CVRBOLD_SE_map_GM(BOLDGM_CVRBOLD_SE_map_GM==0)=NaN;
    BOLDGM_CVRASL_SE_map_GM(BOLDGM_CVRASL_SE_map_GM==0)=NaN;

    %ratio
    CVRratio_petCO2_GE = petCO2_CVRBOLD_GE_map_GM./petCO2_CVRASL_GE_map_GM;
    CVRratio_BOLDGM_GE = BOLDGM_CVRBOLD_GE_map_GM./BOLDGM_CVRASL_GE_map_GM;

    CVRratio_petCO2_SE = petCO2_CVRBOLD_SE_map_GM./petCO2_CVRASL_SE_map_GM;
    CVRratio_BOLDGM_SE = BOLDGM_CVRBOLD_SE_map_GM./BOLDGM_CVRASL_SE_map_GM;

    %append results

    MD_map_GM_subjs{end+1} = MD_map_GM;
    petCO2_CVRBOLD_GE_map_GM_subjs{end+1} = petCO2_CVRBOLD_GE_map_GM;
    petCO2_CVRASL_GE_map_GM_subjs{end+1} = petCO2_CVRASL_GE_map_GM;
    BOLDGM_CVRBOLD_GE_map_GM_subjs{end+1} = BOLDGM_CVRBOLD_GE_map_GM;
    BOLDGM_CVRASL_GE_map_GM_subjs{end+1} = BOLDGM_CVRASL_GE_map_GM;
    
    petCO2_CVRBOLD_SE_map_GM_subjs{end+1} = petCO2_CVRBOLD_SE_map_GM;
    petCO2_CVRASL_SE_map_GM_subjs{end+1} = petCO2_CVRASL_SE_map_GM;
    BOLDGM_CVRBOLD_SE_map_GM_subjs{end+1} = BOLDGM_CVRBOLD_SE_map_GM;
    BOLDGM_CVRASL_SE_map_GM_subjs{end+1}= BOLDGM_CVRASL_SE_map_GM;

    CVRratio_petCO2_GE_subjs{end+1} = CVRratio_petCO2_GE;
    CVRratio_BOLDGM_GE_subjs{end+1} = CVRratio_BOLDGM_GE;

    CVRratio_petCO2_SE_subjs{end+1} = CVRratio_petCO2_SE;
    CVRratio_BOLDGM_SE_subjs{end+1} = CVRratio_BOLDGM_SE;
end


%% computing medians across voxels (in the tissue of interest)

%dwi
all_MD_map_GM_subjs = cat(4,MD_map_GM_subjs{:});
median_MD_map_GM_subjs = nanmedian(all_MD_map_GM_subjs,4);

%cvr

%GE
all_petCO2_CVRBOLD_GE_map_GM_subjs = cat(4,petCO2_CVRBOLD_GE_map_GM_subjs{:});
median_petCO2_CVRBOLD_GE_map_GM_subjs = nanmedian(all_petCO2_CVRBOLD_GE_map_GM_subjs,4);

all_petCO2_CVRASL_GE_map_GM_subjs = cat(4,petCO2_CVRASL_GE_map_GM_subjs{:});
median_petCO2_CVRASL_GE_map_GM_subjs = nanmedian(all_petCO2_CVRASL_GE_map_GM_subjs,4);

all_BOLDGM_CVRBOLD_GE_map_GM_subjs = cat(4,BOLDGM_CVRBOLD_GE_map_GM_subjs{:});
median_BOLDGM_CVRBOLD_GE_map_GM_subjs = nanmedian(all_BOLDGM_CVRBOLD_GE_map_GM_subjs,4);

all_BOLDGM_CVRASL_GE_map_GM_subjs = cat(4,BOLDGM_CVRASL_GE_map_GM_subjs{:});
median_BOLDGM_CVRASL_GE_map_GM_subjs = nanmedian(all_BOLDGM_CVRASL_GE_map_GM_subjs,4);

%SE
all_petCO2_CVRBOLD_SE_map_GM_subjs = cat(4,petCO2_CVRBOLD_SE_map_GM_subjs{:});
median_petCO2_CVRBOLD_SE_map_GM_subjs = nanmedian(all_petCO2_CVRBOLD_SE_map_GM_subjs,4);

all_petCO2_CVRASL_SE_map_GM_subjs = cat(4,petCO2_CVRASL_SE_map_GM_subjs{:});
median_petCO2_CVRASL_SE_map_GM_subjs = nanmedian(all_petCO2_CVRASL_SE_map_GM_subjs,4);

all_BOLDGM_CVRBOLD_SE_map_GM_subjs = cat(4,BOLDGM_CVRBOLD_SE_map_GM_subjs{:});
median_BOLDGM_CVRBOLD_SE_map_GM_subjs = nanmedian(all_BOLDGM_CVRBOLD_SE_map_GM_subjs,4);

all_BOLDGM_CVRASL_SE_map_GM_subjs = cat(4,BOLDGM_CVRASL_SE_map_GM_subjs{:});
median_BOLDGM_CVRASL_SE_map_GM_subjs = nanmedian(all_BOLDGM_CVRASL_SE_map_GM_subjs,4);

%ratio
all_CVRratio_petCO2_GE_subjs = cat(4,CVRratio_petCO2_GE_subjs{:});
median_CVRratio_petCO2_GE_subjs = nanmedian(all_CVRratio_petCO2_GE_subjs,4);

all_CVRratio_BOLDGM_GE_subjs = cat(4,CVRratio_BOLDGM_GE_subjs{:});
median_CVRratio_BOLDGM_GE_subjs = nanmedian(all_CVRratio_BOLDGM_GE_subjs,4);

all_CVRratio_petCO2_SE_subjs = cat(4,CVRratio_petCO2_SE_subjs{:});
median_CVRratio_petCO2_SE_subjs = nanmedian(all_CVRratio_petCO2_SE_subjs,4);

all_CVRratio_BOLDGM_SE_subjs = cat(4,CVRratio_BOLDGM_SE_subjs{:});
median_CVRratio_BOLDGM_SE_subjs = nanmedian(all_CVRratio_BOLDGM_SE_subjs,4);

%% WHOLE maps
dim=size(median_MD_map_GM_subjs);


%% MD

all_MD_maps=cat(4,V_MD_maps{:});
median_MD_map=nanmedian(all_MD_maps,4);

figure, 
imagesc(rot90(median_MD_map(:,:,round(dim(3)/2))))
title('Mean Diffusivity')
colormap(gray)
clim([0,0.0009])


%% GE signal

all_petCO2_CVRBOLD_GE_maps=cat(4,V_petCO2_CVRBOLD_GE_maps{:});
median_petCO2_CVRBOLD_GE_map=nanmedian(all_petCO2_CVRBOLD_GE_maps,4);

all_BOLDGM_CVRBOLD_GE_maps=cat(4,V_BOLDGM_CVRBOLD_GE_maps{:});
median_BOLDGM_CVRBOLD_GE_map=nanmedian(all_BOLDGM_CVRBOLD_GE_maps,4);

all_petCO2_CVRASL_GE_maps=cat(4,V_petCO2_CVRASL_GE_maps{:});
median_petCO2_CVRASL_GE_map=nanmedian(all_petCO2_CVRASL_GE_maps,4);

all_BOLDGM_CVRASL_GE_maps=cat(4,V_BOLDGM_CVRASL_GE_maps{:});
median_BOLDGM_CVRASL_GE_map=nanmedian(all_BOLDGM_CVRASL_GE_maps,4);


figure, 
ax1=subplot(2,2,1);
imagesc(rot90(median_petCO2_CVRBOLD_GE_map(:,:,round(dim(3)/2))))
title('CVR BOLD,regPetCO2')
clim([0,0.003])

ax2=subplot(2,2,2);
imagesc(rot90(median_BOLDGM_CVRBOLD_GE_map(:,:,round(dim(3)/2))))
title('CVR BOLD, BOLDGM')
clim([0,0.008])

ax3=subplot(2,2,3);
imagesc(rot90(median_petCO2_CVRASL_GE_map(:,:,round(dim(3)/2))))
title('CVR ASL,regPetCO2')
clim([0,0.09])

ax4=subplot(2,2,4);
imagesc(rot90(median_BOLDGM_CVRASL_GE_map(:,:,round(dim(3)/2))))
title('CVR ASL, BOLDGM')
clim([0,0.3])

sgtitle('CVR, Gradient Echo Signal','FontWeight','bold')

%% SE signal

all_petCO2_CVRBOLD_SE_maps=cat(4,V_petCO2_CVRBOLD_SE_maps{:});
median_petCO2_CVRBOLD_SE_map=nanmedian(all_petCO2_CVRBOLD_SE_maps,4);

all_BOLDGM_CVRBOLD_SE_maps=cat(4,V_BOLDGM_CVRBOLD_SE_maps{:});
median_BOLDGM_CVRBOLD_SE_map=nanmedian(all_BOLDGM_CVRBOLD_SE_maps,4);

all_petCO2_CVRASL_SE_maps=cat(4,V_petCO2_CVRASL_SE_maps{:});
median_petCO2_CVRASL_SE_map=nanmedian(all_petCO2_CVRASL_SE_maps,4);

all_BOLDGM_CVRASL_SE_maps=cat(4,V_BOLDGM_CVRASL_SE_maps{:});
median_BOLDGM_CVRASL_SE_map=nanmedian(all_BOLDGM_CVRASL_SE_maps,4);


figure, 
ax1=subplot(2,2,1);
imagesc(rot90(median_petCO2_CVRBOLD_SE_map(:,:,round(dim(3)/2))))
title('CVR BOLD,regPetCO2')
clim([0,0.0015])

ax2=subplot(2,2,2);
imagesc(rot90(median_BOLDGM_CVRBOLD_SE_map(:,:,round(dim(3)/2))))
title('CVR BOLD, BOLDGM')
clim([0,0.004])

ax3=subplot(2,2,3);
imagesc(rot90(median_petCO2_CVRASL_SE_map(:,:,round(dim(3)/2))))
title('CVR ASL,regPetCO2')
clim([0,0.09])

ax4=subplot(2,2,4);
imagesc(rot90(median_BOLDGM_CVRASL_SE_map(:,:,round(dim(3)/2))))
title('CVR ASL, BOLDGM')
clim([0,0.3])

sgtitle('CVR, Spin Echo Signal','FontWeight','bold')

%% ratio CVR_BOLD/CVR_ASL

median_CVRratio_petCO2_GE_map=median_petCO2_CVRBOLD_GE_map./median_petCO2_CVRASL_GE_map;
median_CVRratio_BOLDGM_GE_map=median_BOLDGM_CVRBOLD_GE_map./median_BOLDGM_CVRASL_GE_map;
median_CVRratio_petCO2_SE_map=median_petCO2_CVRBOLD_SE_map./median_petCO2_CVRASL_SE_map;
median_CVRratio_BOLDGM_SE_map=median_BOLDGM_CVRBOLD_SE_map./median_BOLDGM_CVRASL_SE_map;

figure,
ax1 = subplot(2,2,1);
imagesc(rot90(median_CVRratio_petCO2_GE_map(:,:,round(dim(3)/2))));
title('regPetCO2');
subtitle('Gradient Echo','FontWeight','bold');
clim([0,0.08])

ax2 = subplot(2,2,2);
imagesc(rot90(median_CVRratio_BOLDGM_GE_map(:,:,round(dim(3)/2))));
title('BOLD GM');
subtitle('Gradient Echo','FontWeight','bold');
clim([0,0.08])

ax3 = subplot(2,2,3);
imagesc(rot90(median_CVRratio_petCO2_SE_map(:,:,round(dim(3)/2))));
title('Spin Echo');
clim([0,0.04])

ax4 = subplot(2,2,4);
imagesc(rot90(median_CVRratio_BOLDGM_SE_map(:,:,round(dim(3)/2))));
title('Spin Echo');
clim([0,0.04])

sgtitle('CVR ratio','FontWeight','bold')



%% calculate correlation coefficients (without outliers removal)

%cvr GE regPetCO2
[r_MDvsCVRBOLDGEPETCO2,p_MDvsCVRBOLDGEPETCO2]=corrcoef(median_MD_map_GM_subjs(:),median_petCO2_CVRBOLD_GE_map_GM_subjs(:),'rows','complete');
[r_MDvsCVRASLGEPETCO2,p_MDvsCVRASLGEPETCO2]=corrcoef(median_MD_map_GM_subjs(:),median_petCO2_CVRASL_GE_map_GM_subjs(:),'rows','complete');
%cvr GE regBOLDGM
[r_MDvsCVRBOLDGEBOLDGM,p_MDvsCVRBOLDGEBOLDGM]=corrcoef(median_MD_map_GM_subjs(:),median_BOLDGM_CVRBOLD_GE_map_GM_subjs(:),'rows','complete');
[r_MDvsCVRASLGEBOLDGM,p_MDvsCVRASLGEBOLDGM]=corrcoef(median_MD_map_GM_subjs(:),median_BOLDGM_CVRASL_GE_map_GM_subjs(:),'rows','complete');

%cvr SE regPetCO2
[r_MDvsCVRBOLDSEPETCO2,p_MDvsCVRBOLDSEPETCO2]=corrcoef(median_MD_map_GM_subjs(:),median_petCO2_CVRBOLD_SE_map_GM_subjs(:),'rows','complete');
[r_MDvsCVRASLSEPETCO2,p_MDvsCVRASLSEPETCO2]=corrcoef(median_MD_map_GM_subjs(:),median_petCO2_CVRASL_SE_map_GM_subjs(:),'rows','complete');
%cvr SE regBOLDGM
[r_MDvsCVRBOLDSEBOLDGM,p_MDvsCVRBOLDSEBOLDGM]=corrcoef(median_MD_map_GM_subjs(:),median_BOLDGM_CVRBOLD_SE_map_GM_subjs(:),'rows','complete');
[r_MDvsCVRASLSEBOLDGM,p_MDvsCVRASLSEBOLDGM]=corrcoef(median_MD_map_GM_subjs(:),median_BOLDGM_CVRASL_SE_map_GM_subjs(:),'rows','complete');

%cvr ratio GE regPetCO2
[r_MDvsCVRratioGEPETCO2,p_MDvsCVRratioGEPETCO2]=corrcoef(median_MD_map_GM_subjs(:),median_CVRratio_petCO2_GE_subjs(:),'rows','complete');
%cvr ratio GE BOLDGM
[r_MDvsCVRratioGEBOLDGM,p_MDvsCVRratioGEBOLDGM]=corrcoef(median_MD_map_GM_subjs(:),median_CVRratio_BOLDGM_GE_subjs(:),'rows','complete');
%cvr ratio SE regPetCo2
[r_MDvsCVRratioSEPETCO2,p_MDvsCVRratioSEPETCO2]=corrcoef(median_MD_map_GM_subjs(:),median_CVRratio_PETCO2_SE_subjs(:),'rows','complete');
%cvr ratio SE BOLDGM
[r_MDvsCVRratioSEBOLDGM,p_MDvsCVRratioSEBOLDGM]=corrcoef(median_MD_map_GM_subjs(:),median_CVRratio_BOLDGM_SE_subjs(:),'rows','complete');



%% Remove outliers and plot resulting maps

dim=size(median_MD_map_GM_subjs);
low_prc = 5;
high_prc = 70;

%% CVR ratio CVR_BOLD/CVR_ASL

%CVR GE

prcLOW_MD = prctile(median_CVRratio_petCO2_GE_subjs(:),low_prc);
prcHIGH_MD = prctile(median_CVRratio_petCO2_GE_subjs(:),high_prc);
median_CVRratio_petCO2_GE_subjs(median_CVRratio_petCO2_GE_subjs<prcLOW_MD | median_CVRratio_petCO2_GE_subjs>prcHIGH_MD)=NaN;

figure,
imagesc(rot90(median_CVRratio_petCO2_GE_subjs(:,:,round(dim(3)/2))))
%caxis([0,0.001])
title('CVR GE, PetCO2')

prcLOW_MD = prctile(median_CVRratio_BOLDGM_GE_subjs(:),low_prc);
prcHIGH_MD = prctile(median_CVRratio_BOLDGM_GE_subjs(:),high_prc);
median_CVRratio_BOLDGM_GE_subjs(median_CVRratio_BOLDGM_GE_subjs<prcLOW_MD | median_CVRratio_BOLDGM_GE_subjs>prcHIGH_MD)=NaN;

figure,
imagesc(rot90(median_CVRratio_BOLDGM_GE_subjs(:,:,round(dim(3)/2))))
%caxis([0,0.001])
title('CVR GE, BOLDGM')

% CVR SE 

prcLOW_MD = prctile(median_CVRratio_petCO2_SE_subjs(:),low_prc);
prcHIGH_MD = prctile(median_CVRratio_petCO2_SE_subjs(:),high_prc);
median_CVRratio_petCO2_SE_subjs(median_CVRratio_petCO2_SE_subjs<prcLOW_MD | median_CVRratio_petCO2_SE_subjs>prcHIGH_MD)=NaN;

figure,
imagesc(rot90(median_CVRratio_petCO2_SE_subjs(:,:,round(dim(3)/2))))
%caxis([0,0.001])
title('CVR SE, PetCO2')

prcLOW_MD = prctile(median_CVRratio_BOLDGM_SE_subjs(:),low_prc);
prcHIGH_MD = prctile(median_CVRratio_BOLDGM_SE_subjs(:),high_prc);
median_CVRratio_BOLDGM_SE_subjs(median_CVRratio_BOLDGM_SE_subjs<prcLOW_MD | median_CVRratio_BOLDGM_SE_subjs>prcHIGH_MD)=NaN;

figure,
imagesc(rot90(median_CVRratio_BOLDGM_SE_subjs(:,:,round(dim(3)/2))))
%caxis([0,0.001])
title('CVR SE, BOLDGM')




%% MD
prcLOW_MD = prctile(median_MD_map_GM_subjs(:),low_prc);
prcHIGH_MD = prctile(median_MD_map_GM_subjs(:),high_prc);
median_MD_map_GM_subjs(median_MD_map_GM_subjs<prcLOW_MD | median_MD_map_GM_subjs>prcHIGH_MD)=NaN;

figure,
imagesc(rot90(median_MD_map_GM_subjs(:,:,round(dim(3)/2))))
%caxis([0,0.001])
title('Mean Diffusivity Map')

%% CVR GE

prcLOW = prctile(median_petCO2_CVRBOLD_GE_map_GM_subjs(:),low_prc);
prcHIGH = prctile(median_petCO2_CVRBOLD_GE_map_GM_subjs(:),high_prc);
median_petCO2_CVRBOLD_GE_map_GM_subjs(median_petCO2_CVRBOLD_GE_map_GM_subjs<prcLOW | median_petCO2_CVRBOLD_GE_map_GM_subjs>prcHIGH)=NaN;

figure,
imagesc(rot90(median_petCO2_CVRBOLD_GE_map_GM_subjs(:,:,round(dim(3)/2))))
title('CVR GE BOLD, regPETCO2')


prcLOW = prctile(median_petCO2_CVRASL_GE_map_GM_subjs(:),low_prc);
prcHIGH = prctile(median_petCO2_CVRASL_GE_map_GM_subjs(:),high_prc);
median_petCO2_CVRASL_GE_map_GM_subjs(median_petCO2_CVRASL_GE_map_GM_subjs<prcLOW | median_petCO2_CVRASL_GE_map_GM_subjs>prcHIGH)=NaN;

figure,
imagesc(rot90(median_petCO2_CVRASL_GE_map_GM_subjs(:,:,round(dim(3)/2))))
title('CVR GE ASL, regPETCO2')

prcLOW = prctile(median_BOLDGM_CVRBOLD_GE_map_GM_subjs(:),low_prc);
prcHIGH = prctile(median_BOLDGM_CVRBOLD_GE_map_GM_subjs(:),high_prc);
median_BOLDGM_CVRBOLD_GE_map_GM_subjs(median_BOLDGM_CVRBOLD_GE_map_GM_subjs<prcLOW | median_BOLDGM_CVRBOLD_GE_map_GM_subjs>prcHIGH)=NaN;

figure,
imagesc(rot90(median_BOLDGM_CVRBOLD_GE_map_GM_subjs(:,:,round(dim(3)/2))))
title('CVR GE BOLD, regBOLD')

prcLOW = prctile(median_BOLDGM_CVRASL_GE_map_GM_subjs(:),low_prc);
prcHIGH = prctile(median_BOLDGM_CVRASL_GE_map_GM_subjs(:),high_prc);
median_BOLDGM_CVRASL_GE_map_GM_subjs(median_BOLDGM_CVRASL_GE_map_GM_subjs<prcLOW | median_BOLDGM_CVRASL_GE_map_GM_subjs>prcHIGH)=NaN;

figure,
imagesc(rot90(median_BOLDGM_CVRASL_GE_map_GM_subjs(:,:,round(dim(3)/2))))
title('CVR GE ASL, regBOLD')

%% CVR SE

prcLOW = prctile(median_petCO2_CVRBOLD_SE_map_GM_subjs(:),low_prc);
prcHIGH = prctile(median_petCO2_CVRBOLD_SE_map_GM_subjs(:),high_prc);
median_petCO2_CVRBOLD_SE_map_GM_subjs(median_petCO2_CVRBOLD_SE_map_GM_subjs<prcLOW | median_petCO2_CVRBOLD_SE_map_GM_subjs>prcHIGH)=NaN;

figure,
imagesc(rot90(median_petCO2_CVRBOLD_SE_map_GM_subjs(:,:,round(dim(3)/2))))
title('CVR SE BOLD, regPETCO2')

prcLOW = prctile(median_petCO2_CVRASL_SE_map_GM_subjs(:),low_prc);
prcHIGH = prctile(median_petCO2_CVRASL_SE_map_GM_subjs(:),high_prc);
median_petCO2_CVRASL_SE_map_GM_subjs(median_petCO2_CVRASL_SE_map_GM_subjs<prcLOW | median_petCO2_CVRASL_SE_map_GM_subjs>prcHIGH)=NaN;

figure,
imagesc(rot90(median_petCO2_CVRASL_SE_map_GM_subjs(:,:,round(dim(3)/2))))
title('CVR SE ASL, regPETCO2')

prcLOW = prctile(median_BOLDGM_CVRBOLD_SE_map_GM_subjs(:),low_prc);
prcHIGH = prctile(median_BOLDGM_CVRBOLD_SE_map_GM_subjs(:),high_prc);
median_BOLDGM_CVRBOLD_SE_map_GM_subjs(median_BOLDGM_CVRBOLD_SE_map_GM_subjs<prcLOW | median_BOLDGM_CVRBOLD_SE_map_GM_subjs>prcHIGH)=NaN;

figure,
imagesc(rot90(median_BOLDGM_CVRBOLD_SE_map_GM_subjs(:,:,round(dim(3)/2))))
title('CVR SE BOLD, regBOLD')

prcLOW = prctile(median_BOLDGM_CVRASL_SE_map_GM_subjs(:),low_prc);
prcHIGH = prctile(median_BOLDGM_CVRASL_SE_map_GM_subjs(:),high_prc);
median_BOLDGM_CVRASL_SE_map_GM_subjs(median_BOLDGM_CVRASL_SE_map_GM_subjs<prcLOW | median_BOLDGM_CVRASL_SE_map_GM_subjs>prcHIGH)=NaN;

figure,
imagesc(rot90(median_BOLDGM_CVRASL_SE_map_GM_subjs(:,:,round(dim(3)/2))))
title('CVR SE ASL, regBOLD')

%% calculate correlation coefficients (after outliers removal)

%cvr GE regPetCO2
[r_MDvsCVRBOLDGEPETCO2,p_MDvsCVRBOLDGEPETCO2]=corrcoef(median_MD_map_GM_subjs(:),median_petCO2_CVRBOLD_GE_map_GM_subjs(:),'rows','complete');
[r_MDvsCVRASLGEPETCO2,p_MDvsCVRASLGEPETCO2]=corrcoef(median_MD_map_GM_subjs(:),median_petCO2_CVRASL_GE_map_GM_subjs(:),'rows','complete');
%cvr GE regBOLDGM
[r_MDvsCVRBOLDGEBOLDGM,p_MDvsCVRBOLDGEBOLDGM]=corrcoef(median_MD_map_GM_subjs(:),median_BOLDGM_CVRBOLD_GE_map_GM_subjs(:),'rows','complete');
[r_MDvsCVRASLGEBOLDGM,p_MDvsCVRASLGEBOLDGM]=corrcoef(median_MD_map_GM_subjs(:),median_BOLDGM_CVRASL_GE_map_GM_subjs(:),'rows','complete');

%cvr SE regPetCO2
[r_MDvsCVRBOLDSEPETCO2,p_MDvsCVRBOLDSEPETCO2]=corrcoef(median_MD_map_GM_subjs(:),median_petCO2_CVRBOLD_SE_map_GM_subjs(:),'rows','complete');
[r_MDvsCVRASLSEPETCO2,p_MDvsCVRASLSEPETCO2]=corrcoef(median_MD_map_GM_subjs(:),median_petCO2_CVRASL_SE_map_GM_subjs(:),'rows','complete');
%cvr SE regBOLDGM
[r_MDvsCVRBOLDSEBOLDGM,p_MDvsCVRBOLDSEBOLDGM]=corrcoef(median_MD_map_GM_subjs(:),median_BOLDGM_CVRBOLD_SE_map_GM_subjs(:),'rows','complete');
[r_MDvsCVRASLSEBOLDGM,p_MDvsCVRASLSEBOLDGM]=corrcoef(median_MD_map_GM_subjs(:),median_BOLDGM_CVRASL_SE_map_GM_subjs(:),'rows','complete');

%cvr ratio GE regPetCO2
[r_MDvsCVRratioGEPETCO2,p_MDvsCVRratioGEPETCO2]=corrcoef(median_MD_map_GM_subjs(:),median_CVRratio_petCO2_GE_subjs(:),'rows','complete');
%cvr ratio GE BOLDGM
[r_MDvsCVRratioGEBOLDGM,p_MDvsCVRratioGEBOLDGM]=corrcoef(median_MD_map_GM_subjs(:),median_CVRratio_BOLDGM_GE_subjs(:),'rows','complete');
%cvr ratio SE regPetCo2
[r_MDvsCVRratioSEPETCO2,p_MDvsCVRratioSEPETCO2]=corrcoef(median_MD_map_GM_subjs(:),median_CVRratio_petCO2_SE_subjs(:),'rows','complete');
%cvr ratio SE BOLDGM
[r_MDvsCVRratioSEBOLDGM,p_MDvsCVRratioSEBOLDGM]=corrcoef(median_MD_map_GM_subjs(:),median_CVRratio_BOLDGM_SE_subjs(:),'rows','complete');

%% distributions

%% ratio CVR_BOLD/CVR_ASL

figure,
ax1=subplot(2,2,1);
histogram(median_CVRratio_petCO2_GE_subjs)
title('CVR GE, regPetCO2','FontWeight','bold')


ax2=subplot(2,2,2);
histogram(median_CVRratio_BOLDGM_GE_subjs)
title('CVR GE, regBOLDGM','FontWeight','bold')

ax3=subplot(2,2,3);
histogram(median_CVRratio_petCO2_SE_subjs)
title('CVR SE, regPetCO2','FontWeight','bold')


ax4=subplot(2,2,4);
histogram(median_CVRratio_BOLDGM_SE_subjs)
title('CVR SE, regBOLDGM','FontWeight','bold')

sgtitle('CVR ratio distributions','FontWeight','bold')
%% MD

figure,
histogram(median_MD_map_GM_subjs)
title('Mean Diffusivity')

%% GE signal

figure,
ax1=subplot(2,2,1);
histogram(median_petCO2_CVRBOLD_GE_map_GM_subjs)
title('CVR GE BOLD, regPetCO2','FontWeight','bold')


ax2=subplot(2,2,2);
histogram(median_BOLDGM_CVRBOLD_GE_map_GM_subjs)
title('CVR GE BOLD, regBOLDGM','FontWeight','bold')

ax3=subplot(2,2,3);
histogram(median_petCO2_CVRASL_GE_map_GM_subjs)
title('CVR GE ASL, regPetCO2','FontWeight','bold')


ax4=subplot(2,2,4);
histogram(median_BOLDGM_CVRASL_GE_map_GM_subjs)
title('CVR GE ASL, regBOLDGM','FontWeight','bold')

%% SE signal

figure,
ax1=subplot(2,2,1);
histogram(median_petCO2_CVRBOLD_SE_map_GM_subjs)
title('CVR SE BOLD, regPetCO2','FontWeight','bold')


ax2=subplot(2,2,2);
histogram(median_BOLDGM_CVRBOLD_SE_map_GM_subjs)
title('CVR SE BOLD, regBOLDGM','FontWeight','bold')

ax3=subplot(2,2,3);
histogram(median_petCO2_CVRASL_SE_map_GM_subjs)
title('CVR SE ASL, regPetCO2','FontWeight','bold')


ax4=subplot(2,2,4);
histogram(median_BOLDGM_CVRASL_SE_map_GM_subjs)
title('CVR SE ASL, regBOLDGM','FontWeight','bold')

%% Correlation barplot (after outliers removal)

corr_coefficients = cat(1,r_MDvsCVRBOLDGEBOLDGM(1,2),r_MDvsCVRASLGEBOLDGM(1,2),r_MDvsCVRBOLDGEPETCO2(1,2),r_MDvsCVRASLGEPETCO2(1,2),r_MDvsCVRBOLDSEBOLDGM(1,2),r_MDvsCVRASLSEBOLDGM(1,2),r_MDvsCVRBOLDSEPETCO2(1,2),r_MDvsCVRASLSEPETCO2(1,2));

figure,
bar(corr_coefficients)
ylabel('correlation coefficient value','FontWeight','bold')
ylim([-0.1,0.3])
title('CVR versus Mean Diffusivity')
xticklabels({'CVRBOLD GE BOLDGM','CVRASL GE BOLDGM','CVRBOLD GE PETCO2','CVRASL GE PETCO2','CVRBOLD SE BOLDGM','CVRASL SE BOLDGM','CVRBOLD SE PETCO2','CVRASL SE PETCO2'});
grid on

%% ratio CVR_BOLD/CVR_ASL

corr_coefficients = cat(1,r_MDvsCVRratioGEPETCO2(1,2),r_MDvsCVRratioGEBOLDGM(1,2),r_MDvsCVRratioSEPETCO2(1,2),r_MDvsCVRratioSEBOLDGM(1,2));

figure,
bar(corr_coefficients)
ylabel('correlation coefficient value','FontWeight','bold')
title('CVR versus Mean Diffusivity')
xticklabels({'CVRratio GE PETCO2','CVRratio GE BOLDGM','CVRratio SE PETCO2','CVRratio SE BOLDGM'});
grid on


%% scatterplots MD vs CVR GE

figure,
scatter(median_MD_map_GM_subjs(:),median_petCO2_CVRBOLD_GE_map_GM_subjs(:))
xlabel('Mean Diffusivity map','FontWeight','bold')
ylabel('CVR GE BOLD, regPetCO2','FontWeight','bold')

figure,
scatter(median_MD_map_GM_subjs(:),median_petCO2_CVRASL_GE_map_GM_subjs(:))
xlabel('Mean Diffusivity map','FontWeight','bold')
ylabel('CVR GE ASL, regPetCO2','FontWeight','bold')

figure,
scatter(median_MD_map_GM_subjs(:),median_BOLDGM_CVRBOLD_GE_map_GM_subjs(:))
xlabel('Mean Diffusivity map','FontWeight','bold')
ylabel('CVR GE BOLD, regBOLDGM','FontWeight','bold')

figure,
scatter(median_MD_map_GM_subjs(:),median_BOLDGM_CVRASL_GE_map_GM_subjs(:))
xlabel('Mean Diffusivity map','FontWeight','bold')
ylabel('CVR GE ASL, regBOLDGM','FontWeight','bold')

%% histogram 2d MD vs CVR GE

r_MDvsCVRBOLDGEBOLDGM_str=num2str(round(r_MDvsCVRBOLDGEBOLDGM(1,2),2));
r_MDvsCVRASLGEBOLDGM_str=num2str(round(r_MDvsCVRASLGEBOLDGM(1,2),3));
r_MDvsCVRBOLDGEPETCO2_str=num2str(round(r_MDvsCVRBOLDGEPETCO2(1,2),2));
r_MDvsCVRASLGEPETCO2_str=num2str(round(r_MDvsCVRASLGEPETCO2(1,2),2));

figure,
ax1=subplot(2,2,1);
histogram2(median_MD_map_GM_subjs(:),median_petCO2_CVRBOLD_GE_map_GM_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR BOLD','FontWeight','bold')
title('PetCO2')
if p_MDvsCVRBOLDGEPETCO2(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRBOLDGEPETCO2(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRBOLDGEPETCO2(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,'*'),'FontWeight','bold');
else
    title(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,''),'FontWeight','bold');     
end

ax2=subplot(2,2,2);
histogram2(median_MD_map_GM_subjs(:),median_BOLDGM_CVRBOLD_GE_map_GM_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR BOLD','FontWeight','bold')
title('BOLDGM')
if p_MDvsCVRBOLDGEBOLDGM(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRBOLDGEBOLDGM(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRBOLDGEBOLDGM(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'*'),'FontWeight','bold');
else
    title(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,''),'FontWeight','bold');  
end

ax3=subplot(2,2,3);
histogram2(median_MD_map_GM_subjs(:),median_petCO2_CVRASL_GE_map_GM_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR ASL','FontWeight','bold')

if p_MDvsCVRASLGEPETCO2(1,2)<0.001
    title(strcat('r=',r_MDvsCVRASLGEPETCO2_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRASLGEPETCO2(1,2)<0.01
    title(strcat('r=',r_MDvsCVRASLGEPETCO2_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRASLGEPETCO2(1,2)<0.05
    title(strcat('r=',r_MDvsCVRASLGEPETCO2_str,'*'),'FontWeight','bold');
else
    title(strcat('r=',r_MDvsCVRASLGEPETCO2_str,''),'FontWeight','bold');    
end

ax4=subplot(2,2,4);
histogram2(median_MD_map_GM_subjs(:),median_BOLDGM_CVRASL_GE_map_GM_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR ASL','FontWeight','bold')

if p_MDvsCVRASLGEBOLDGM(1,2)<0.001
    title(strcat('r=',r_MDvsCVRASLGEBOLDGM_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRASLGEBOLDGM(1,2)<0.01
    title(strcat('r=',r_MDvsCVRASLGEBOLDGM_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRASLGEBOLDGM(1,2)<0.05
    title(strcat('r=',r_MDvsCVRASLGEBOLDGM_str,'*'),'FontWeight','bold');
else
    title(strcat('r=',r_MDvsCVRASLGEBOLDGM_str,''),'FontWeight','bold');
end

sgtitle('CVR Gradient Echo Signal vs MD','FontWeight','bold')

%% scatterplots MD vs CVR SE
%SE signal
figure,
scatter(median_MD_map_GM_subjs(:),median_petCO2_CVRBOLD_SE_map_GM_subjs(:))
xlabel('Mean Diffusivity map','FontWeight','bold')
ylabel('CVR SE BOLD, regPetCO2','FontWeight','bold')

figure,
scatter(median_MD_map_GM_subjs(:),median_petCO2_CVRASL_SE_map_GM_subjs(:))
xlabel('Mean Diffusivity map','FontWeight','bold')
ylabel('CVR SE ASL, regPetCO2','FontWeight','bold')

figure,
scatter(median_MD_map_GM_subjs(:),median_BOLDGM_CVRBOLD_SE_map_GM_subjs(:))
xlabel('Mean Diffusivity map','FontWeight','bold')
ylabel('CVR SE BOLD, regBOLDGM','FontWeight','bold')

figure,
scatter(median_MD_map_GM_subjs(:),median_BOLDGM_CVRASL_SE_map_GM_subjs(:))
xlabel('Mean Diffusivity map','FontWeight','bold')
ylabel('CVR SE ASL, regBOLDGM','FontWeight','bold')

%% 2d histogram MD vs CVR SE

r_MDvsCVRBOLDSEBOLDGM_str=num2str(round(r_MDvsCVRBOLDSEBOLDGM(1,2),2));
r_MDvsCVRASLSEBOLDGM_str=num2str(round(r_MDvsCVRASLSEBOLDGM(1,2),2));
r_MDvsCVRBOLDSEPETCO2_str=num2str(round(r_MDvsCVRBOLDSEPETCO2(1,2),2));
r_MDvsCVRASLSEPETCO2_str=num2str(round(r_MDvsCVRASLSEPETCO2(1,2),2));

figure,
ax1=subplot(2,2,1);
histogram2(median_petCO2_CVRBOLD_SE_map_GM_subjs(:),median_MD_map_GM_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR BOLD','FontWeight','bold')
title('PetCO2')
if p_MDvsCVRBOLDSEPETCO2(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRBOLDSEPETCO2(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRBOLDGEPETCO2(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,'*'),'FontWeight','bold');
else
    title(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,''),'FontWeight','bold');
end

ax3=subplot(2,2,3);
histogram2(median_petCO2_CVRASL_SE_map_GM_subjs(:),median_MD_map_GM_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR ASL','FontWeight','bold')
if p_MDvsCVRASLSEPETCO2(1,2)<0.001
    title(strcat('r=',r_MDvsCVRASLSEPETCO2_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRASLSEPETCO2(1,2)<0.01
    title(strcat('r=',r_MDvsCVRASLSEPETCO2_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRASLSEPETCO2(1,2)<0.05
    title(strcat('r=',r_MDvsCVRASLSEPETCO2_str,'*'),'FontWeight','bold');
else
    title(strcat('r=',r_MDvsCVRASLSEPETCO2_str,''),'FontWeight','bold');
end


ax2=subplot(2,2,2);
histogram2(median_BOLDGM_CVRBOLD_SE_map_GM_subjs(:),median_MD_map_GM_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR BOLD','FontWeight','bold')
title('BOLDGM')
if p_MDvsCVRBOLDSEBOLDGM(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRBOLDSEBOLDGM(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRBOLDSEBOLDGM(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'*'),'FontWeight','bold');
else
    title(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,''),'FontWeight','bold');
end

ax4=subplot(2,2,4);
histogram2(median_BOLDGM_CVRASL_SE_map_GM_subjs(:),median_MD_map_GM_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR ASL','FontWeight','bold')
if p_MDvsCVRASLSEBOLDGM(1,2)<0.001
    title(strcat('r=',r_MDvsCVRASLSEBOLDGM_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRASLSEBOLDGM(1,2)<0.01
    title(strcat('r=',r_MDvsCVRASLSEBOLDGM_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRASLSEBOLDGM(1,2)<0.05
    title(strcat('r=',r_MDvsCVRASLSEBOLDGM_str,'*'),'FontWeight','bold');
else
    title(strcat('r=',r_MDvsCVRASLSEBOLDGM_str,''),'FontWeight','bold');
end


sgtitle('CVR Spin Echo Signal vs MD','FontWeight','bold')

%% histogram 2d ratio CVR_BOLD/CVR_ASL

r_MDvsCVRratioGEPETCO2_str=num2str(round(r_MDvsCVRratioGEPETCO2(1,2),2));
r_MDvsCVRratioGEBOLDGM_str=num2str(round(r_MDvsCVRratioGEBOLDGM(1,2),2));
r_MDvsCVRratioSEPETCO2_str=num2str(round(r_MDvsCVRratioSEPETCO2(1,2),2));
r_MDvsCVRratioSEBOLDGM_str=num2str(round(r_MDvsCVRratioSEBOLDGM(1,2),2));

figure,
ax1=subplot(2,2,1);
histogram2(median_CVRratio_petCO2_GE_subjs(:),median_MD_map_GM_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR GE','FontWeight','bold')
title('PetCO2')
if p_MDvsCVRratioGEPETCO2(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRratioGEPETCO2_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRratioGEPETCO2(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRratioGEPETCO2_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRratioGEPETCO2(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRratioGEPETCO2_str,'*'),'FontWeight','bold');
else
    title(strcat('r=',r_MDvsCVRratioGEPETCO2_str,''),'FontWeight','bold');   
end

ax3=subplot(2,2,3);
histogram2(median_CVRratio_petCO2_SE_subjs(:),median_MD_map_GM_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR SE','FontWeight','bold')
if p_MDvsCVRratioSEPETCO2(1,2)<0.001
    title(strcat('r=',r_MDvsCVRratioSEPETCO2_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRratioSEPETCO2(1,2)<0.01
    title(strcat('r=',r_MDvsCVRratioSEPETCO2_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRratioSEPETCO2(1,2)<0.05
    title(strcat('r=',r_MDvsCVRratioSEPETCO2_str,'*'),'FontWeight','bold');
else
    title(strcat('r=',r_MDvsCVRratioSEPETCO2_str,''),'FontWeight','bold');
end


ax2=subplot(2,2,2);
histogram2(median_CVRratio_BOLDGM_GE_subjs(:),median_MD_map_GM_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR GE','FontWeight','bold')
title('BOLDGM')
if p_MDvsCVRratioGEBOLDGM(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRratioGEBOLDGM_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRratioGEBOLDGM(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRratioGEBOLDGM_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRratioGEBOLDGM(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRratioGEBOLDGM_str,'*'),'FontWeight','bold');
else
    title(strcat('r=',r_MDvsCVRratioGEBOLDGM_str,''),'FontWeight','bold');
end

ax4=subplot(2,2,4);
histogram2(median_CVRratio_BOLDGM_SE_subjs(:),median_MD_map_GM_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR SE','FontWeight','bold')
if p_MDvsCVRratioSEBOLDGM(1,2)<0.001
    title(strcat('r=',r_MDvsCVRratioSEBOLDGM_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRratioSEBOLDGM(1,2)<0.01
    title(strcat('r=',r_MDvsCVRratioSEBOLDGM_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRratioSEBOLDGM(1,2)<0.05
    title(strcat('r=',r_MDvsCVRratioSEBOLDGM_str,'*'),'FontWeight','bold');
else
    title(strcat('r=',r_MDvsCVRratioSEBOLDGM_str,''),'FontWeight','bold');
end


sgtitle('CVR Ratio vs MD','FontWeight','bold')




