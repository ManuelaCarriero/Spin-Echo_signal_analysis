%% PREPARING DATA

%% choose path (it varies according to the computer you are working with)
%path = '/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/CVR';% cubric %move
%folder outside
%path = '/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/DTI';% cubric

path = '/media/nas_rete/Work_manuela/DEXIGESEDiffProject/SUBJ2MNI'; % itab
% path = '/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI';

tissue = 'GM'; %WM



%% read subjects file

subjects_cvr = importdata(strcat(path,'/subjects_CVR.txt'));
subjects_dwi = importdata(strcat(path,'/subjects_DWI.txt'));

n_subjs = length(subjects_dwi);%=subjects_cvr

%% load parametric images

%DWI

V_MD_maps={};

for i = 1:n_subjs         
    subj = subjects_dwi(i);
    subj=subj{1};

    img_path_MD=strcat(strcat(path,'/DTI/',subj,'_data_dwi_dti_MD_2MNI2mm.nii.gz'));

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

    img_path_petCO2_CVRBOLD_GE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_BOLD_regPETCO2_BOLDCVR2MNI2mm.nii.gz');
    img_path_petCO2_CVRASL_GE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_BOLD_regPETCO2_CVR2MNI2mm.nii.gz');
    img_path_BOLDGM_CVRBOLD_GE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_BOLD_regBOLDGM_BOLDCVR2MNI2mm.nii.gz');
    img_path_BOLDGM_CVRASL_GE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_BOLD_regBOLDGM_CVR2MNI2mm.nii.gz');

    img_path_petCO2_CVRBOLD_SE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_SEBOLD_regPETCO2_BOLDCVR2MNI2mm.nii.gz');
    img_path_petCO2_CVRASL_SE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_SEBOLD_regPETCO2_CVR2MNI2mm.nii.gz');
    img_path_BOLDGM_CVRBOLD_SE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_SEBOLD_regBOLDGM_BOLDCVR2MNI2mm.nii.gz');
    img_path_BOLDGM_CVRASL_SE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_SEBOLD_regBOLDGM_CVR2MNI2mm.nii.gz');

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

if strcmp(tissue,'GM')
    PVE_number = 1;
    PVE_str = num2str(PVE_number);
end

V_PVE_tissue_dwi_maps={};

for i = 1:n_subjs         
    subj = subjects_dwi(i);
    subj=subj{1};

    img_path_PVE_tissue_dwi=strcat(path,'/PVE/',subj,'_t1_mp2rage_sag_p3_iso_fast_UNI_brain_pve_',PVE_str,'_2MNI2mm.nii.gz');

    V_vol_PVE_tissue_dwi = spm_vol(img_path_PVE_tissue_dwi);
    V_PVE_tissue_dwi=spm_read_vols(V_vol_PVE_tissue_dwi);
    V_PVE_tissue_dwi_maps{end+1}=V_PVE_tissue_dwi;
end

% create two variables for each space in case you want different thresholds
% of pve maps.

V_PVE_tissue_cvr_maps=V_PVE_tissue_dwi_maps;

% for i = 1:n_subjs         
%     subj = subjects_cvr(i);
%     subj=subj{1};
% 
%     img_path_PVE_tissue_cvr=strcat(path,'/PVE/',subj,'_t1_mp2rage_sag_p3_iso_fast_UNI_brain_pve_1_2MNI2mm.nii.gz');
% 
%     V_vol_PVE_tissue_cvr = spm_vol(img_path_PVE_tissue_cvr);
%     V_PVE_tissue_cvr=spm_read_vols(V_vol_PVE_tissue_cvr);
%     V_PVE_tissue_cvr_maps{end+1}=V_PVE_tissue_cvr;
% end




%% PROCESSING
%multiply maps by the GM map
%save all vectorized maps in one variable
%compute the MEDIAN across voxels
%compute correlation coefficient




MD_map_tissue_subjs = {};
petCO2_CVRBOLD_GE_map_tissue_subjs = {};
petCO2_CVRASL_GE_map_tissue_subjs = {};
BOLDGM_CVRBOLD_GE_map_tissue_subjs = {};
BOLDGM_CVRASL_GE_map_tissue_subjs = {};

petCO2_CVRBOLD_SE_map_tissue_subjs = {};
petCO2_CVRASL_SE_map_tissue_subjs = {};
BOLDGM_CVRBOLD_SE_map_tissue_subjs = {};
BOLDGM_CVRASL_SE_map_tissue_subjs = {};

CVRratio_BOLDGM_tissue_subjs = {};
CVRratio_petCO2_tissue_subjs = {};

CVRratio_GMmedian_regBOLDGM_subjs = [];
CVRratio_GMmedian_regPETCO2_subjs = [];

CVRBOLD_GE_GMmedian_regBOLDGM_subjs = [];
CVRBOLD_SE_GMmedian_regBOLDGM_subjs = [];
CVRBOLD_GE_GMmedian_regPetCO2_subjs = [];
CVRBOLD_SE_GMmedian_regPetCO2_subjs = [];

MD_map_GMmedian_subjs = [];

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
    PVE_tissue_dwi_map = V_PVE_tissue_dwi_maps{i};
    PVE_tissue_cvr_map = V_PVE_tissue_cvr_maps{i};

    %binarize
    PVE_tissue_dwi_map(PVE_tissue_dwi_map>0.5)=1;
    PVE_tissue_dwi_map(PVE_tissue_dwi_map<1)=0;   
    PVE_tissue_cvr_map(PVE_tissue_cvr_map>0.5)=1;
    PVE_tissue_cvr_map(PVE_tissue_cvr_map<1)=0; 

    % PVE_tissue_dwi_map(PVE_tissue_dwi_map==0)=NaN;
    % PVE_tissue_cvr_map(PVE_tissue_cvr_map==0)=NaN;

    %select GM

    MD_map_GM = MD_map.*PVE_tissue_dwi_map;

    petCO2_CVRBOLD_GE_map_GM = petCO2_CVRBOLD_GE_map.*PVE_tissue_cvr_map;
    petCO2_CVRASL_GE_map_GM = petCO2_CVRASL_GE_map.*PVE_tissue_cvr_map;
    BOLDGM_CVRBOLD_GE_map_GM = BOLDGM_CVRBOLD_GE_map.*PVE_tissue_cvr_map;
    BOLDGM_CVRASL_GE_map_GM = BOLDGM_CVRASL_GE_map.*PVE_tissue_cvr_map;

    petCO2_CVRBOLD_SE_map_GM = petCO2_CVRBOLD_SE_map.*PVE_tissue_cvr_map;
    petCO2_CVRASL_SE_map_GM = petCO2_CVRASL_SE_map.*PVE_tissue_cvr_map;
    BOLDGM_CVRBOLD_SE_map_GM = BOLDGM_CVRBOLD_SE_map.*PVE_tissue_cvr_map;
    BOLDGM_CVRASL_SE_map_GM = BOLDGM_CVRASL_SE_map.*PVE_tissue_cvr_map;
    
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

    %ratio CVR_BOLD/CVR_ASL
    CVRratio_petCO2_GE = petCO2_CVRBOLD_GE_map_GM./petCO2_CVRASL_GE_map_GM;
    CVRratio_BOLDGM_GE = BOLDGM_CVRBOLD_GE_map_GM./BOLDGM_CVRASL_GE_map_GM;

    CVRratio_petCO2_SE = petCO2_CVRBOLD_SE_map_GM./petCO2_CVRASL_SE_map_GM;
    CVRratio_BOLDGM_SE = BOLDGM_CVRBOLD_SE_map_GM./BOLDGM_CVRASL_SE_map_GM;

    %ratio CVR_BOLDSE/CVR_BOLDGE 
    CVRratio_BOLDGM = BOLDGM_CVRBOLD_SE_map_GM./BOLDGM_CVRBOLD_GE_map_GM;
    CVRratio_petCO2 = petCO2_CVRBOLD_SE_map_GM./petCO2_CVRBOLD_GE_map_GM;

    %across subjects

    MD_GMmedian_subj = nanmedian(MD_map_GM(:));

    CVRBOLD_GE_GMmedian_regBOLDGM_subj = nanmedian(BOLDGM_CVRBOLD_GE_map_GM(:));
    CVRBOLD_SE_GMmedian_regBOLDGM_subj = nanmedian(BOLDGM_CVRBOLD_SE_map_GM(:));
    CVRBOLD_GE_GMmedian_regPetCO2_subj = nanmedian(petCO2_CVRBOLD_GE_map_GM(:));
    CVRBOLD_SE_GMmedian_regPetCO2_subj = nanmedian(petCO2_CVRBOLD_SE_map_GM(:));

    CVRratio_GMmedian_regBOLDGM_subj = nanmedian(CVRratio_BOLDGM(:));
    CVRratio_GMmedian_regPETCO2_subj = nanmedian(CVRratio_petCO2(:));
    
    %append results for across subjects' variability analysis

    MD_map_GMmedian_subjs(end+1) = MD_GMmedian_subj;

    CVRBOLD_GE_GMmedian_regBOLDGM_subjs(end+1) = CVRBOLD_GE_GMmedian_regBOLDGM_subj;
    CVRBOLD_SE_GMmedian_regBOLDGM_subjs(end+1) = CVRBOLD_SE_GMmedian_regBOLDGM_subj;

    CVRratio_GMmedian_regBOLDGM_subjs(end+1) = CVRratio_GMmedian_regBOLDGM_subj;
    CVRratio_GMmedian_regPETCO2_subjs(end+1) = CVRratio_GMmedian_regPETCO2_subj;
    CVRBOLD_GE_GMmedian_regPetCO2_subjs(end+1) = CVRBOLD_GE_GMmedian_regPetCO2_subj;
    CVRBOLD_SE_GMmedian_regPetCO2_subjs(end+1) = CVRBOLD_SE_GMmedian_regPetCO2_subj;
  
    %append results for voxel wise analysis

    MD_map_tissue_subjs{end+1} = MD_map_GM;
    petCO2_CVRBOLD_GE_map_tissue_subjs{end+1} = petCO2_CVRBOLD_GE_map_GM;
    petCO2_CVRASL_GE_map_tissue_subjs{end+1} = petCO2_CVRASL_GE_map_GM;
    BOLDGM_CVRBOLD_GE_map_tissue_subjs{end+1} = BOLDGM_CVRBOLD_GE_map_GM;
    BOLDGM_CVRASL_GE_map_tissue_subjs{end+1} = BOLDGM_CVRASL_GE_map_GM;
    
    petCO2_CVRBOLD_SE_map_tissue_subjs{end+1} = petCO2_CVRBOLD_SE_map_GM;
    petCO2_CVRASL_SE_map_tissue_subjs{end+1} = petCO2_CVRASL_SE_map_GM;
    BOLDGM_CVRBOLD_SE_map_tissue_subjs{end+1} = BOLDGM_CVRBOLD_SE_map_GM;
    BOLDGM_CVRASL_SE_map_tissue_subjs{end+1}= BOLDGM_CVRASL_SE_map_GM;

    CVRratio_petCO2_GE_subjs{end+1} = CVRratio_petCO2_GE;
    CVRratio_BOLDGM_GE_subjs{end+1} = CVRratio_BOLDGM_GE;

    CVRratio_petCO2_SE_subjs{end+1} = CVRratio_petCO2_SE;
    CVRratio_BOLDGM_SE_subjs{end+1} = CVRratio_BOLDGM_SE;

    CVRratio_BOLDGM_tissue_subjs{end+1} = CVRratio_BOLDGM;
    CVRratio_petCO2_tissue_subjs{end+1} = CVRratio_petCO2;

end




%% computing medians across voxels (in the tissue of interest)

%dwi
all_MD_map_tissue_subjs = cat(4,MD_map_tissue_subjs{:});
median_MD_map_tissue_subjs = nanmedian(all_MD_map_tissue_subjs,4);

%cvr

%GE
all_petCO2_CVRBOLD_GE_map_tissue_subjs = cat(4,petCO2_CVRBOLD_GE_map_tissue_subjs{:});
median_petCO2_CVRBOLD_GE_map_tissue_subjs = nanmedian(all_petCO2_CVRBOLD_GE_map_tissue_subjs,4);

all_petCO2_CVRASL_GE_map_tissue_subjs = cat(4,petCO2_CVRASL_GE_map_tissue_subjs{:});
median_petCO2_CVRASL_GE_map_tissue_subjs = nanmedian(all_petCO2_CVRASL_GE_map_tissue_subjs,4);

all_BOLDGM_CVRBOLD_GE_map_tissue_subjs = cat(4,BOLDGM_CVRBOLD_GE_map_tissue_subjs{:});
median_BOLDGM_CVRBOLD_GE_map_tissue_subjs = nanmedian(all_BOLDGM_CVRBOLD_GE_map_tissue_subjs,4);

all_BOLDGM_CVRASL_GE_map_tissue_subjs = cat(4,BOLDGM_CVRASL_GE_map_tissue_subjs{:});
median_BOLDGM_CVRASL_GE_map_tissue_subjs = nanmedian(all_BOLDGM_CVRASL_GE_map_tissue_subjs,4);

%SE
all_petCO2_CVRBOLD_SE_map_tissue_subjs = cat(4,petCO2_CVRBOLD_SE_map_tissue_subjs{:});
median_petCO2_CVRBOLD_SE_map_tissue_subjs = nanmedian(all_petCO2_CVRBOLD_SE_map_tissue_subjs,4);

all_petCO2_CVRASL_SE_map_tissue_subjs = cat(4,petCO2_CVRASL_SE_map_tissue_subjs{:});
median_petCO2_CVRASL_SE_map_tissue_subjs = nanmedian(all_petCO2_CVRASL_SE_map_tissue_subjs,4);

all_BOLDGM_CVRBOLD_SE_map_tissue_subjs = cat(4,BOLDGM_CVRBOLD_SE_map_tissue_subjs{:});
median_BOLDGM_CVRBOLD_SE_map_tissue_subjs = nanmedian(all_BOLDGM_CVRBOLD_SE_map_tissue_subjs,4);

all_BOLDGM_CVRASL_SE_map_tissue_subjs = cat(4,BOLDGM_CVRASL_SE_map_tissue_subjs{:});
median_BOLDGM_CVRASL_SE_map_tissue_subjs = nanmedian(all_BOLDGM_CVRASL_SE_map_tissue_subjs,4);

%ratio
all_CVRratio_petCO2_GE_subjs = cat(4,CVRratio_petCO2_GE_subjs{:});
median_CVRratio_petCO2_GE_subjs = nanmedian(all_CVRratio_petCO2_GE_subjs,4);

all_CVRratio_BOLDGM_GE_subjs = cat(4,CVRratio_BOLDGM_GE_subjs{:});
median_CVRratio_BOLDGM_GE_subjs = nanmedian(all_CVRratio_BOLDGM_GE_subjs,4);

all_CVRratio_petCO2_SE_subjs = cat(4,CVRratio_petCO2_SE_subjs{:});
median_CVRratio_petCO2_SE_subjs = nanmedian(all_CVRratio_petCO2_SE_subjs,4);

all_CVRratio_BOLDGM_SE_subjs = cat(4,CVRratio_BOLDGM_SE_subjs{:});
median_CVRratio_BOLDGM_SE_subjs = nanmedian(all_CVRratio_BOLDGM_SE_subjs,4);

%ratio CVRSE/CVRGE

all_CVRratio_BOLDGM_tissue_subjs = cat(4,CVRratio_BOLDGM_tissue_subjs{:});
median_CVRratio_BOLDGM_tissue_subjs = nanmedian(all_CVRratio_BOLDGM_tissue_subjs,4);

all_CVRratio_petCO2_tissue_subjs = cat(4,CVRratio_petCO2_tissue_subjs{:});
median_CVRratio_petCO2_tissue_subjs = nanmedian(all_CVRratio_petCO2_tissue_subjs,4);



%% WHOLE maps

dim=size(median_MD_map_tissue_subjs);


%% MD

all_MD_maps=cat(4,V_MD_maps{:});
median_MD_map=nanmedian(all_MD_maps,4);

figure, 
imagesc(rot90(median_MD_map(:,:,round(dim(3)/2))))
title('Mean Diffusivity')
colormap(gray)
clim([0,0.0009])

figure, 
imagesc(rot90(median_MD_map_tissue_subjs(:,:,round(dim(3)/2))))
title('Mean Diffusivity')
colormap(gray)
clim([0,0.0009])



%% GE signal
% 
% all_petCO2_CVRBOLD_GE_maps=cat(4,V_petCO2_CVRBOLD_GE_maps{:});
% median_petCO2_CVRBOLD_GE_map=nanmedian(all_petCO2_CVRBOLD_GE_maps,4);
% 
% all_BOLDGM_CVRBOLD_GE_maps=cat(4,V_BOLDGM_CVRBOLD_GE_maps{:});
% median_BOLDGM_CVRBOLD_GE_map=nanmedian(all_BOLDGM_CVRBOLD_GE_maps,4);
% 
% all_petCO2_CVRASL_GE_maps=cat(4,V_petCO2_CVRASL_GE_maps{:});
% median_petCO2_CVRASL_GE_map=nanmedian(all_petCO2_CVRASL_GE_maps,4);
% 
% all_BOLDGM_CVRASL_GE_maps=cat(4,V_BOLDGM_CVRASL_GE_maps{:});
% median_BOLDGM_CVRASL_GE_map=nanmedian(all_BOLDGM_CVRASL_GE_maps,4);
% 
% 
% figure, 
% ax1=subplot(2,2,1);
% imagesc(rot90(median_petCO2_CVRBOLD_GE_map(:,:,round(dim(3)/2))))
% title('CVR BOLD,regPetCO2')
% clim([0,0.003])
% 
% ax2=subplot(2,2,2);
% imagesc(rot90(median_BOLDGM_CVRBOLD_GE_map(:,:,round(dim(3)/2))))
% title('CVR BOLD, BOLDGM')
% clim([0,0.008])
% 
% ax3=subplot(2,2,3);
% imagesc(rot90(median_petCO2_CVRASL_GE_map(:,:,round(dim(3)/2))))
% title('CVR ASL,regPetCO2')
% clim([0,0.09])
% 
% ax4=subplot(2,2,4);
% imagesc(rot90(median_BOLDGM_CVRASL_GE_map(:,:,round(dim(3)/2))))
% title('CVR ASL, BOLDGM')
% clim([0,0.3])
% 
% sgtitle('CVR, Gradient Echo Signal','FontWeight','bold')
% 
%% SE signal
% 
% all_petCO2_CVRBOLD_SE_maps=cat(4,V_petCO2_CVRBOLD_SE_maps{:});
% median_petCO2_CVRBOLD_SE_map=nanmedian(all_petCO2_CVRBOLD_SE_maps,4);
% 
% all_BOLDGM_CVRBOLD_SE_maps=cat(4,V_BOLDGM_CVRBOLD_SE_maps{:});
% median_BOLDGM_CVRBOLD_SE_map=nanmedian(all_BOLDGM_CVRBOLD_SE_maps,4);
% 
% all_petCO2_CVRASL_SE_maps=cat(4,V_petCO2_CVRASL_SE_maps{:});
% median_petCO2_CVRASL_SE_map=nanmedian(all_petCO2_CVRASL_SE_maps,4);
% 
% all_BOLDGM_CVRASL_SE_maps=cat(4,V_BOLDGM_CVRASL_SE_maps{:});
% median_BOLDGM_CVRASL_SE_map=nanmedian(all_BOLDGM_CVRASL_SE_maps,4);
% 
% 
% figure, 
% ax1=subplot(2,2,1);
% imagesc(rot90(median_petCO2_CVRBOLD_SE_map(:,:,round(dim(3)/2))))
% title('CVR BOLD,regPetCO2')
% clim([0,0.0015])
% 
% ax2=subplot(2,2,2);
% imagesc(rot90(median_BOLDGM_CVRBOLD_SE_map(:,:,round(dim(3)/2))))
% title('CVR BOLD, BOLDGM')
% clim([0,0.004])
% 
% ax3=subplot(2,2,3);
% imagesc(rot90(median_petCO2_CVRASL_SE_map(:,:,round(dim(3)/2))))
% title('CVR ASL,regPetCO2')
% clim([0,0.09])
% 
% ax4=subplot(2,2,4);
% imagesc(rot90(median_BOLDGM_CVRASL_SE_map(:,:,round(dim(3)/2))))
% title('CVR ASL, BOLDGM')
% clim([0,0.3])
% 
% sgtitle('CVR, Spin Echo Signal','FontWeight','bold')


%% GE and SE signal

all_petCO2_CVRBOLD_GE_maps=cat(4,V_petCO2_CVRBOLD_GE_maps{:});
median_petCO2_CVRBOLD_GE_map=nanmedian(all_petCO2_CVRBOLD_GE_maps,4);

all_BOLDGM_CVRBOLD_GE_maps=cat(4,V_BOLDGM_CVRBOLD_GE_maps{:});
median_BOLDGM_CVRBOLD_GE_map=nanmedian(all_BOLDGM_CVRBOLD_GE_maps,4);

all_petCO2_CVRBOLD_SE_maps=cat(4,V_petCO2_CVRBOLD_SE_maps{:});
median_petCO2_CVRBOLD_SE_map=nanmedian(all_petCO2_CVRBOLD_SE_maps,4);

all_BOLDGM_CVRBOLD_SE_maps=cat(4,V_BOLDGM_CVRBOLD_SE_maps{:});
median_BOLDGM_CVRBOLD_SE_map=nanmedian(all_BOLDGM_CVRBOLD_SE_maps,4);



figure, 
ax1=subplot(2,2,1);
imagesc(rot90(median_petCO2_CVRBOLD_GE_map(:,:,round(dim(3)/2))))
title('CVR BOLD,regPetCO2')
subtitle('Gradient Echo')
clim([0,0.003])

ax2=subplot(2,2,2);
imagesc(rot90(median_BOLDGM_CVRBOLD_GE_map(:,:,round(dim(3)/2))))
title('CVR BOLD, BOLDGM')
subtitle('Gradient Echo')
clim([0,0.008])

ax3=subplot(2,2,3);
imagesc(rot90(median_petCO2_CVRBOLD_SE_map(:,:,round(dim(3)/2))))
title('CVR BOLD,regPetCO2')
subtitle('Spin Echo')
clim([0,0.0015])

ax4=subplot(2,2,4);
imagesc(rot90(median_BOLDGM_CVRBOLD_SE_map(:,:,round(dim(3)/2))))
title('CVR BOLD, BOLDGM')
subtitle('Spin Echo')
clim([0,0.004])


sgtitle('CVR','FontWeight','bold')

%% ratio CVR_BOLD/CVR_ASL

% median_CVRratio_petCO2_GE_map=median_petCO2_CVRBOLD_GE_map./median_petCO2_CVRASL_GE_map;
% median_CVRratio_BOLDGM_GE_map=median_BOLDGM_CVRBOLD_GE_map./median_BOLDGM_CVRASL_GE_map;
% median_CVRratio_petCO2_SE_map=median_petCO2_CVRBOLD_SE_map./median_petCO2_CVRASL_SE_map;
% median_CVRratio_BOLDGM_SE_map=median_BOLDGM_CVRBOLD_SE_map./median_BOLDGM_CVRASL_SE_map;
% 
% figure,
% ax1 = subplot(2,2,1);
% imagesc(rot90(median_CVRratio_petCO2_GE_map(:,:,round(dim(3)/2))));
% title('regPetCO2');
% subtitle('Gradient Echo','FontWeight','bold');
% clim([0,0.08])
% 
% ax2 = subplot(2,2,2);
% imagesc(rot90(median_CVRratio_BOLDGM_GE_map(:,:,round(dim(3)/2))));
% title('BOLD GM');
% subtitle('Gradient Echo','FontWeight','bold');
% clim([0,0.08])
% 
% ax3 = subplot(2,2,3);
% imagesc(rot90(median_CVRratio_petCO2_SE_map(:,:,round(dim(3)/2))));
% title('Spin Echo');
% clim([0,0.04])
% 
% ax4 = subplot(2,2,4);
% imagesc(rot90(median_CVRratio_BOLDGM_SE_map(:,:,round(dim(3)/2))));
% title('Spin Echo');
% clim([0,0.04])
% 
% sgtitle('CVR ratio','FontWeight','bold')

%% CVR ratio (whole brain)

median_CVRratio_petCO2_map=median_petCO2_CVRBOLD_SE_map./median_petCO2_CVRBOLD_GE_map;
median_CVRratio_BOLDGM_map=median_BOLDGM_CVRBOLD_SE_map./median_BOLDGM_CVRBOLD_GE_map;

figure,
ax1 = subplot(1,2,1);
imagesc(rot90(median_CVRratio_petCO2_map(:,:,round(dim(3)/2))));
title('regPetCO2');
% subtitle('CVRratio','FontWeight','bold');
clim([0,0.9])

ax2 = subplot(1,2,2);
imagesc(rot90(median_CVRratio_BOLDGM_map(:,:,round(dim(3)/2))));
title('BOLD GM');
% subtitle('CVRratio','FontWeight','bold');
clim([0,0.9])

sgtitle('CVR ratio','FontWeight','bold')

%% CVR ratio GM 

figure,
ax1 = subplot(1,2,1);
imagesc(rot90(median_CVRratio_petCO2_tissue_subjs(:,:,round(dim(3)/2))));
title('regressor PetCO2');
% subtitle('CVRratio','FontWeight','bold');
clim([0,0.9])

ax2 = subplot(1,2,2);
imagesc(rot90(median_CVRratio_BOLDGM_tissue_subjs(:,:,round(dim(3)/2))));
title('regressor BOLDGM');
% subtitle('CVRratio','FontWeight','bold');
clim([0,0.9])

sgtitle('CVR ratio (Grey Matter, PVE>0.5)','FontWeight','bold')

%ATTENTION: 
% values inside GM are not perfectly equal to values inside GM
% of the whole brain map. Probably median across subjects is not only across
% subjects' voxels. You should check the distributions of values 
% inside GM of the method I (mask every subject, calculate ratio and 
% calculate median across subjects) vs
% method II (median across subject, calculate ratio and mask the resulting
% whole brain ratio map).

%% calculate correlation coefficients (without outliers removal)

%cvr GE regPetCO2
[r_MDvsCVRBOLDGEPETCO2,p_MDvsCVRBOLDGEPETCO2]=corrcoef(median_MD_map_tissue_subjs(:),median_petCO2_CVRBOLD_GE_map_tissue_subjs(:),'rows','complete');
% disp(strcat('regPetCO2 MD vs CVR BOLD GE',num2str(r_MDvsCVRBOLDGEPETCO2(2))))

[r_MDvsCVRASLGEPETCO2,p_MDvsCVRASLGEPETCO2]=corrcoef(median_MD_map_tissue_subjs(:),median_petCO2_CVRASL_GE_map_tissue_subjs(:),'rows','complete');
%cvr GE regBOLDGM
[r_MDvsCVRBOLDGEBOLDGM,p_MDvsCVRBOLDGEBOLDGM]=corrcoef(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_GE_map_tissue_subjs(:),'rows','complete');
[r_MDvsCVRASLGEBOLDGM,p_MDvsCVRASLGEBOLDGM]=corrcoef(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRASL_GE_map_tissue_subjs(:),'rows','complete');

%cvr SE regPetCO2
[r_MDvsCVRBOLDSEPETCO2,p_MDvsCVRBOLDSEPETCO2]=corrcoef(median_MD_map_tissue_subjs(:),median_petCO2_CVRBOLD_SE_map_tissue_subjs(:),'rows','complete');
[r_MDvsCVRASLSEPETCO2,p_MDvsCVRASLSEPETCO2]=corrcoef(median_MD_map_tissue_subjs(:),median_petCO2_CVRASL_SE_map_tissue_subjs(:),'rows','complete');
%cvr SE regBOLDGM
[r_MDvsCVRBOLDSEBOLDGM,p_MDvsCVRBOLDSEBOLDGM]=corrcoef(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_SE_map_tissue_subjs(:),'rows','complete');
[r_MDvsCVRASLSEBOLDGM,p_MDvsCVRASLSEBOLDGM]=corrcoef(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRASL_SE_map_tissue_subjs(:),'rows','complete');

%cvr ratio GE regPetCO2
[r_MDvsCVRratioGEPETCO2,p_MDvsCVRratioGEPETCO2]=corrcoef(median_MD_map_tissue_subjs(:),median_CVRratio_petCO2_GE_subjs(:),'rows','complete');
%cvr ratio GE BOLDGM
[r_MDvsCVRratioGEBOLDGM,p_MDvsCVRratioGEBOLDGM]=corrcoef(median_MD_map_tissue_subjs(:),median_CVRratio_BOLDGM_GE_subjs(:),'rows','complete');
%cvr ratio SE regPetCo2
[r_MDvsCVRratioSEPETCO2,p_MDvsCVRratioSEPETCO2]=corrcoef(median_MD_map_tissue_subjs(:),median_CVRratio_petCO2_SE_subjs(:),'rows','complete');
%cvr ratio SE BOLDGM
[r_MDvsCVRratioSEBOLDGM,p_MDvsCVRratioSEBOLDGM]=corrcoef(median_MD_map_tissue_subjs(:),median_CVRratio_BOLDGM_SE_subjs(:),'rows','complete');



%% Remove outliers and plot resulting maps

disp('%%%%%%% REMOVING OUTLIERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')

dim=size(median_MD_map_tissue_subjs);
low_prc = 5;
high_prc = 95;

%% CVR ratio CVR_BOLD/CVR_ASL

%CVR GE

prcLOW_MD = prctile(median_CVRratio_petCO2_GE_subjs(:),low_prc);
prcHIGH_MD = prctile(median_CVRratio_petCO2_GE_subjs(:),high_prc);
median_CVRratio_petCO2_GE_subjs(median_CVRratio_petCO2_GE_subjs<prcLOW_MD | median_CVRratio_petCO2_GE_subjs>prcHIGH_MD)=NaN;

% figure,
% imagesc(rot90(median_CVRratio_petCO2_GE_subjs(:,:,round(dim(3)/2))))
% %caxis([0,0.001])
% title('CVR GE, PetCO2')

prcLOW_MD = prctile(median_CVRratio_BOLDGM_GE_subjs(:),low_prc);
prcHIGH_MD = prctile(median_CVRratio_BOLDGM_GE_subjs(:),high_prc);
median_CVRratio_BOLDGM_GE_subjs(median_CVRratio_BOLDGM_GE_subjs<prcLOW_MD | median_CVRratio_BOLDGM_GE_subjs>prcHIGH_MD)=NaN;

% figure,
% imagesc(rot90(median_CVRratio_BOLDGM_GE_subjs(:,:,round(dim(3)/2))))
% %caxis([0,0.001])
% title('CVR GE, BOLDGM')

% CVR SE 

prcLOW_MD = prctile(median_CVRratio_petCO2_SE_subjs(:),low_prc);
prcHIGH_MD = prctile(median_CVRratio_petCO2_SE_subjs(:),high_prc);
median_CVRratio_petCO2_SE_subjs(median_CVRratio_petCO2_SE_subjs<prcLOW_MD | median_CVRratio_petCO2_SE_subjs>prcHIGH_MD)=NaN;

% figure,
% imagesc(rot90(median_CVRratio_petCO2_SE_subjs(:,:,round(dim(3)/2))))
% %caxis([0,0.001])
% title('CVR SE, PetCO2')

prcLOW_MD = prctile(median_CVRratio_BOLDGM_SE_subjs(:),low_prc);
prcHIGH_MD = prctile(median_CVRratio_BOLDGM_SE_subjs(:),high_prc);
median_CVRratio_BOLDGM_SE_subjs(median_CVRratio_BOLDGM_SE_subjs<prcLOW_MD | median_CVRratio_BOLDGM_SE_subjs>prcHIGH_MD)=NaN;

% figure,
% imagesc(rot90(median_CVRratio_BOLDGM_SE_subjs(:,:,round(dim(3)/2))))
% %caxis([0,0.001])
% title('CVR SE, BOLDGM')




%% MD
prcLOW_MD = prctile(median_MD_map_tissue_subjs(:),low_prc);
prcHIGH_MD = prctile(median_MD_map_tissue_subjs(:),high_prc);
median_MD_map_tissue_subjs(median_MD_map_tissue_subjs<prcLOW_MD | median_MD_map_tissue_subjs>prcHIGH_MD)=NaN;

% figure,
% imagesc(rot90(median_MD_map_tissue_subjs(:,:,round(dim(3)/2))))
% %caxis([0,0.001])
% title('Mean Diffusivity Map')

%% CVR GE

prcLOW = prctile(median_petCO2_CVRBOLD_GE_map_tissue_subjs(:),low_prc);
prcHIGH = prctile(median_petCO2_CVRBOLD_GE_map_tissue_subjs(:),high_prc);
median_petCO2_CVRBOLD_GE_map_tissue_subjs(median_petCO2_CVRBOLD_GE_map_tissue_subjs<prcLOW | median_petCO2_CVRBOLD_GE_map_tissue_subjs>prcHIGH)=NaN;

% figure,
% imagesc(rot90(median_petCO2_CVRBOLD_GE_map_tissue_subjs(:,:,round(dim(3)/2))))
% title('CVR GE BOLD, regPETCO2')


prcLOW = prctile(median_petCO2_CVRASL_GE_map_tissue_subjs(:),low_prc);
prcHIGH = prctile(median_petCO2_CVRASL_GE_map_tissue_subjs(:),high_prc);
median_petCO2_CVRASL_GE_map_tissue_subjs(median_petCO2_CVRASL_GE_map_tissue_subjs<prcLOW | median_petCO2_CVRASL_GE_map_tissue_subjs>prcHIGH)=NaN;

% figure,
% imagesc(rot90(median_petCO2_CVRASL_GE_map_tissue_subjs(:,:,round(dim(3)/2))))
% title('CVR GE ASL, regPETCO2')

prcLOW = prctile(median_BOLDGM_CVRBOLD_GE_map_tissue_subjs(:),low_prc);
prcHIGH = prctile(median_BOLDGM_CVRBOLD_GE_map_tissue_subjs(:),high_prc);
median_BOLDGM_CVRBOLD_GE_map_tissue_subjs(median_BOLDGM_CVRBOLD_GE_map_tissue_subjs<prcLOW | median_BOLDGM_CVRBOLD_GE_map_tissue_subjs>prcHIGH)=NaN;

% figure,
% imagesc(rot90(median_BOLDGM_CVRBOLD_GE_map_tissue_subjs(:,:,round(dim(3)/2))))
% title('CVR GE BOLD, regBOLD')

prcLOW = prctile(median_BOLDGM_CVRASL_GE_map_tissue_subjs(:),low_prc);
prcHIGH = prctile(median_BOLDGM_CVRASL_GE_map_tissue_subjs(:),high_prc);
median_BOLDGM_CVRASL_GE_map_tissue_subjs(median_BOLDGM_CVRASL_GE_map_tissue_subjs<prcLOW | median_BOLDGM_CVRASL_GE_map_tissue_subjs>prcHIGH)=NaN;

% figure,
% imagesc(rot90(median_BOLDGM_CVRASL_GE_map_tissue_subjs(:,:,round(dim(3)/2))))
% title('CVR GE ASL, regBOLD')

%% CVR SE

prcLOW = prctile(median_petCO2_CVRBOLD_SE_map_tissue_subjs(:),low_prc);
prcHIGH = prctile(median_petCO2_CVRBOLD_SE_map_tissue_subjs(:),high_prc);
median_petCO2_CVRBOLD_SE_map_tissue_subjs(median_petCO2_CVRBOLD_SE_map_tissue_subjs<prcLOW | median_petCO2_CVRBOLD_SE_map_tissue_subjs>prcHIGH)=NaN;

% figure,
% imagesc(rot90(median_petCO2_CVRBOLD_SE_map_tissue_subjs(:,:,round(dim(3)/2))))
% title('CVR SE BOLD, regPETCO2')

prcLOW = prctile(median_petCO2_CVRASL_SE_map_tissue_subjs(:),low_prc);
prcHIGH = prctile(median_petCO2_CVRASL_SE_map_tissue_subjs(:),high_prc);
median_petCO2_CVRASL_SE_map_tissue_subjs(median_petCO2_CVRASL_SE_map_tissue_subjs<prcLOW | median_petCO2_CVRASL_SE_map_tissue_subjs>prcHIGH)=NaN;

% figure,
% imagesc(rot90(median_petCO2_CVRASL_SE_map_tissue_subjs(:,:,round(dim(3)/2))))
% title('CVR SE ASL, regPETCO2')

prcLOW = prctile(median_BOLDGM_CVRBOLD_SE_map_tissue_subjs(:),low_prc);
prcHIGH = prctile(median_BOLDGM_CVRBOLD_SE_map_tissue_subjs(:),high_prc);
median_BOLDGM_CVRBOLD_SE_map_tissue_subjs(median_BOLDGM_CVRBOLD_SE_map_tissue_subjs<prcLOW | median_BOLDGM_CVRBOLD_SE_map_tissue_subjs>prcHIGH)=NaN;

% figure,
% imagesc(rot90(median_BOLDGM_CVRBOLD_SE_map_tissue_subjs(:,:,round(dim(3)/2))))
% title('CVR SE BOLD, regBOLD')

prcLOW = prctile(median_BOLDGM_CVRASL_SE_map_tissue_subjs(:),low_prc);
prcHIGH = prctile(median_BOLDGM_CVRASL_SE_map_tissue_subjs(:),high_prc);
median_BOLDGM_CVRASL_SE_map_tissue_subjs(median_BOLDGM_CVRASL_SE_map_tissue_subjs<prcLOW | median_BOLDGM_CVRASL_SE_map_tissue_subjs>prcHIGH)=NaN;

% figure,
% imagesc(rot90(median_BOLDGM_CVRASL_SE_map_tissue_subjs(:,:,round(dim(3)/2))))
% title('CVR SE ASL, regBOLD')

%% ratio CVR_BOLDSE/CVR_BOLDGE

prcLOW = prctile(median_CVRratio_petCO2_tissue_subjs(:),low_prc);
prcHIGH = prctile(median_CVRratio_petCO2_tissue_subjs(:),high_prc);
median_CVRratio_petCO2_tissue_subjs(median_CVRratio_petCO2_tissue_subjs<prcLOW | median_CVRratio_petCO2_tissue_subjs>prcHIGH)=NaN;


prcLOW = prctile(median_CVRratio_BOLDGM_tissue_subjs(:),low_prc);
prcHIGH = prctile(median_CVRratio_BOLDGM_tissue_subjs(:),high_prc);
median_CVRratio_BOLDGM_tissue_subjs(median_CVRratio_BOLDGM_tissue_subjs<prcLOW | median_CVRratio_BOLDGM_tissue_subjs>prcHIGH)=NaN;

%% calculate correlation coefficients (after outliers removal)

%cvr GE regPetCO2
[r_MDvsCVRBOLDGEPETCO2,p_MDvsCVRBOLDGEPETCO2]=corrcoef(median_MD_map_tissue_subjs(:),median_petCO2_CVRBOLD_GE_map_tissue_subjs(:),'rows','complete');
[r_MDvsCVRASLGEPETCO2,p_MDvsCVRASLGEPETCO2]=corrcoef(median_MD_map_tissue_subjs(:),median_petCO2_CVRASL_GE_map_tissue_subjs(:),'rows','complete');
%cvr GE regBOLDGM
[r_MDvsCVRBOLDGEBOLDGM,p_MDvsCVRBOLDGEBOLDGM]=corrcoef(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_GE_map_tissue_subjs(:),'rows','complete');
[r_MDvsCVRASLGEBOLDGM,p_MDvsCVRASLGEBOLDGM]=corrcoef(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRASL_GE_map_tissue_subjs(:),'rows','complete');

%cvr SE regPetCO2
[r_MDvsCVRBOLDSEPETCO2,p_MDvsCVRBOLDSEPETCO2]=corrcoef(median_MD_map_tissue_subjs(:),median_petCO2_CVRBOLD_SE_map_tissue_subjs(:),'rows','complete');
[r_MDvsCVRASLSEPETCO2,p_MDvsCVRASLSEPETCO2]=corrcoef(median_MD_map_tissue_subjs(:),median_petCO2_CVRASL_SE_map_tissue_subjs(:),'rows','complete');
%cvr SE regBOLDGM
[r_MDvsCVRBOLDSEBOLDGM,p_MDvsCVRBOLDSEBOLDGM]=corrcoef(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_SE_map_tissue_subjs(:),'rows','complete');
[r_MDvsCVRASLSEBOLDGM,p_MDvsCVRASLSEBOLDGM]=corrcoef(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRASL_SE_map_tissue_subjs(:),'rows','complete');

%cvr ratio GE regPetCO2
[r_MDvsCVRratioGEPETCO2,p_MDvsCVRratioGEPETCO2]=corrcoef(median_MD_map_tissue_subjs(:),median_CVRratio_petCO2_GE_subjs(:),'rows','complete');
%cvr ratio GE BOLDGM
[r_MDvsCVRratioGEBOLDGM,p_MDvsCVRratioGEBOLDGM]=corrcoef(median_MD_map_tissue_subjs(:),median_CVRratio_BOLDGM_GE_subjs(:),'rows','complete');
%cvr ratio SE regPetCo2
[r_MDvsCVRratioSEPETCO2,p_MDvsCVRratioSEPETCO2]=corrcoef(median_MD_map_tissue_subjs(:),median_CVRratio_petCO2_SE_subjs(:),'rows','complete');
%cvr ratio SE BOLDGM
[r_MDvsCVRratioSEBOLDGM,p_MDvsCVRratioSEBOLDGM]=corrcoef(median_MD_map_tissue_subjs(:),median_CVRratio_BOLDGM_SE_subjs(:),'rows','complete');

%cvr ratio CVR_BOLDSE/CVR_BOLDGE
[r_MDvsCVRratio_regBOLDGM,p_MDvsCVRratio_regBOLDGM]=corrcoef(median_MD_map_tissue_subjs(:),median_CVRratio_BOLDGM_tissue_subjs(:),'rows','complete');
[r_MDvsCVRratio_regPETCO2,p_MDvsCVRratio_regPETCO2]=corrcoef(median_MD_map_tissue_subjs(:),median_CVRratio_petCO2_tissue_subjs(:),'rows','complete');

%% distributions

%% ratio CVR_BOLD/CVR_ASL
% 
% figure,
% ax1=subplot(2,2,1);
% histogram(median_CVRratio_petCO2_GE_subjs)
% title('CVR GE, regPetCO2','FontWeight','bold')
% 
% 
% ax2=subplot(2,2,2);
% histogram(median_CVRratio_BOLDGM_GE_subjs)
% title('CVR GE, regBOLDGM','FontWeight','bold')
% 
% ax3=subplot(2,2,3);
% histogram(median_CVRratio_petCO2_SE_subjs)
% title('CVR SE, regPetCO2','FontWeight','bold')
% 
% 
% ax4=subplot(2,2,4);
% histogram(median_CVRratio_BOLDGM_SE_subjs)
% title('CVR SE, regBOLDGM','FontWeight','bold')
% 
% sgtitle('CVR ratio distributions','FontWeight','bold')

%% MD

figure,
histogram(median_MD_map_tissue_subjs)
ylabel('# of voxels','FontWeight','bold','FontSize',12)
xlabel('Mean Diffusivity (MD), mm^{2}/s','FontWeight','bold','FontSize',12)
grid on

%% GE signal

% figure,
% ax1=subplot(2,2,1);
% histogram(median_petCO2_CVRBOLD_GE_map_tissue_subjs)
% title('CVR GE BOLD, regPetCO2','FontWeight','bold')
% 
% 
% ax2=subplot(2,2,2);
% histogram(median_BOLDGM_CVRBOLD_GE_map_tissue_subjs)
% title('CVR GE BOLD, regBOLDGM','FontWeight','bold')
% 
% ax3=subplot(2,2,3);
% histogram(median_petCO2_CVRASL_GE_map_tissue_subjs)
% title('CVR GE ASL, regPetCO2','FontWeight','bold')
% 
% 
% ax4=subplot(2,2,4);
% histogram(median_BOLDGM_CVRASL_GE_map_tissue_subjs)
% title('CVR GE ASL, regBOLDGM','FontWeight','bold')

%% SE signal

% figure,
% ax1=subplot(2,2,1);
% histogram(median_petCO2_CVRBOLD_SE_map_tissue_subjs)
% title('CVR SE BOLD, regPetCO2','FontWeight','bold')
% 
% 
% ax2=subplot(2,2,2);
% histogram(median_BOLDGM_CVRBOLD_SE_map_tissue_subjs)
% title('CVR SE BOLD, regBOLDGM','FontWeight','bold')
% 
% ax3=subplot(2,2,3);
% histogram(median_petCO2_CVRASL_SE_map_tissue_subjs)
% title('CVR SE ASL, regPetCO2','FontWeight','bold')
% 
% 
% ax4=subplot(2,2,4);
% histogram(median_BOLDGM_CVRASL_SE_map_tissue_subjs)
% title('CVR SE ASL, regBOLDGM','FontWeight','bold')


%% CVR BOLD GE and SE distributions

figure,

ax1=subplot(2,2,1);
histogram(median_petCO2_CVRBOLD_GE_map_tissue_subjs)
xlabel('CVR GE BOLD','FontWeight','bold')
ylabel('# of voxels','FontWeight','bold','FontSize',12)
ylim([0,7000])
title('regPetCO2')
grid on

ax2=subplot(2,2,2);
histogram(median_BOLDGM_CVRBOLD_GE_map_tissue_subjs)
xlabel('CVR GE BOLD','FontWeight','bold')
ylabel('# of voxels','FontWeight','bold','FontSize',12)
ylim([0,7000])
title('regBOLDGM')
grid on

ax3=subplot(2,2,3);
histogram(median_petCO2_CVRBOLD_SE_map_tissue_subjs)
xlabel('CVR SE BOLD','FontWeight','bold')
ylabel('# of voxels','FontWeight','bold','FontSize',12)
ylim([0,7000])
grid on

ax4=subplot(2,2,4);
histogram(median_BOLDGM_CVRBOLD_SE_map_tissue_subjs)
xlabel('CVR SE BOLD','FontWeight','bold')
ylabel('# of voxels','FontWeight','bold','FontSize',12)
ylim([0,7000])
grid on

%% CVR BOLD GE / SE ratio distributions

figure,

ax1=subplot(1,2,1);
histogram(median_CVRratio_petCO2_tissue_subjs)
xlabel('CVR ratio, regPetCO2','FontWeight','bold')
ylabel('# of voxels','FontWeight','bold','FontSize',12)
ylim([0,4000])
grid on

ax2=subplot(1,2,2);
histogram(median_CVRratio_BOLDGM_tissue_subjs)
xlabel('CVR ratio, regBOLDGM','FontWeight','bold')
ylabel('# of voxels','FontWeight','bold','FontSize',12)
ylim([0,4000])
grid on

sgtitle('CVR ratio distributions','FontWeight','bold','FontSize',12)

%% CORR COEFFICIENT BARPLOT all CVR vs MD (after outliers removal)
% 
% corr_coefficients = cat(1,r_MDvsCVRBOLDGEBOLDGM(1,2),r_MDvsCVRASLGEBOLDGM(1,2),r_MDvsCVRBOLDGEPETCO2(1,2),r_MDvsCVRASLGEPETCO2(1,2),r_MDvsCVRBOLDSEBOLDGM(1,2),r_MDvsCVRASLSEBOLDGM(1,2),r_MDvsCVRBOLDSEPETCO2(1,2),r_MDvsCVRASLSEPETCO2(1,2));
% 
% figure,
% bar(corr_coefficients)
% ylabel('correlation coefficient value','FontWeight','bold')
% ylim([-0.1,0.3])
% title('CVR versus Mean Diffusivity')
% xticklabels({'CVRBOLD GE BOLDGM','CVRASL GE BOLDGM','CVRBOLD GE PETCO2','CVRASL GE PETCO2','CVRBOLD SE BOLDGM','CVRASL SE BOLDGM','CVRBOLD SE PETCO2','CVRASL SE PETCO2'});
% grid on

%% CORR COEFFICIENT BARPLOT ratio CVR_BOLD/CVR_ASL

% corr_coefficients = cat(1,r_MDvsCVRratioGEPETCO2(1,2),r_MDvsCVRratioGEBOLDGM(1,2),r_MDvsCVRratioSEPETCO2(1,2),r_MDvsCVRratioSEBOLDGM(1,2));
% 
% figure,
% bar(corr_coefficients)
% ylabel('correlation coefficient value','FontWeight','bold')
% title('CVR versus Mean Diffusivity')
% xticklabels({'CVRratio GE PETCO2','CVRratio GE BOLDGM','CVRratio SE PETCO2','CVRratio SE BOLDGM'});
% grid on


%% scatterplots CVR GE vs MD

% figure,
% scatter(median_MD_map_tissue_subjs(:),median_petCO2_CVRBOLD_GE_map_tissue_subjs(:))
% xlabel('Mean Diffusivity map','FontWeight','bold')
% ylabel('CVR GE BOLD, regPetCO2','FontWeight','bold')
% 
% figure,
% scatter(median_MD_map_tissue_subjs(:),median_petCO2_CVRASL_GE_map_tissue_subjs(:))
% xlabel('Mean Diffusivity map','FontWeight','bold')
% ylabel('CVR GE ASL, regPetCO2','FontWeight','bold')
% 
% figure,
% scatter(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_GE_map_tissue_subjs(:))
% xlabel('Mean Diffusivity map','FontWeight','bold')
% ylabel('CVR GE BOLD, regBOLDGM','FontWeight','bold')
% 
% figure,
% scatter(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRASL_GE_map_tissue_subjs(:))
% xlabel('Mean Diffusivity map','FontWeight','bold')
% ylabel('CVR GE ASL, regBOLDGM','FontWeight','bold')

%% histogram 2d CVR GE vs MD 

% r_MDvsCVRBOLDGEBOLDGM_str=num2str(round(r_MDvsCVRBOLDGEBOLDGM(1,2),2));
% r_MDvsCVRASLGEBOLDGM_str=num2str(round(r_MDvsCVRASLGEBOLDGM(1,2),3));
% r_MDvsCVRBOLDGEPETCO2_str=num2str(round(r_MDvsCVRBOLDGEPETCO2(1,2),2));
% r_MDvsCVRASLGEPETCO2_str=num2str(round(r_MDvsCVRASLGEPETCO2(1,2),2));
% 
% figure,
% ax1=subplot(2,2,1);
% histogram2(median_MD_map_tissue_subjs(:),median_petCO2_CVRBOLD_GE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR BOLD','FontWeight','bold')
% title('PetCO2')
% if p_MDvsCVRBOLDGEPETCO2(1,2)<0.001
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDGEPETCO2(1,2)<0.01
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDGEPETCO2(1,2)<0.05
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,'*'),'FontWeight','bold');
% else
%     title(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,''),'FontWeight','bold');     
% end
% 
% ax2=subplot(2,2,2);
% histogram2(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_GE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR BOLD','FontWeight','bold')
% title('BOLDGM')
% if p_MDvsCVRBOLDGEBOLDGM(1,2)<0.001
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDGEBOLDGM(1,2)<0.01
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDGEBOLDGM(1,2)<0.05
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'*'),'FontWeight','bold');
% else
%     title(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,''),'FontWeight','bold');  
% end
% 
% ax3=subplot(2,2,3);
% histogram2(median_MD_map_tissue_subjs(:),median_petCO2_CVRASL_GE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR ASL','FontWeight','bold')
% 
% if p_MDvsCVRASLGEPETCO2(1,2)<0.001
%     title(strcat('r=',r_MDvsCVRASLGEPETCO2_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRASLGEPETCO2(1,2)<0.01
%     title(strcat('r=',r_MDvsCVRASLGEPETCO2_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRASLGEPETCO2(1,2)<0.05
%     title(strcat('r=',r_MDvsCVRASLGEPETCO2_str,'*'),'FontWeight','bold');
% else
%     title(strcat('r=',r_MDvsCVRASLGEPETCO2_str,''),'FontWeight','bold');    
% end
% 
% ax4=subplot(2,2,4);
% histogram2(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRASL_GE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR ASL','FontWeight','bold')
% 
% if p_MDvsCVRASLGEBOLDGM(1,2)<0.001
%     title(strcat('r=',r_MDvsCVRASLGEBOLDGM_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRASLGEBOLDGM(1,2)<0.01
%     title(strcat('r=',r_MDvsCVRASLGEBOLDGM_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRASLGEBOLDGM(1,2)<0.05
%     title(strcat('r=',r_MDvsCVRASLGEBOLDGM_str,'*'),'FontWeight','bold');
% else
%     title(strcat('r=',r_MDvsCVRASLGEBOLDGM_str,''),'FontWeight','bold');
% end
% 
% sgtitle('CVR Gradient Echo Signal vs MD','FontWeight','bold')

%% scatterplots MD vs CVR SE
% %SE signal
% figure,
% scatter(median_MD_map_tissue_subjs(:),median_petCO2_CVRBOLD_SE_map_tissue_subjs(:))
% xlabel('Mean Diffusivity map','FontWeight','bold')
% ylabel('CVR SE BOLD, regPetCO2','FontWeight','bold')
% 
% figure,
% scatter(median_MD_map_tissue_subjs(:),median_petCO2_CVRASL_SE_map_tissue_subjs(:))
% xlabel('Mean Diffusivity map','FontWeight','bold')
% ylabel('CVR SE ASL, regPetCO2','FontWeight','bold')
% 
% figure,
% scatter(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_SE_map_tissue_subjs(:))
% xlabel('Mean Diffusivity map','FontWeight','bold')
% ylabel('CVR SE BOLD, regBOLDGM','FontWeight','bold')
% 
% figure,
% scatter(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRASL_SE_map_tissue_subjs(:))
% xlabel('Mean Diffusivity map','FontWeight','bold')
% ylabel('CVR SE ASL, regBOLDGM','FontWeight','bold')

%% 2d histogram CVR BOLD vs MD

r_MDvsCVRBOLDSEBOLDGM_str=num2str(round(r_MDvsCVRBOLDSEBOLDGM(1,2),2));
r_MDvsCVRBOLDSEPETCO2_str=num2str(round(r_MDvsCVRBOLDSEPETCO2(1,2),2));

r_MDvsCVRBOLDGEBOLDGM_str=num2str(round(r_MDvsCVRBOLDGEBOLDGM(1,2),2));
r_MDvsCVRBOLDGEPETCO2_str=num2str(round(r_MDvsCVRBOLDGEPETCO2(1,2),2));


figure,
ax1=subplot(2,2,1);
histogram2(median_MD_map_tissue_subjs(:),median_petCO2_CVRBOLD_GE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR BOLD GE','FontWeight','bold')
title('PetCO2')
if p_MDvsCVRBOLDGEPETCO2(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRBOLDGEPETCO2(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRBOLDGEPETCO2(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,'*'),'FontWeight','bold');
else
    subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,''),'FontWeight','bold');     
end

ax2=subplot(2,2,2);
histogram2(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_GE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR BOLD GE','FontWeight','bold')
title('BOLDGM')
if p_MDvsCVRBOLDGEBOLDGM(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRBOLDGEBOLDGM(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRBOLDGEBOLDGM(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'*'),'FontWeight','bold');
else
    subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,''),'FontWeight','bold');  
end


ax3=subplot(2,2,3);
histogram2(median_MD_map_tissue_subjs(:),median_petCO2_CVRBOLD_SE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR BOLD SE','FontWeight','bold')
title('PetCO2')
if p_MDvsCVRBOLDSEPETCO2(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRBOLDSEPETCO2(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRBOLDGEPETCO2(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,'*'),'FontWeight','bold');
else
    subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,''),'FontWeight','bold');
end




ax4=subplot(2,2,4);
histogram2(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_SE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR BOLD SE','FontWeight','bold')
title('BOLDGM')
if p_MDvsCVRBOLDSEBOLDGM(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRBOLDSEBOLDGM(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRBOLDSEBOLDGM(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'*'),'FontWeight','bold');
else
    subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,''),'FontWeight','bold');
end



%% 2d histogram all CVR SE vs MD

% r_MDvsCVRBOLDSEBOLDGM_str=num2str(round(r_MDvsCVRBOLDSEBOLDGM(1,2),2));
% r_MDvsCVRASLSEBOLDGM_str=num2str(round(r_MDvsCVRASLSEBOLDGM(1,2),2));
% r_MDvsCVRBOLDSEPETCO2_str=num2str(round(r_MDvsCVRBOLDSEPETCO2(1,2),2));
% r_MDvsCVRASLSEPETCO2_str=num2str(round(r_MDvsCVRASLSEPETCO2(1,2),2));
% 
% figure,
% ax1=subplot(2,2,1);
% histogram2(median_MD_map_tissue_subjs(:),median_petCO2_CVRBOLD_SE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR BOLD','FontWeight','bold')
% title('PetCO2')
% if p_MDvsCVRBOLDSEPETCO2(1,2)<0.001
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDSEPETCO2(1,2)<0.01
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDGEPETCO2(1,2)<0.05
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,'*'),'FontWeight','bold');
% else
%     title(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,''),'FontWeight','bold');
% end
% 
% ax3=subplot(2,2,3);
% histogram2(median_MD_map_tissue_subjs(:),median_petCO2_CVRASL_SE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR ASL','FontWeight','bold')
% if p_MDvsCVRASLSEPETCO2(1,2)<0.001
%     title(strcat('r=',r_MDvsCVRASLSEPETCO2_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRASLSEPETCO2(1,2)<0.01
%     title(strcat('r=',r_MDvsCVRASLSEPETCO2_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRASLSEPETCO2(1,2)<0.05
%     title(strcat('r=',r_MDvsCVRASLSEPETCO2_str,'*'),'FontWeight','bold');
% else
%     title(strcat('r=',r_MDvsCVRASLSEPETCO2_str,''),'FontWeight','bold');
% end
% 
% 
% ax2=subplot(2,2,2);
% histogram2(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_SE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR BOLD','FontWeight','bold')
% title('BOLDGM')
% if p_MDvsCVRBOLDSEBOLDGM(1,2)<0.001
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDSEBOLDGM(1,2)<0.01
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDSEBOLDGM(1,2)<0.05
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'*'),'FontWeight','bold');
% else
%     title(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,''),'FontWeight','bold');
% end
% 
% ax4=subplot(2,2,4);
% histogram2(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRASL_SE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR ASL','FontWeight','bold')
% if p_MDvsCVRASLSEBOLDGM(1,2)<0.001
%     title(strcat('r=',r_MDvsCVRASLSEBOLDGM_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRASLSEBOLDGM(1,2)<0.01
%     title(strcat('r=',r_MDvsCVRASLSEBOLDGM_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRASLSEBOLDGM(1,2)<0.05
%     title(strcat('r=',r_MDvsCVRASLSEBOLDGM_str,'*'),'FontWeight','bold');
% else
%     title(strcat('r=',r_MDvsCVRASLSEBOLDGM_str,''),'FontWeight','bold');
% end
% 
% 
% sgtitle('CVR Spin Echo Signal vs MD','FontWeight','bold')

 %% histogram 2d ratio CVR_BOLD/CVR_ASL
% 
% r_MDvsCVRratioGEPETCO2_str=num2str(round(r_MDvsCVRratioGEPETCO2(1,2),2));
% r_MDvsCVRratioGEBOLDGM_str=num2str(round(r_MDvsCVRratioGEBOLDGM(1,2),2));
% r_MDvsCVRratioSEPETCO2_str=num2str(round(r_MDvsCVRratioSEPETCO2(1,2),2));
% r_MDvsCVRratioSEBOLDGM_str=num2str(round(r_MDvsCVRratioSEBOLDGM(1,2),2));
% 
% figure,
% ax1=subplot(2,2,1);
% histogram2(median_MD_map_tissue_subjs(:),median_CVRratio_petCO2_GE_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR GE','FontWeight','bold')
% title('PetCO2')
% if p_MDvsCVRratioGEPETCO2(1,2)<0.001
%     subtitle(strcat('r=',r_MDvsCVRratioGEPETCO2_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRratioGEPETCO2(1,2)<0.01
%     subtitle(strcat('r=',r_MDvsCVRratioGEPETCO2_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRratioGEPETCO2(1,2)<0.05
%     subtitle(strcat('r=',r_MDvsCVRratioGEPETCO2_str,'*'),'FontWeight','bold');
% else
%     title(strcat('r=',r_MDvsCVRratioGEPETCO2_str,''),'FontWeight','bold');   
% end
% 
% ax3=subplot(2,2,3);
% histogram2(median_MD_map_tissue_subjs(:),median_CVRratio_petCO2_SE_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR SE','FontWeight','bold')
% if p_MDvsCVRratioSEPETCO2(1,2)<0.001
%     title(strcat('r=',r_MDvsCVRratioSEPETCO2_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRratioSEPETCO2(1,2)<0.01
%     title(strcat('r=',r_MDvsCVRratioSEPETCO2_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRratioSEPETCO2(1,2)<0.05
%     title(strcat('r=',r_MDvsCVRratioSEPETCO2_str,'*'),'FontWeight','bold');
% else
%     title(strcat('r=',r_MDvsCVRratioSEPETCO2_str,''),'FontWeight','bold');
% end
% 
% 
% ax2=subplot(2,2,2);
% histogram2(median_MD_map_tissue_subjs(:),median_CVRratio_BOLDGM_GE_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR GE','FontWeight','bold')
% title('BOLDGM')
% if p_MDvsCVRratioGEBOLDGM(1,2)<0.001
%     subtitle(strcat('r=',r_MDvsCVRratioGEBOLDGM_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRratioGEBOLDGM(1,2)<0.01
%     subtitle(strcat('r=',r_MDvsCVRratioGEBOLDGM_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRratioGEBOLDGM(1,2)<0.05
%     subtitle(strcat('r=',r_MDvsCVRratioGEBOLDGM_str,'*'),'FontWeight','bold');
% else
%     title(strcat('r=',r_MDvsCVRratioGEBOLDGM_str,''),'FontWeight','bold');
% end
% 
% ax4=subplot(2,2,4);
% histogram2(median_MD_map_tissue_subjs(:),median_CVRratio_BOLDGM_SE_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR SE','FontWeight','bold')
% if p_MDvsCVRratioSEBOLDGM(1,2)<0.001
%     title(strcat('r=',r_MDvsCVRratioSEBOLDGM_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRratioSEBOLDGM(1,2)<0.01
%     title(strcat('r=',r_MDvsCVRratioSEBOLDGM_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRratioSEBOLDGM(1,2)<0.05
%     title(strcat('r=',r_MDvsCVRratioSEBOLDGM_str,'*'),'FontWeight','bold');
% else
%     title(strcat('r=',r_MDvsCVRratioSEBOLDGM_str,''),'FontWeight','bold');
% end
% 
% 
% sgtitle('CVR Ratio vs MD','FontWeight','bold')



%% histogram 2d ratio CVR_BOLDSE/CVR_BOLDGE

r_MDvsCVRratio_regPetCO2_str=num2str(round(r_MDvsCVRratio_regPETCO2(1,2),2));
r_MDvsCVRratio_regBOLDGM_str=num2str(round(r_MDvsCVRratio_regBOLDGM(1,2),2));

figure,
ax1=subplot(1,2,1);
histogram2(median_MD_map_tissue_subjs(:), median_CVRratio_petCO2_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on');
xlabel('MD','FontWeight','bold')
ylabel('CVR ratio','FontWeight','bold')
title('reg PetCO2')
if p_MDvsCVRratioGEPETCO2(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRratio_regPetCO2_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRratioGEPETCO2(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRratio_regPetCO2_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRratioGEPETCO2(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRratio_regPetCO2_str,'*'),'FontWeight','bold');
else
    subtitle(strcat('r=',r_MDvsCVRratio_regPetCO2_str,''),'FontWeight','bold');   
end

ax2=subplot(1,2,2);
histogram2(median_MD_map_tissue_subjs(:), median_CVRratio_BOLDGM_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
xlabel('MD','FontWeight','bold')
ylabel('CVR ratio','FontWeight','bold')
title('reg BOLDGM')
if p_MDvsCVRratioGEBOLDGM(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRratio_regBOLDGM_str,'***'),'FontWeight','bold');
elseif p_MDvsCVRratioGEBOLDGM(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRratio_regBOLDGM_str,'**'),'FontWeight','bold');
elseif p_MDvsCVRratioGEBOLDGM(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRratio_regBOLDGM_str,'*'),'FontWeight','bold');
else
    subtitle(strcat('r=',r_MDvsCVRratio_regBOLDGM_str,''),'FontWeight','bold');
end

sgtitle('CVR Ratio CVR\_BOLDSE/CVR\_BOLDGE vs MD','FontWeight','bold')

%% across subjects

%% CVR BOLD GE VS CVR BOLD SE 

[r,p]=corrcoef(CVRBOLD_GE_GMmedian_regBOLDGM_subjs,CVRBOLD_SE_GMmedian_regBOLDGM_subjs)
corr_coef_str=num2str(round(r(2),3));

figure,
scatter(CVRBOLD_GE_GMmedian_regBOLDGM_subjs,CVRBOLD_SE_GMmedian_regBOLDGM_subjs,"filled",SizeData=50)
xlabel('CVRBOLD GE','FontSize',12,'FontWeight','bold')
ylabel('CVRBOLD SE','FontSize',12,'FontWeight','bold')
if p(2)<0.05 && p(2)>0.01    
    txt = {strcat('Pearson r= ',corr_coef_str,'*')};
elseif p(2)<0.01 && p(2)>0.001   
    txt = {strcat('Pearson r= ',corr_coef_str,'**')};
elseif p(2)<0.001
    txt = {strcat('Pearson r= ',corr_coef_str,'***')};
elseif p(2)>0.05
        txt = {strcat('Pearson r= ',corr_coef_str,'')};
end
text(4*10^(-3),4*10^(-3),txt,'FontWeight', 'Bold','FontSize',12);
grid on


% [r,p]=corrcoef(CVRBOLD_GE_GMmedian_regBOLDGM_subjs,MD_map_GMmedian_subjs)
% corr_coef_str=num2str(round(r(2),3));
% 
% figure,
% scatter(MD_map_GMmedian_subjs,CVRBOLD_GE_GMmedian_regBOLDGM_subjs,"filled",SizeData=50)
% ylabel('CVRBOLD GE','FontSize',12,'FontWeight','bold')
% xlabel('Mean Diffusivity','FontSize',12,'FontWeight','bold')
% if p(2)<0.05 && p(2)>0.01    
%     txt = {strcat('Pearson r= ',corr_coef_str,'*')};
% elseif p(2)<0.01 && p(2)>0.001   
%     txt = {strcat('Pearson r= ',corr_coef_str,'**')};
% elseif p(2)<0.001
%     txt = {strcat('Pearson r= ',corr_coef_str,'***')};
% elseif p(2)>0.05
%         txt = {strcat('Pearson r= ',corr_coef_str,'')};
% end
% text(7.7*10^(-4),2*10^(-3),txt,'FontWeight', 'Bold','FontSize',12);
% grid on
% 
% 
% [r,p]=corrcoef(CVRBOLD_SE_GMmedian_regBOLDGM_subjs,MD_map_GMmedian_subjs)
% corr_coef_str=num2str(round(r(2),3));
% 
% figure,
% scatter(MD_map_GMmedian_subjs,CVRBOLD_SE_GMmedian_regBOLDGM_subjs,"filled",SizeData=50)
% ylabel('CVRBOLD SE','FontSize',12,'FontWeight','bold')
% xlabel('Mean Diffusivity','FontSize',12,'FontWeight','bold')
% if p(2)<0.05 && p(2)>0.01    
%     txt = {strcat('Pearson r= ',corr_coef_str,'*')};
% elseif p(2)<0.01 && p(2)>0.001   
%     txt = {strcat('Pearson r= ',corr_coef_str,'**')};
% elseif p(2)<0.001
%     txt = {strcat('Pearson r= ',corr_coef_str,'***')};
% elseif p(2)>0.05
%         txt = {strcat('Pearson r= ',corr_coef_str,'')};
% end
% text(7.7*10^(-4),2*10^(-3),txt,'FontWeight', 'Bold','FontSize',12);
% grid on

%% CVR ratio BOLDSE/BOLDGE

[r,p]=corrcoef(MD_map_GMmedian_subjs, CVRratio_GMmedian_regPETCO2_subjs);
corr_coef_str=num2str(round(r(2),3));

figure,
ax1=subplot(1,2,1)
scatter(MD_map_GMmedian_subjs, CVRratio_GMmedian_regPETCO2_subjs,"filled",SizeData=50)
ylabel('CVR ratio','FontSize',12,'FontWeight','bold')
xlabel('MD','FontSize',12,'FontWeight','bold')
title('regPetCO2')
if p(2)<0.05 && p(2)>0.01    
   subtitle(strcat('r= ',corr_coef_str,'*'),'FontWeight','bold');
elseif p(2)<0.01 && p(2)>0.001   
    subtitle(strcat('r= ',corr_coef_str,'**'),'FontWeight','bold');
elseif p(2)<0.001
    subtitle(strcat('r= ',corr_coef_str,'***'),'FontWeight','bold');
elseif p(2)>0.05
        subtitle(strcat('r= ',corr_coef_str),'FontWeight','bold');
end
% text(7.7*10^(-4),0.5,txt,'FontWeight', 'Bold','FontSize',12);
grid on

[r,p]=corrcoef(MD_map_GMmedian_subjs, CVRratio_GMmedian_regBOLDGM_subjs);
corr_coef_str=num2str(round(r(2),3));

ax2=subplot(1,2,2)
scatter(MD_map_GMmedian_subjs, CVRratio_GMmedian_regBOLDGM_subjs,"filled",SizeData=50)
ylabel('CVR ratio','FontSize',12,'FontWeight','bold')
xlabel('MD','FontSize',12,'FontWeight','bold')
title('regBOLDGM')
if p(2)<0.05 && p(2)>0.01    
    subtitle(strcat('r= ',corr_coef_str,'*'),'FontWeight','bold');
elseif p(2)<0.01 && p(2)>0.001   
    subtitle(strcat('r= ',corr_coef_str,'**'),'FontWeight','bold');
elseif p(2)<0.001
    subtitle(strcat('r= ',corr_coef_str,'***'),'FontWeight','bold');
elseif p(2)>0.05
        subtitle(strcat('r= ',corr_coef_str),'FontWeight','bold');
end
% text(7.7*10^(-4),0.5,txt,'FontWeight', 'Bold','FontSize',12);
grid on

%% CVR

[r_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD,p_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD]=corrcoef(CVRBOLD_SE_GMmedian_regBOLDGM_subjs,MD_map_GMmedian_subjs)
[r_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD,p_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD]=corrcoef(CVRBOLD_GE_GMmedian_regBOLDGM_subjs,MD_map_GMmedian_subjs)

[r_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD,p_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD]=corrcoef(CVRBOLD_SE_GMmedian_regPetCO2_subjs,MD_map_GMmedian_subjs)
[r_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD,p_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD]=corrcoef(CVRBOLD_GE_GMmedian_regPetCO2_subjs,MD_map_GMmedian_subjs)

corr_coef_str_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD=num2str(round(r_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD(2),3));
corr_coef_str_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD=num2str(round(r_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD(2),3));

corr_coef_str_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD=num2str(round(r_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD(2),3));
corr_coef_str_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD=num2str(round(r_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD(2),3));

figure,

ax1=subplot(2,2,1);
scatter(MD_map_GMmedian_subjs,CVRBOLD_GE_GMmedian_regPetCO2_subjs,"filled",SizeData=50)
ylabel('CVRBOLD GE','FontSize',12,'FontWeight','bold')
xlabel('MD','FontSize',12,'FontWeight','bold')
title('reg PetCO2')
if p_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD(1,2)<0.001
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD,'***'),'FontWeight','bold');
elseif p_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD(1,2)<0.01
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD,'**'),'FontWeight','bold');
elseif p_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD(1,2)<0.05
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD,'*'),'FontWeight','bold');
else
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD,''),'FontWeight','bold');
end
grid on

ax2=subplot(2,2,2);
scatter(MD_map_GMmedian_subjs,CVRBOLD_GE_GMmedian_regBOLDGM_subjs,"filled",SizeData=50)
ylabel('CVRBOLD GE','FontSize',12,'FontWeight','bold')
xlabel('MD','FontSize',12,'FontWeight','bold')
title('reg BOLDGM')
if p_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD(1,2)<0.001
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD,'***'),'FontWeight','bold');
elseif p_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD(1,2)<0.01
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD,'**'),'FontWeight','bold');
elseif p_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD(1,2)<0.05
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD,'*'),'FontWeight','bold');
else
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD,''),'FontWeight','bold');
end
grid on

ax3=subplot(2,2,3);
scatter(MD_map_GMmedian_subjs,CVRBOLD_SE_GMmedian_regPetCO2_subjs,"filled",SizeData=50)
ylabel('CVRBOLD SE','FontSize',12,'FontWeight','bold')
xlabel('MD','FontSize',12,'FontWeight','bold')
if p_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD(1,2)<0.001
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD,'***'),'FontWeight','bold');
elseif p_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD(1,2)<0.01
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD,'**'),'FontWeight','bold');
elseif p_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD(1,2)<0.05
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD,'*'),'FontWeight','bold');
else
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD,''),'FontWeight','bold');     
end
grid on

ax4=subplot(2,2,4);
scatter(MD_map_GMmedian_subjs,CVRBOLD_SE_GMmedian_regBOLDGM_subjs,"filled",SizeData=50)
ylabel('CVRBOLD SE','FontSize',12,'FontWeight','bold')
xlabel('MD','FontSize',12,'FontWeight','bold')
if p_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD(1,2)<0.001
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD,'***'),'FontWeight','bold');
elseif p_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD(1,2)<0.01
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD,'**'),'FontWeight','bold');
elseif p_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD(1,2)<0.05
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD,'*'),'FontWeight','bold');
else
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD,''),'FontWeight','bold');  
end
grid on