%% PREPARING DATA

%% choose path (it varies according to the computer you are working with)
%path = '/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/CVR';% cubric %move
%folder outside
%path = '/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI/DTI';% cubric

path = '/media/nas_rete/Work_manuela'; % /DEXIGESEDiffProject/SUBJ2MNI'; % itab
% path = '/home/c25078236/Desktop/DEXIGESE/SUBJ2MNI';

tissue = 'GM'; %WM

% name of the folder where data are saved

date='261021';

%% read subjects file

subjects_cvr = importdata(strcat(path,'/DEXIGESEDiffProject/SUBJ2MNI/subjects_CVR.txt'));
subjects_dwi = importdata(strcat(path,'/DEXIGESEDiffProject/SUBJ2MNI/subjects_DWI.txt'));

n_subjs = length(subjects_dwi);%=subjects_cvr

%% load parametric images

%DWI

V_MD_maps={};

for i = 1:n_subjs         
    subj = subjects_dwi(i);
    subj=subj{1};

    img_path_MD=strcat(strcat(path,'/DEXIGESEDiffProject/SUBJ2MNI/DTI/',subj,'_data_dwi_dti_MD_2MNI2mm.nii.gz'));

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

%     img_path_petCO2_CVRBOLD_GE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_BOLD_regPETCO2_BOLDCVR2MNI2mm.nii.gz');
%     img_path_petCO2_CVRASL_GE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_BOLD_regPETCO2_CVR2MNI2mm.nii.gz');
%     img_path_BOLDGM_CVRBOLD_GE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_BOLD_regBOLDGM_BOLDCVR2MNI2mm.nii.gz');
%     img_path_BOLDGM_CVRASL_GE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_BOLD_regBOLDGM_CVR2MNI2mm.nii.gz');
% 
%     img_path_petCO2_CVRBOLD_SE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_SEBOLD_regPETCO2_BOLDCVR2MNI2mm.nii.gz');
%     img_path_petCO2_CVRASL_SE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_SEBOLD_regPETCO2_CVR2MNI2mm.nii.gz');
%     img_path_BOLDGM_CVRBOLD_SE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_SEBOLD_regBOLDGM_BOLDCVR2MNI2mm.nii.gz');
%     img_path_BOLDGM_CVRASL_SE=strcat(path,'/CVR_maps_div1000/',subj,'_DEXIGESEBH_SEBOLD_regBOLDGM_CVR2MNI2mm.nii.gz');
    img_path_petCO2_CVRBOLD_GE=strcat(path,'/PRINAntonello/registered/func/',subj,'_task-bh_BOLDCVR_from-DEXIGESE-bold_desc-reg-PETCO2_space-MNI-2MM.nii.gz');
    img_path_petCO2_CVRASL_GE=strcat(path,'/PRINAntonello/registered/func/',subj,'_task-bh_CVR_from-DEXIGESE-bold_desc-reg-PETCO2_space-MNI-2MM.nii.gz');
    img_path_BOLDGM_CVRBOLD_GE=strcat(path,'/PRINAntonello/registered/func/',subj,'_task-bh_BOLDCVR_from-DEXIGESE-bold_desc-reg-BOLDGM_space-MNI-2MM.nii.gz');
    img_path_BOLDGM_CVRASL_GE=strcat(path,'/PRINAntonello/registered/func/',subj,'_task-bh_CVR_from-DEXIGESE-bold_desc-reg-BOLDGM_space-MNI-2MM.nii.gz');

    img_path_petCO2_CVRBOLD_SE=strcat(path,'/PRINAntonello/registered/func/',subj,'_task-bh_BOLDCVR_from-DEXIGESE-bold-SE_desc-reg-PETCO2_space-MNI-2MM.nii.gz');
    img_path_petCO2_CVRASL_SE=strcat(path,'/PRINAntonello/registered/func/',subj,'_task-bh_CVR_from-DEXIGESE-bold-SE_desc-reg-PETCO2_space-MNI-2MM.nii.gz');
    img_path_BOLDGM_CVRBOLD_SE=strcat(path,'/PRINAntonello/registered/func/',subj,'_task-bh_BOLDCVR_from-DEXIGESE-bold-SE_desc-reg-BOLDGM_space-MNI-2MM.nii.gz');
    img_path_BOLDGM_CVRASL_SE=strcat(path,'/PRINAntonello/registered/func/',subj,'_task-bh_CVR_from-DEXIGESE-bold-SE_desc-reg-BOLDGM_space-MNI-2MM.nii.gz');

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

    img_path_PVE_tissue_dwi=strcat(path,'/DEXIGESEDiffProject/SUBJ2MNI/PVE/',subj,'_t1_mp2rage_sag_p3_iso_fast_UNI_brain_pve_',PVE_str,'_2MNI2mm.nii.gz');

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

CVRratio_GEoverSE_BOLDGM_tissue_subjs = {};

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

    %ratio CVR_BOLDGE/CVR_BOLDSE 
    CVRratio_GEoverSE_BOLDGM = BOLDGM_CVRBOLD_GE_map_GM./BOLDGM_CVRBOLD_SE_map_GM;

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

    CVRratio_GEoverSE_BOLDGM_tissue_subjs{end+1}=CVRratio_GEoverSE_BOLDGM;


end




%% computing medians across voxels (in the tissue of interest)

%pve (if tissue = 'GM', PVE=GM)
all_V_PVE_tissue_dwi_maps = cat(4,V_PVE_tissue_dwi_maps{:});
median_PVE_tissue_dwi_maps = nanmedian(all_V_PVE_tissue_dwi_maps,4);

all_V_PVE_tissue_cvr_maps = cat(4,V_PVE_tissue_cvr_maps{:});
median_PVE_tissue_cvr_maps = nanmedian(all_V_PVE_tissue_cvr_maps,4);

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

%ratio CVRGE/CVRSE
all_CVRratio_GEoverSE_BOLDGM_tissue_subjs = cat(4,CVRratio_GEoverSE_BOLDGM_tissue_subjs{:});
median_CVRratio_GEoverSE_BOLDGM_tissue_subjs = nanmedian(all_CVRratio_GEoverSE_BOLDGM_tissue_subjs,4);



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


%% all regressors

% figure, 
% ax1=subplot(2,2,1);
% imagesc(rot90(median_petCO2_CVRBOLD_GE_map(:,:,round(dim(3)/2))))
% title('CVR BOLD,regPetCO2')
% subtitle('Gradient Echo')
% clim([0,0.003])
% 
% ax2=subplot(2,2,2);
% imagesc(rot90(median_BOLDGM_CVRBOLD_GE_map(:,:,round(dim(3)/2))))
% title('CVR BOLD, BOLDGM')
% subtitle('Gradient Echo')
% clim([0,0.008])
% 
% ax3=subplot(2,2,3);
% imagesc(rot90(median_petCO2_CVRBOLD_SE_map(:,:,round(dim(3)/2))))
% title('CVR BOLD,regPetCO2')
% subtitle('Spin Echo')
% clim([0,0.0015])
% 
% ax4=subplot(2,2,4);
% imagesc(rot90(median_BOLDGM_CVRBOLD_SE_map(:,:,round(dim(3)/2))))
% title('CVR BOLD, BOLDGM')
% subtitle('Spin Echo')
% clim([0,0.004])
% 
% 
% sgtitle('CVR','FontWeight','bold')

%% only BOLDGM regressor


figure, 


ax1=subplot(1,2,1);
imagesc(rot90(median_BOLDGM_CVRBOLD_GE_map(:,:,round(dim(3)/2))))
% title('CVR BOLD, BOLDGM')
title('Gradient Echo')
clim([0,0.008])

ax2=subplot(1,2,2);
imagesc(rot90(median_BOLDGM_CVRBOLD_SE_map(:,:,round(dim(3)/2))))
% title('CVR BOLD, BOLDGM')
title('Spin Echo')
clim([0,0.004])


sgtitle('CVR, regBOLDGM','FontWeight','bold')



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

%% all regressors

% figure,
% ax1 = subplot(1,2,1);
% imagesc(rot90(median_CVRratio_petCO2_map(:,:,round(dim(3)/2))));
% title('regPetCO2');
% % subtitle('CVRratio','FontWeight','bold');
% clim([0,0.9])
% 
% ax2 = subplot(1,2,2);
% imagesc(rot90(median_CVRratio_BOLDGM_map(:,:,round(dim(3)/2))));
% title('BOLD GM');
% % subtitle('CVRratio','FontWeight','bold');
% clim([0,0.9])
% 
% sgtitle('CVR ratio','FontWeight','bold')

%% only BOLDGM regressor

figure,

imagesc(rot90(median_CVRratio_BOLDGM_map(:,:,round(dim(3)/2))));
clim([0,0.9])
title('CVR ratio, regressor BOLDGM','FontWeight','bold')

%% CVR ratio GM (all regressors)

% figure,
% ax1 = subplot(1,2,1);
% imagesc(rot90(median_CVRratio_petCO2_tissue_subjs(:,:,round(dim(3)/2))));
% title('regressor PetCO2');
% % subtitle('CVRratio','FontWeight','bold');
% clim([0,0.9])
% 
% ax2 = subplot(1,2,2);
% imagesc(rot90(median_CVRratio_BOLDGM_tissue_subjs(:,:,round(dim(3)/2))));
% title('regressor BOLDGM');
% % subtitle('CVRratio','FontWeight','bold');
% clim([0,0.9])
% 
% sgtitle('CVR ratio (Grey Matter, PVE>0.5)','FontWeight','bold')
% 
% %ATTENTION: 
% % values inside GM are not perfectly equal to values inside GM
% % of the whole brain map. Probably median across subjects is not only across
% % subjects' voxels. You should check the distributions of values 
% % inside GM of the method I (mask every subject, calculate ratio and 
% % calculate median across subjects) vs
% % method II (median across subject, calculate ratio and mask the resulting
% % whole brain ratio map).

%% CVR ratio GM (only BOLDGM regressor)

figure,

imagesc(rot90(median_CVRratio_BOLDGM_tissue_subjs(:,:,round(dim(3)/2))));
subtitle('regressor BOLDGM');
% subtitle('CVRratio','FontWeight','bold');
clim([0,0.9])

title('CVR ratio (Grey Matter, PVE>0.5)','FontWeight','bold')

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

% dim=size(median_MD_map_tissue_subjs);
low_prc = 5;
high_prc = 95;

%% CVR ratio CVR_BOLD/CVR_ASL

%CVR GE

prcLOW = prctile(median_CVRratio_petCO2_GE_subjs(:),low_prc);
prcHIGH = prctile(median_CVRratio_petCO2_GE_subjs(:),high_prc);
median_CVRratio_petCO2_GE_subjs(median_CVRratio_petCO2_GE_subjs<prcLOW | median_CVRratio_petCO2_GE_subjs>prcHIGH)=NaN;

% figure,
% imagesc(rot90(median_CVRratio_petCO2_GE_subjs(:,:,round(dim(3)/2))))
% %caxis([0,0.001])
% title('CVR GE, PetCO2')

prcLOW = prctile(median_CVRratio_BOLDGM_GE_subjs(:),low_prc);
prcHIGH = prctile(median_CVRratio_BOLDGM_GE_subjs(:),high_prc);
median_CVRratio_BOLDGM_GE_subjs(median_CVRratio_BOLDGM_GE_subjs<prcLOW | median_CVRratio_BOLDGM_GE_subjs>prcHIGH)=NaN;

% figure,
% imagesc(rot90(median_CVRratio_BOLDGM_GE_subjs(:,:,round(dim(3)/2))))
% %caxis([0,0.001])
% title('CVR GE, BOLDGM')

% CVR SE 

prcLOW = prctile(median_CVRratio_petCO2_SE_subjs(:),low_prc);
prcHIGH = prctile(median_CVRratio_petCO2_SE_subjs(:),high_prc);
median_CVRratio_petCO2_SE_subjs(median_CVRratio_petCO2_SE_subjs<prcLOW | median_CVRratio_petCO2_SE_subjs>prcHIGH)=NaN;

% figure,
% imagesc(rot90(median_CVRratio_petCO2_SE_subjs(:,:,round(dim(3)/2))))
% %caxis([0,0.001])
% title('CVR SE, PetCO2')

prcLOW = prctile(median_CVRratio_BOLDGM_SE_subjs(:),low_prc);
prcHIGH = prctile(median_CVRratio_BOLDGM_SE_subjs(:),high_prc);
median_CVRratio_BOLDGM_SE_subjs(median_CVRratio_BOLDGM_SE_subjs<prcLOW | median_CVRratio_BOLDGM_SE_subjs>prcHIGH)=NaN;

% figure,
% imagesc(rot90(median_CVRratio_BOLDGM_SE_subjs(:,:,round(dim(3)/2))))
% %caxis([0,0.001])
% title('CVR SE, BOLDGM')




%% MD
prcLOW = prctile(median_MD_map_tissue_subjs(:),low_prc);
prcHIGH = prctile(median_MD_map_tissue_subjs(:),high_prc);
median_MD_map_tissue_subjs(median_MD_map_tissue_subjs<prcLOW | median_MD_map_tissue_subjs>prcHIGH)=NaN;

% figure,
% imagesc(rot90(median_MD_map_tissue_subjs(:,:,round(dim(3)/2))))
% %caxis([0,0.001])
% title('Mean Diffusivity Map')

%% PVE
prcLOW = prctile(median_PVE_tissue_cvr_maps,low_prc);
prcHIGH = prctile(median_PVE_tissue_cvr_maps,high_prc);
median_PVE_tissue_cvr_maps(median_PVE_tissue_cvr_maps<prcLOW | median_PVE_tissue_cvr_maps>prcHIGH)=NaN;

prcLOW = prctile(median_PVE_tissue_dwi_maps,low_prc);
prcHIGH = prctile(median_PVE_tissue_dwi_maps,high_prc);
median_PVE_tissue_dwi_maps(median_PVE_tissue_dwi_maps<prcLOW | median_PVE_tissue_dwi_maps>prcHIGH)=NaN;


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


%% ratio CVR_BOLDGE/BOLDSE

prcLOW = prctile(median_CVRratio_GEoverSE_BOLDGM_tissue_subjs(:),low_prc);
prcHIGH = prctile(median_CVRratio_GEoverSE_BOLDGM_tissue_subjs(:),high_prc);
median_CVRratio_GEoverSE_BOLDGM_tissue_subjs(median_CVRratio_GEoverSE_BOLDGM_tissue_subjs<prcLOW | median_CVRratio_GEoverSE_BOLDGM_tissue_subjs>prcHIGH)=NaN;

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
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('# of voxels','FontWeight','bold','FontSize',19)
xlabel('Mean Diffusivity (MD), mm^{2}/s','FontWeight','bold','FontSize',19)
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


%% CVR BOLD GE and SE distributions (all regressors)

% figure,
% 
% ax1=subplot(2,2,1);
% histogram(median_petCO2_CVRBOLD_GE_map_tissue_subjs)
% xlabel('CVR GE BOLD','FontWeight','bold')
% ylabel('# of voxels','FontWeight','bold','FontSize',12)
% ylim([0,7000])
% title('regPetCO2')
% grid on
% 
% ax2=subplot(2,2,2);
% histogram(median_BOLDGM_CVRBOLD_GE_map_tissue_subjs)
% xlabel('CVR GE BOLD','FontWeight','bold')
% ylabel('# of voxels','FontWeight','bold','FontSize',12)
% ylim([0,7000])
% title('regBOLDGM')
% grid on
% 
% ax3=subplot(2,2,3);
% histogram(median_petCO2_CVRBOLD_SE_map_tissue_subjs)
% xlabel('CVR SE BOLD','FontWeight','bold')
% ylabel('# of voxels','FontWeight','bold','FontSize',12)
% ylim([0,7000])
% grid on
% 
% ax4=subplot(2,2,4);
% histogram(median_BOLDGM_CVRBOLD_SE_map_tissue_subjs)
% xlabel('CVR SE BOLD','FontWeight','bold')
% ylabel('# of voxels','FontWeight','bold','FontSize',12)
% ylim([0,7000])
% grid on

%% CVR BOLD GE and SE distributions (only BOLDGM regressor)

figure,

ax1=subplot(1,2,1);
histogram(median_BOLDGM_CVRBOLD_GE_map_tissue_subjs)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
xlabel('CVR GE BOLD','FontWeight','bold','FontSize',19)
ylabel('# of voxels','FontWeight','bold','FontSize',19)
ylim([0,7000])
% title('regBOLDGM')
grid on

ax2=subplot(1,2,2);
histogram(median_BOLDGM_CVRBOLD_SE_map_tissue_subjs)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
xlabel('CVR SE BOLD','FontWeight','bold','FontSize',19)
ylabel('# of voxels','FontWeight','bold','FontSize',19)
ylim([0,7000])
grid on

sgtitle(strcat('CVR, regBOLDGM, tissue=',tissue),'FontWeight','bold','FontSize',19)

%% CVR BOLD GE / SE ratio distributions (all regressors)

% figure,
% 
% ax1=subplot(1,2,1);
% histogram(median_CVRratio_petCO2_tissue_subjs)
% xlabel('CVR ratio, regPetCO2','FontWeight','bold')
% ylabel('# of voxels','FontWeight','bold','FontSize',12)
% ylim([0,4000])
% grid on
% 
% ax2=subplot(1,2,2);
% histogram(median_CVRratio_BOLDGM_tissue_subjs)
% xlabel('CVR ratio, regBOLDGM','FontWeight','bold')
% ylabel('# of voxels','FontWeight','bold','FontSize',12)
% ylim([0,4000])
% grid on
% 
% sgtitle('CVR ratio distributions','FontWeight','bold','FontSize',12)

%% CVR BOLD GE / SE ratio distribution (only GM regressor)

figure,

histogram(median_CVRratio_BOLDGM_tissue_subjs)
xlabel('CVR ratio','FontWeight','bold')
ylabel('# of voxels','FontWeight','bold','FontSize',12)
% ylim([0,4000])
grid on

sgtitle(strcat('CVR ratio distribution, regBOLDGM, tissue=',tissue),'FontWeight','bold','FontSize',12)

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

%% (all regressors)

% figure,
% ax1=subplot(2,2,1);
% histogram2(median_MD_map_tissue_subjs(:),median_petCO2_CVRBOLD_GE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR BOLD GE','FontWeight','bold')
% title('PetCO2')
% if p_MDvsCVRBOLDGEPETCO2(1,2)<0.001
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDGEPETCO2(1,2)<0.01
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDGEPETCO2(1,2)<0.05
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,'*'),'FontWeight','bold');
% else
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEPETCO2_str,''),'FontWeight','bold');     
% end
% 
% ax2=subplot(2,2,2);
% histogram2(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_GE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR BOLD GE','FontWeight','bold')
% title('BOLDGM')
% if p_MDvsCVRBOLDGEBOLDGM(1,2)<0.001
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDGEBOLDGM(1,2)<0.01
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDGEBOLDGM(1,2)<0.05
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'*'),'FontWeight','bold');
% else
%     subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,''),'FontWeight','bold');  
% end
% 
% 
% ax3=subplot(2,2,3);
% histogram2(median_MD_map_tissue_subjs(:),median_petCO2_CVRBOLD_SE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR BOLD SE','FontWeight','bold')
% title('PetCO2')
% if p_MDvsCVRBOLDSEPETCO2(1,2)<0.001
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDSEPETCO2(1,2)<0.01
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDGEPETCO2(1,2)<0.05
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,'*'),'FontWeight','bold');
% else
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEPETCO2_str,''),'FontWeight','bold');
% end
% 
% 
% 
% 
% ax4=subplot(2,2,4);
% histogram2(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_SE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR BOLD SE','FontWeight','bold')
% title('BOLDGM')
% if p_MDvsCVRBOLDSEBOLDGM(1,2)<0.001
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDSEBOLDGM(1,2)<0.01
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRBOLDSEBOLDGM(1,2)<0.05
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'*'),'FontWeight','bold');
% else
%     subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,''),'FontWeight','bold');
% end

%% only BOLDGM regressor

figure,

ax1=subplot(1,2,1);
histogram2(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_GE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
xlabel('MD','FontWeight','bold','FontSize',19)
ylabel('CVR BOLD GE','FontWeight','bold','FontSize',19)
if p_MDvsCVRBOLDGEBOLDGM(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'***'),'FontWeight','bold','FontSize',19);
elseif p_MDvsCVRBOLDGEBOLDGM(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'**'),'FontWeight','bold','FontSize',19);
elseif p_MDvsCVRBOLDGEBOLDGM(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,'*'),'FontWeight','bold','FontSize',19);
else
    subtitle(strcat('r=',r_MDvsCVRBOLDGEBOLDGM_str,''),'FontWeight','bold','FontSize',19);  
end

ax2=subplot(1,2,2);
histogram2(median_MD_map_tissue_subjs(:),median_BOLDGM_CVRBOLD_SE_map_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
xlabel('MD','FontWeight','bold','FontSize',19)
ylabel('CVR BOLD SE','FontWeight','bold','FontSize',19)
if p_MDvsCVRBOLDSEBOLDGM(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'***'),'FontWeight','bold','FontSize',19);
elseif p_MDvsCVRBOLDSEBOLDGM(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'**'),'FontWeight','bold','FontSize',19);
elseif p_MDvsCVRBOLDSEBOLDGM(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,'*'),'FontWeight','bold','FontSize',19);
else
    subtitle(strcat('r=',r_MDvsCVRBOLDSEBOLDGM_str,''),'FontWeight','bold','FontSize',19);
end

sgtitle(strcat('CVR vs MD, BOLDGM regressor, tissue=',tissue),'FontWeight','bold','FontSize',19)

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

 %% histogram 2d ratio CVR_BOLD/CVR_ASL vs MD
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



%% histogram 2d ratio CVR_BOLDSE/CVR_BOLDGE (all regressors)

% r_MDvsCVRratio_regPetCO2_str=num2str(round(r_MDvsCVRratio_regPETCO2(1,2),2));
% r_MDvsCVRratio_regBOLDGM_str=num2str(round(r_MDvsCVRratio_regBOLDGM(1,2),2));
% 
% figure,
% ax1=subplot(1,2,1);
% histogram2(median_MD_map_tissue_subjs(:), median_CVRratio_petCO2_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on');
% xlabel('MD','FontWeight','bold')
% ylabel('CVR ratio','FontWeight','bold')
% title('reg PetCO2')
% if p_MDvsCVRratioGEPETCO2(1,2)<0.001
%     subtitle(strcat('r=',r_MDvsCVRratio_regPetCO2_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRratioGEPETCO2(1,2)<0.01
%     subtitle(strcat('r=',r_MDvsCVRratio_regPetCO2_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRratioGEPETCO2(1,2)<0.05
%     subtitle(strcat('r=',r_MDvsCVRratio_regPetCO2_str,'*'),'FontWeight','bold');
% else
%     subtitle(strcat('r=',r_MDvsCVRratio_regPetCO2_str,''),'FontWeight','bold');   
% end
% 
% ax2=subplot(1,2,2);
% histogram2(median_MD_map_tissue_subjs(:), median_CVRratio_BOLDGM_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
% xlabel('MD','FontWeight','bold')
% ylabel('CVR ratio','FontWeight','bold')
% title('reg BOLDGM')
% if p_MDvsCVRratioGEBOLDGM(1,2)<0.001
%     subtitle(strcat('r=',r_MDvsCVRratio_regBOLDGM_str,'***'),'FontWeight','bold');
% elseif p_MDvsCVRratioGEBOLDGM(1,2)<0.01
%     subtitle(strcat('r=',r_MDvsCVRratio_regBOLDGM_str,'**'),'FontWeight','bold');
% elseif p_MDvsCVRratioGEBOLDGM(1,2)<0.05
%     subtitle(strcat('r=',r_MDvsCVRratio_regBOLDGM_str,'*'),'FontWeight','bold');
% else
%     subtitle(strcat('r=',r_MDvsCVRratio_regBOLDGM_str,''),'FontWeight','bold');
% end
% 
% sgtitle('CVR Ratio CVR\_BOLDSE/CVR\_BOLDGE vs MD','FontWeight','bold')

%% histogram 2d ratio CVR_BOLDSE/CVR_BOLDGE vs MD(only GM regressor)

r_MDvsCVRratio_regBOLDGM_str=num2str(round(r_MDvsCVRratio_regBOLDGM(1,2),2));



figure,
histogram2(median_MD_map_tissue_subjs(:), median_CVRratio_BOLDGM_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
xlabel('MD','FontWeight','bold','FontSize',19)
ylabel('CVR ratio','FontWeight','bold','FontSize',19)
subtitle('reg BOLDGM')
if p_MDvsCVRratioGEBOLDGM(1,2)<0.001
    subtitle(strcat('r=',r_MDvsCVRratio_regBOLDGM_str,'***'),'FontWeight','bold','FontSize',19);
elseif p_MDvsCVRratioGEBOLDGM(1,2)<0.01
    subtitle(strcat('r=',r_MDvsCVRratio_regBOLDGM_str,'**'),'FontWeight','bold','FontSize',19);
elseif p_MDvsCVRratioGEBOLDGM(1,2)<0.05
    subtitle(strcat('r=',r_MDvsCVRratio_regBOLDGM_str,'*'),'FontWeight','bold','FontSize',19);
else
    subtitle(strcat('r=',r_MDvsCVRratio_regBOLDGM_str,''),'FontWeight','bold','FontSize',19);
end

title(strcat('CVR Ratio CVR\_BOLDSE/CVR\_BOLDGE vs MD, tissue=',tissue),'FontWeight','bold','FontSize',19)

%% across subjects

%% CVR BOLD GE VS CVR BOLD SE 

[r,p]=corrcoef(CVRBOLD_GE_GMmedian_regBOLDGM_subjs,CVRBOLD_SE_GMmedian_regBOLDGM_subjs)
corr_coef_str=num2str(round(r(2),3));


[fitResult, gof] = fit(CVRBOLD_GE_GMmedian_regBOLDGM_subjs', CVRBOLD_SE_GMmedian_regBOLDGM_subjs', 'exp1');

figure,
scatter(CVRBOLD_GE_GMmedian_regBOLDGM_subjs,CVRBOLD_SE_GMmedian_regBOLDGM_subjs,"filled",SizeData=50)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
xlabel('CVRBOLD GE','FontSize',19,'FontWeight','bold')
ylabel('CVRBOLD SE','FontSize',19,'FontWeight','bold')
if p(2)<0.05 && p(2)>0.01    
    txt = {strcat('Pearson r= ',corr_coef_str,'*')};
elseif p(2)<0.01 && p(2)>0.001   
    txt = {strcat('Pearson r= ',corr_coef_str,'**')};
elseif p(2)<0.001
    txt = {strcat('Pearson r= ',corr_coef_str,'***')};
elseif p(2)>0.05
        txt = {strcat('Pearson r= ',corr_coef_str,'')};
end
text(4*10^(-3),4*10^(-3),txt,'FontWeight', 'Bold','FontSize',19);
grid on

title(strcat('CVR\_BOLD GE vs CVR\_BOLD SE, regBOLDGM, tissue=',tissue),'FontWeight','bold','FontSize',19)



%% CVR ratio BOLDSE/BOLDGE (all regressors)

% [r,p]=corrcoef(MD_map_GMmedian_subjs, CVRratio_GMmedian_regPETCO2_subjs);
% corr_coef_str=num2str(round(r(2),3));
% 
% figure,
% ax1=subplot(1,2,1)
% scatter(MD_map_GMmedian_subjs, CVRratio_GMmedian_regPETCO2_subjs,"filled",SizeData=50)
% ylabel('CVR ratio','FontSize',12,'FontWeight','bold')
% xlabel('MD','FontSize',12,'FontWeight','bold')
% title('regPetCO2')
% if p(2)<0.05 && p(2)>0.01    
%    subtitle(strcat('r= ',corr_coef_str,'*'),'FontWeight','bold');
% elseif p(2)<0.01 && p(2)>0.001   
%     subtitle(strcat('r= ',corr_coef_str,'**'),'FontWeight','bold');
% elseif p(2)<0.001
%     subtitle(strcat('r= ',corr_coef_str,'***'),'FontWeight','bold');
% elseif p(2)>0.05
%         subtitle(strcat('r= ',corr_coef_str),'FontWeight','bold');
% end
% % text(7.7*10^(-4),0.5,txt,'FontWeight', 'Bold','FontSize',12);
% grid on
% 
% [r,p]=corrcoef(MD_map_GMmedian_subjs, CVRratio_GMmedian_regBOLDGM_subjs);
% corr_coef_str=num2str(round(r(2),3));
% 
% ax2=subplot(1,2,2)
% scatter(MD_map_GMmedian_subjs, CVRratio_GMmedian_regBOLDGM_subjs,"filled",SizeData=50)
% ylabel('CVR ratio','FontSize',12,'FontWeight','bold')
% xlabel('MD','FontSize',12,'FontWeight','bold')
% title('regBOLDGM')
% if p(2)<0.05 && p(2)>0.01    
%     subtitle(strcat('r= ',corr_coef_str,'*'),'FontWeight','bold');
% elseif p(2)<0.01 && p(2)>0.001   
%     subtitle(strcat('r= ',corr_coef_str,'**'),'FontWeight','bold');
% elseif p(2)<0.001
%     subtitle(strcat('r= ',corr_coef_str,'***'),'FontWeight','bold');
% elseif p(2)>0.05
%         subtitle(strcat('r= ',corr_coef_str),'FontWeight','bold');
% end
% % text(7.7*10^(-4),0.5,txt,'FontWeight', 'Bold','FontSize',12);
% grid on

%% CVR ratio BOLDSE/BOLDGE vs MD (only BOLDGM regressor)

[r,p]=corrcoef(MD_map_GMmedian_subjs, CVRratio_GMmedian_regBOLDGM_subjs);
corr_coef_str=num2str(round(r(2),3));

figure,
scatter(MD_map_GMmedian_subjs, CVRratio_GMmedian_regBOLDGM_subjs,"filled",SizeData=50)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('CVR ratio','FontSize',19,'FontWeight','bold')
xlabel('MD(mm^2/s)','FontSize',19,'FontWeight','bold')
title(strcat('CVR ratio vs MD across subjects, regBOLDGM, tissue=',tissue),'FontWeight','bold','FontSize',19)

if p(2)<0.05 && p(2)>0.01    
    subtitle(strcat('r= ',corr_coef_str,'*'),'FontWeight','bold','FontSize',19);
elseif p(2)<0.01 && p(2)>0.001   
    subtitle(strcat('r= ',corr_coef_str,'**'),'FontWeight','bold','FontSize',19);
elseif p(2)<0.001
    subtitle(strcat('r= ',corr_coef_str,'***'),'FontWeight','bold','FontSize',19);
elseif p(2)>0.05
        subtitle(strcat('r= ',corr_coef_str),'FontWeight','bold','FontSize',19);
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

%% CVR (all regressors)

% figure,
% 
% ax1=subplot(2,2,1);
% scatter(MD_map_GMmedian_subjs,CVRBOLD_GE_GMmedian_regPetCO2_subjs,"filled",SizeData=50)
% ylabel('CVRBOLD GE','FontSize',12,'FontWeight','bold')
% xlabel('MD','FontSize',12,'FontWeight','bold')
% title('reg PetCO2')
% if p_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD(1,2)<0.001
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD,'***'),'FontWeight','bold');
% elseif p_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD(1,2)<0.01
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD,'**'),'FontWeight','bold');
% elseif p_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD(1,2)<0.05
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD,'*'),'FontWeight','bold');
% else
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regPetCO2_vs_MD,''),'FontWeight','bold');
% end
% grid on
% 
% ax2=subplot(2,2,2);
% scatter(MD_map_GMmedian_subjs,CVRBOLD_GE_GMmedian_regBOLDGM_subjs,"filled",SizeData=50)
% ylabel('CVRBOLD GE','FontSize',12,'FontWeight','bold')
% xlabel('MD','FontSize',12,'FontWeight','bold')
% title('reg BOLDGM')
% if p_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD(1,2)<0.001
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD,'***'),'FontWeight','bold');
% elseif p_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD(1,2)<0.01
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD,'**'),'FontWeight','bold');
% elseif p_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD(1,2)<0.05
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD,'*'),'FontWeight','bold');
% else
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD,''),'FontWeight','bold');
% end
% grid on
% 
% ax3=subplot(2,2,3);
% scatter(MD_map_GMmedian_subjs,CVRBOLD_SE_GMmedian_regPetCO2_subjs,"filled",SizeData=50)
% ylabel('CVRBOLD SE','FontSize',12,'FontWeight','bold')
% xlabel('MD','FontSize',12,'FontWeight','bold')
% if p_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD(1,2)<0.001
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD,'***'),'FontWeight','bold');
% elseif p_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD(1,2)<0.01
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD,'**'),'FontWeight','bold');
% elseif p_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD(1,2)<0.05
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD,'*'),'FontWeight','bold');
% else
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regPetCO2_vs_MD,''),'FontWeight','bold');     
% end
% grid on
% 
% ax4=subplot(2,2,4);
% scatter(MD_map_GMmedian_subjs,CVRBOLD_SE_GMmedian_regBOLDGM_subjs,"filled",SizeData=50)
% ylabel('CVRBOLD SE','FontSize',12,'FontWeight','bold')
% xlabel('MD','FontSize',12,'FontWeight','bold')
% if p_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD(1,2)<0.001
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD,'***'),'FontWeight','bold');
% elseif p_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD(1,2)<0.01
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD,'**'),'FontWeight','bold');
% elseif p_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD(1,2)<0.05
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD,'*'),'FontWeight','bold');
% else
%     subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD,''),'FontWeight','bold');  
% end
% grid on

%% CVR (only BOLDGM)

figure,

ax1=subplot(1,2,1);
scatter(MD_map_GMmedian_subjs,CVRBOLD_GE_GMmedian_regBOLDGM_subjs,"filled",SizeData=50)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('CVRBOLD GE','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('MD(mm^2/s)','FontWeight','bold','FontSize',19,'FontName','Calibri')
if p_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD(1,2)<0.001
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD,'***'),'FontWeight','bold','FontSize',19,'FontName','Calibri');
elseif p_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD(1,2)<0.01
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD,'**'),'FontWeight','bold','FontSize',19,'FontName','Calibri');
elseif p_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD(1,2)<0.05
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD,'*'),'FontWeight','bold','FontSize',19,'FontName','Calibri');
else
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_GE_GMmedian_regBOLDGM_vs_MD,''),'FontWeight','bold','FontSize',19,'FontName','Calibri');
end
grid on

ax2=subplot(1,2,2);
scatter(MD_map_GMmedian_subjs,CVRBOLD_SE_GMmedian_regBOLDGM_subjs,"filled",SizeData=50)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('CVRBOLD SE','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('MD(mm^2/s)','FontWeight','bold','FontSize',19,'FontName','Calibri')
if p_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD(1,2)<0.001
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD,'***'),'FontWeight','bold','FontSize',19,'FontName','Calibri');
elseif p_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD(1,2)<0.01
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD,'**'),'FontWeight','bold','FontSize',19,'FontName','Calibri');
elseif p_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD(1,2)<0.05
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD,'*'),'FontWeight','bold','FontSize',19,'FontName','Calibri');
else
    subtitle(strcat('r=',corr_coef_str_CVRBOLD_SE_GMmedian_regBOLDGM_vs_MD,''),'FontWeight','bold','FontSize',19,'FontName','Calibri');  
end
grid on

sgtitle(strcat('CVRBOLD vs MD, regressor BOLDGM, tissue=',tissue),'FontWeight','bold','FontSize',19,'FontName','Calibri')


%% THEORETICAL

x = [0.000000000000001,1,1.1,2,3,4,5,10,15,20]';
y = [12,4.5,4,3.1,2.6,2.4,2.1,1.7,1.6,1.5]';

figure,
plot(x,y,'o-');
ylabel('\DeltaR^*_2/\DeltaR_2','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('D(\mum^2/ms)','FontWeight','bold','FontSize',19,'FontName','Calibri')
grid on

fitobj=fit(x,y,'exp1');
a=fitobj.a;
b=fitobj.b;

x_up=8;
x_low=7;
y_up=a*exp(b*x_up);
y_low=a*exp(b*x_low);

m = (y_up-y_low)./(x_up-x_low);

%% save workspace

save(strcat('data_',date))

%% CVRBOLDGE/CVRBOLDSE

[r_CVRratioGEOverSE_vs_MD,p_CVRratioGEOverSE_vs_MD]=corrcoef(median_CVRratio_GEoverSE_BOLDGM_tissue_subjs(:),median_MD_map_tissue_subjs(:),'rows','complete');

corr_coef_str_CVRratioGEOverSE_vs_MD=num2str(round(r_CVRratioGEOverSE_vs_MD(2),3));

y=median_CVRratio_GEoverSE_BOLDGM_tissue_subjs(:)';
x=median_MD_map_tissue_subjs(:);

% Fit a quadratic equation
[pol,S] = polyfit(x, y, 1); %to plot the linear model I use this function
% Evaluate the fitted polynomial
% y_fit = polyval(pol, x);
% Calculate the R-squared value
% Rsquared = 1 - sum((y - y_fit).^2) / sum((y - nanmean(y)).^2);
% Rsquared

alpha = 0.05; % Significance level
[y_fit,delta] = polyconf(pol,x,S,'alpha',alpha);

[x_sorted,index] = sortrows(x');
y_fit=y_fit';
delta = delta';
y_fit_sorted = y_fit(index);
delta_sorted = delta(index);


figure,
histogram2(median_MD_map_tissue_subjs(:), median_CVRratio_GEoverSE_BOLDGM_tissue_subjs(:),'DisplayStyle','tile','ShowEmptyBins','on')
hold on
plot(x_sorted,y_fit_sorted,'--','LineWidth',3,'Color',"#000000");
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
xlabel('MD','FontWeight','bold','FontSize',19)
ylabel('CVR ratio','FontWeight','bold','FontSize',19)
subtitle('reg BOLDGM')
if p_MDvsCVRratioGEBOLDGM(1,2)<0.001
    subtitle(strcat('r=',corr_coef_str_CVRratioGEOverSE_vs_MD,'***'),'FontWeight','bold','FontSize',19);
elseif p_MDvsCVRratioGEBOLDGM(1,2)<0.01
    subtitle(strcat('r=',corr_coef_str_CVRratioGEOverSE_vs_MD,'**'),'FontWeight','bold','FontSize',19);
elseif p_MDvsCVRratioGEBOLDGM(1,2)<0.05
    subtitle(strcat('r=',corr_coef_str_CVRratioGEOverSE_vs_MD,'*'),'FontWeight','bold','FontSize',19);
else
    subtitle(strcat('r=',corr_coef_str_CVRratioGEOverSE_vs_MD,''),'FontWeight','bold','FontSize',19);
end

title(strcat(['CVR Ratio CVR\_BOLDGE/CVR\_BOLDSE vs MD, ti' ...
    'ssue='],tissue),'FontWeight','bold','FontSize',19)

%%

idx_MD = find(isnan(median_MD_map_tissue_subjs(:)));
idx_CVRmap = find(isnan(median_CVRratio_GEoverSE_BOLDGM_tissue_subjs(:)));
idx_PVE = find(isnan(median_PVE_tissue_dwi_maps(:)));
% idx_PVE = find(isnan(median_PVE_tissue_cvr_maps(:)));
idx_tot = unique(cat(1,idx_MD,idx_CVRmap,idx_PVE));

x = median_MD_map_tissue_subjs(:);
y = median_CVRratio_GEoverSE_BOLDGM_tissue_subjs(:);
PVE = median_PVE_tissue_dwi_maps(:);

x(idx_tot)=[];
y(idx_tot)=[];
PVE(idx_tot)=[];

x=zscore(x);
y=zscore(y);
PVE=zscore(PVE);

tbl=table(x,y,PVE, 'VariableNames', ...
    {'MD','CVRratio','PVE'});%being tissue='GM', PVE is GM PVE
%build your model
mdl=fitlm(tbl,'CVRratio ~ MD ','RobustOpts','on')%+ PVE

%%
load("data_261021.mat")

%% study the dependence of SE and GE signal on diffusion MD 
% in regions divided according to the size of vessels

%% I approach: multiply the map of vessel density by Harvard Oxford atlas and check the dependence in each ROI defined by the Harvard Oxford

% BrainCharter
img_path_venous_density_prob = '/media/nas_rete/Work_manuela/DEXIGESEDiffProject/SUBJ2MNI/MEAN_Harvard_Oxford_swi_ved_on_MNI152_T1_2mm_brain.nii.gz';
V_vol_venous_density_prob = spm_vol(img_path_venous_density_prob);
V_venous_density_prob=spm_read_vols(V_vol_venous_density_prob);

% figure, hist(V_venous_density_prob(:))
% 
% V_venous_density_prob_hist=V_venous_density_prob;
% V_venous_density_prob_hist(V_venous_density_prob_hist==0)=[];
% figure, hist(V_venous_density_prob_hist(:))
% set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
% set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
% set(gca,'box','off')
% ylabel('Counts','FontWeight','bold','FontSize',19,'FontName','Calibri')
% xlabel('Prob venous density values','FontWeight','bold','FontSize',19,'FontName','Calibri')
% grid on

% VENAT
img_path_venous_density_prob = '/media/nas_rete/Work_manuela/DEXIGESEDiffProject/SUBJ2MNI/atlas/venat/VENAT_DensityMap_on_MNI152_T1_2mm_brain_NearestNeighbor.nii.gz';
V_vol_venous_density_prob = spm_vol(img_path_venous_density_prob);
V_venous_density_prob=spm_read_vols(V_vol_venous_density_prob);

V_venous_density_prob_hist=V_venous_density_prob;
V_venous_density_prob_hist(V_venous_density_prob_hist==0)=[];
figure, hist(V_venous_density_prob_hist(:))
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Counts','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Prob venous density values','FontWeight','bold','FontSize',19,'FontName','Calibri')
grid on

img_path_venous_density_labels = '/usr/local/fsl/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz';
V_vol_venous_density_labels = spm_vol(img_path_venous_density_labels);
V_venous_density_labels=spm_read_vols(V_vol_venous_density_labels);

% figure, imagesc(rot90(V_venous_density_cortlabels(:,:,45)))

regions = unique(V_venous_density_labels(:));
regions(regions==0)=[];

% img_path_venous_density_subcortlabels = '/usr/local/fsl/data/atlases/HarvardOxford/HarvardOxford-sub-maxprob-thr25-2mm.nii.gz';
% V_vol_venous_density_subcortlabels = spm_vol(img_path_venous_density_subcortlabels);
% V_venous_density_subcortlabels=spm_read_vols(V_vol_venous_density_subcortlabels);
% 
% figure, imagesc(rot90(V_venous_density_subcortlabels(:,:,45)))
% 
% subcortregions = unique(V_venous_density_subcortlabels(:));
% subcortregions(subcortregions==0)=[];


%%%%%% analysis for each subject

MD_regional_vessatlas_median_subjs = [];
CVRratio_regional_vessatlas_median_subjs =  [];

corrcoef_cvrratiovsMD_region_vessatlas_subjs = []; 
prob_venous_density_regional_subjs = [];

V_PVE_tissue_subjs = V_PVE_tissue_cvr_maps; 

pvalue_regional_MD_subjs = [];
estimate_regional_MD_subjs = [];

for subj = 1:n_subjs

    disp(strcat('subj',num2str(subj)))
    
    MD_regional_vessatlas_median_subj = [];
    CVRratio_regional_vessatlas_median_subj =  [];

    corrcoef_cvrratiovsMD_region_vessatlas_subj =  [];
    prob_venous_density_regional_subj = [];

    pvalue_regional_MD_subj = [];
    estimate_regional_MD_subj = [];

    CVRratio_GEoverSE_BOLDGM_tissue = CVRratio_GEoverSE_BOLDGM_tissue_subjs{subj};
    MD_map_tissue = MD_map_tissue_subjs{subj};
    V_PVE_tissue = V_PVE_tissue_subjs{subj};
                       

    V_venous_density_labels_mask=V_venous_density_labels; 
    V_venous_density_prob_mask=V_venous_density_prob;

    for region = 1:length(regions)

        for ii = 1:length(V_venous_density_labels(:))
            if V_venous_density_labels(ii) == regions(region)
                V_venous_density_labels_mask(ii) = 1;
            else
                V_venous_density_labels_mask(ii) = 0;
            end
        end

        MD_regional = V_venous_density_labels_mask.*MD_map_tissue;
        CVRratio_regional =  V_venous_density_labels_mask.*CVRratio_GEoverSE_BOLDGM_tissue;
        prob_venous_density_regional = V_venous_density_labels_mask.*V_venous_density_prob_mask;
        V_PVE_tissue_regional = V_venous_density_labels_mask.*V_PVE_tissue;

        MD_regional(V_venous_density_labels_mask==0)=[];
        CVRratio_regional(V_venous_density_labels_mask==0)=[];
        prob_venous_density_regional(V_venous_density_labels_mask==0)=[];
        V_PVE_tissue_regional(V_venous_density_labels_mask==0)=[];

        %compute all quantities
        MD_regional_vessatlas_median = nanmedian(MD_regional(:));
        CVRratio_regional_vessatlas_median =  nanmedian(CVRratio_regional(:));
  
        [r,p] = corrcoef(MD_regional(:),CVRratio_regional(:),'rows','complete');

        V_PVE_tissue_regional_median = nanmedian(V_PVE_tissue_regional(:));

        %glm corrected for pve

        MD_regional_vessatlas_zscored = nanzscore(MD_regional(:));
        CVRratio_regional_vessatlas_zscored = nanzscore(CVRratio_regional(:));
        V_PVE_tissue_regional_zscored = nanzscore(V_PVE_tissue_regional(:));
        tbl = table(CVRratio_regional_vessatlas_zscored,MD_regional_vessatlas_zscored,V_PVE_tissue_regional_zscored,'VariableNames', ...
            {'CVRratio','MD','PVE_tissue'});

        %build your model
        mdl=fitlm(tbl,'CVRratio ~ MD + PVE_tissue','RobustOpts','on');
    
        coeffs_mat=table2array(mdl.Coefficients);
        pvalue_regional_MD=coeffs_mat(2,4);
        estimate_regional_MD=coeffs_mat(2,1);

        % append the result of a region of a subject
        MD_regional_vessatlas_median_subj(end+1) = MD_regional_vessatlas_median;
        CVRratio_regional_vessatlas_median_subj(end+1) =  CVRratio_regional_vessatlas_median;
        corrcoef_cvrratiovsMD_region_vessatlas_subj(end+1) =  r(2);  
        prob_venous_density_regional_subj(end+1) = median(prob_venous_density_regional);

        pvalue_regional_MD_subj(end+1) = pvalue_regional_MD;
        estimate_regional_MD_subj(end+1) = estimate_regional_MD;

    end
    
    %append the results of all regions of a subject
    MD_regional_vessatlas_median_subjs(subj,1:length(regions)) = MD_regional_vessatlas_median_subj;
    CVRratio_regional_vessatlas_median_subjs(subj,1:length(regions)) =  CVRratio_regional_vessatlas_median_subj;
    corrcoef_cvrratiovsMD_region_vessatlas_subjs(subj,1:length(regions)) =  corrcoef_cvrratiovsMD_region_vessatlas_subj;  
    prob_venous_density_regional_subjs(subj,1:length(regions)) = prob_venous_density_regional_subj;

    pvalue_regional_MD_subjs(subj,1:length(regions)) = pvalue_regional_MD_subj;
    estimate_regional_MD_subjs(subj,1:length(regions)) = estimate_regional_MD_subj;
end

%% corr coef plots

figure,
for subj = 1:n_subjs
subplot(4,5,subj)
scatter(prob_venous_density_regional_subjs(subj,:),corrcoef_cvrratiovsMD_region_vessatlas_subjs(subj,:),"filled",SizeData=50)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
% ylabel('r','FontWeight','bold','FontSize',19,'FontName','Calibri')
% xlabel('Prob venous density','FontWeight','bold','FontSize',19,'FontName','Calibri')
title(strcat('subj-',num2str(subj)), 'FontWeight', 'bold','FontSize',14)
sgtitle('Correlation Coefficient (CVRratio vs MD) vs venous density', 'FontWeight', 'bold','FontSize',18)
ylim([-0.2,0.35])
grid on
end

figure,
for subj = 1:n_subjs
subplot(4,5,subj)
scatter(prob_venous_density_regional_subjs(subj,:),estimate_regional_MD_subjs(subj,:),"filled",SizeData=50)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
% ylabel('r','FontWeight','bold','FontSize',19,'FontName','Calibri')
%xlabel('Prob venous density','FontWeight','bold','FontSize',19,'FontName','Calibri')
title(strcat('subj-',num2str(subj)), 'FontWeight', 'bold','FontSize',14)
sgtitle('Regression Coefficient (CVRratio vs MD) vs venous density', 'FontWeight', 'bold','FontSize',18)
% ylim([-0.2,0.35])
grid on
end

figure,
for subj = 1:n_subjs
subplot(4,5,subj)
scatter(prob_venous_density_regional_subjs(subj,:),pvalue_regional_MD_subjs(subj,:),"filled",SizeData=50)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
% ylabel('r','FontWeight','bold','FontSize',19,'FontName','Calibri')
%xlabel('Prob venous density','FontWeight','bold','FontSize',19,'FontName','Calibri')
title(strcat('subj-',num2str(subj)), 'FontWeight', 'bold','FontSize',14)
sgtitle('pvalues (CVRratio vs MD) vs venous density', 'FontWeight', 'bold','FontSize',18)
% ylim([-0.2,0.35])
grid on
end

%%
load("data_261021.mat")

%%
%%%%%%% working on the map of median across subjects

% BrainCharter
img_path_venous_density_prob = '/media/nas_rete/Work_manuela/DEXIGESEDiffProject/SUBJ2MNI/MEAN_Harvard_Oxford_swi_ved_on_MNI152_T1_2mm_brain.nii.gz';
V_vol_venous_density_prob = spm_vol(img_path_venous_density_prob);
V_venous_density_prob=spm_read_vols(V_vol_venous_density_prob);
V_venous_density_prob_corrected = V_venous_density_prob./10;
% % VENAT
% img_path_venous_density_prob = '/media/nas_rete/Work_manuela/DEXIGESEDiffProject/SUBJ2MNI/atlas/venat/VENAT_DensityMap_on_MNI152_T1_2mm_brain_NearestNeighbor.nii.gz';
% V_vol_venous_density_prob = spm_vol(img_path_venous_density_prob);
% V_venous_density_prob=spm_read_vols(V_vol_venous_density_prob);

img_path_venous_density_labels = '/usr/local/fsl/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz';
V_vol_venous_density_labels = spm_vol(img_path_venous_density_labels);
V_venous_density_labels=spm_read_vols(V_vol_venous_density_labels);

% figure, imagesc(rot90(V_venous_density_cortlabels(:,:,45)))

regions = unique(V_venous_density_labels(:));
regions(regions==0)=[];

median_PVE_tissue_maps=median_PVE_tissue_cvr_maps;

%%%%%

MD_regional_vessatlas_medians_tot = [];
CVRratio_regional_vessatlas_medians_tot =  [];
CVRBOLD_GE_regional_vessatlas_medians_tot =  [];
CVRBOLD_SE_regional_vessatlas_medians_tot =  [];   
 

corrcoef_cvrratiovsMD_region_vessatlas_tot =  [];
prob_venous_density_regional_tot = [];


corrcoef_CVRSEvsMD_region_vessatlas_tot = [];                 
corrcoef_CVRGEvsMD_region_vessatlas_tot = [];                 

pvalue_regional_cvrratiovsMD_zscored_tot = [];
estimate_regional_cvrratiovsMD_zscored_tot = []; 

pvalue_regional_cvrBOLDSEvsMD_zscored_tot = [];
estimate_regional_cvrBOLDSEvsMD_zscored_tot = []; 

pvalue_regional_cvrBOLDGEvsMD_zscored_tot = [];
estimate_regional_cvrBOLDGEvsMD_zscored_tot = []; 

pvalue_regional_cvrratiovsMD_tot = [];
estimate_regional_cvrratiovsMD_tot = [];

pvalue_regional_cvrBOLDSEvsMD_tot = [];
estimate_regional_cvrBOLDSEvsMD_tot = [];  

pvalue_regional_cvrBOLDGEvsMD_tot = [];
estimate_regional_cvrBOLDGEvsMD_tot = []; 

n_voxels_tot = [];

% if you want to plot boxplots 

% n_voxels_tot=length(V_venous_density_prob(:));

% CVRBOLD_SE_regionalvoxels_vessatlas_tot = zeros(n_voxels_tot,length(regions));
% CVRBOLD_GE_regionalvoxels_vessatlas_tot = zeros(n_voxels_tot,length(regions));
% CVRratio_regionalvoxels_vessatlas_tot = zeros(n_voxels_tot,length(regions));
% MD_regionalvoxels_vessatlas_tot = zeros(n_voxels_tot,length(regions));

for region = 1:length(regions)

    V_venous_density_labels_mask=V_venous_density_labels; 
%     V_venous_density_prob_mask=V_venous_density_prob;

    for ii = 1:length(V_venous_density_labels(:))
        if V_venous_density_labels(ii) == regions(region)
            V_venous_density_labels_mask(ii) = 1;
        else
            V_venous_density_labels_mask(ii) = 0;
        end
    end

    MD_regional = V_venous_density_labels_mask.*median_MD_map_tissue_subjs;
    CVRratio_regional =  V_venous_density_labels_mask.*median_CVRratio_GEoverSE_BOLDGM_tissue_subjs;
    prob_venous_density_regional = V_venous_density_labels_mask.*V_venous_density_prob_corrected;
    CVRBOLD_GE_regional = V_venous_density_labels_mask.*median_BOLDGM_CVRBOLD_GE_map_tissue_subjs;
    CVRBOLD_SE_regional = V_venous_density_labels_mask.*median_BOLDGM_CVRBOLD_SE_map_tissue_subjs;
    PVE_tissue_regional = V_venous_density_labels_mask.*median_PVE_tissue_maps;

    MD_regional(V_venous_density_labels_mask==0)=[];
    CVRratio_regional(V_venous_density_labels_mask==0)=[];
    prob_venous_density_regional(V_venous_density_labels_mask==0)=[];
    CVRBOLD_GE_regional(V_venous_density_labels_mask==0)=[];
    CVRBOLD_SE_regional(V_venous_density_labels_mask==0)=[];
    PVE_tissue_regional(V_venous_density_labels_mask==0)=[];

    MD_regional_vessatlas_median = nanmedian(MD_regional(:));
    CVRratio_regional_vessatlas_median =  nanmedian(CVRratio_regional(:));
    CVRBOLD_GE_regional_vessatlas_median = nanmedian(CVRBOLD_GE_regional(:));
    CVRBOLD_SE_regional_vessatlas_median = nanmedian(CVRBOLD_SE_regional(:));
    n_voxels = length(MD_regional(:));

    [r_cvrratiovsMD,p] = corrcoef(MD_regional(:),CVRratio_regional(:),'rows','complete');
    [r_CVRSEvsMD,p] = corrcoef(MD_regional(:),CVRBOLD_SE_regional(:),'rows','complete');
    [r_CVRGEvsMD,p] = corrcoef(MD_regional(:),CVRBOLD_GE_regional(:),'rows','complete');

    %compute glm regressing out pve
    MD_regional_zscored = nanzscore(MD_regional(:));
    CVRratio_regional_zscored = nanzscore(CVRratio_regional(:));
    CVRBOLD_SE_regional_zscored = nanzscore(CVRBOLD_SE_regional(:));
    CVRBOLD_GE_regional_zscored = nanzscore(CVRBOLD_GE_regional(:));

    PVE_tissue_regional_zscored = nanzscore(PVE_tissue_regional(:));

    tbl_zscored = table(CVRratio_regional_zscored,CVRBOLD_SE_regional_zscored, CVRBOLD_GE_regional_zscored, MD_regional_zscored,PVE_tissue_regional_zscored,'VariableNames', ...
            {'CVRratio', 'CVRBOLD_SE','CVRBOLD_GE','MD','PVE_tissue'});

    %build your model
    mdl_cvrratiovsMD_zscored=fitlm(tbl,'CVRratio ~ MD + PVE_tissue','RobustOpts','on');
    mdl_cvrBOLDSEvsMD_zscored=fitlm(tbl,'CVRBOLD_SE ~ MD + PVE_tissue','RobustOpts','on');
    mdl_cvrBOLDGEvsMD_zscored=fitlm(tbl,'CVRBOLD_GE ~ MD + PVE_tissue','RobustOpts','on');


    coeffs_mat_cvrratiovsMD_zscored=table2array(mdl_cvrratiovsMD_zscored.Coefficients);
    pvalue_regional_cvrratiovsMD_zscored=coeffs_mat_cvrratiovsMD_zscored(2,4);
    estimate_regional_cvrratiovsMD_zscored=coeffs_mat_cvrratiovsMD_zscored(2,1);

    coeffs_mat_cvrBOLDSEvsMD_zscored=table2array(mdl_cvrBOLDSEvsMD_zscored.Coefficients);
    pvalue_regional_cvrBOLDSEvsMD_zscored=coeffs_mat_cvrBOLDSEvsMD_zscored(2,4);
    estimate_regional_cvrBOLDSEvsMD_zscored=coeffs_mat_cvrBOLDSEvsMD_zscored(2,1);

    coeffs_mat_cvrBOLDGEvsMD_zscored=table2array(mdl_cvrBOLDGEvsMD_zscored.Coefficients);
    pvalue_regional_cvrBOLDGEvsMD_zscored=coeffs_mat_cvrBOLDGEvsMD_zscored(2,4);
    estimate_regional_cvrBOLDGEvsMD_zscored=coeffs_mat_cvrBOLDGEvsMD_zscored(2,1);

    % compute glm regressing out pve using original unit of measure

    tbl = table(CVRratio_regional(:),CVRBOLD_SE_regional(:), CVRBOLD_GE_regional(:), MD_regional(:),PVE_tissue_regional(:),'VariableNames', ...
            {'CVRratio', 'CVRBOLD_SE','CVRBOLD_GE','MD','PVE_tissue'});

    %build your model
    mdl_cvrratiovsMD=fitlm(tbl,'CVRratio ~ MD + PVE_tissue','RobustOpts','on');
    mdl_cvrBOLDSEvsMD=fitlm(tbl,'CVRBOLD_SE ~ MD + PVE_tissue','RobustOpts','on');
    mdl_cvrBOLDGEvsMD=fitlm(tbl,'CVRBOLD_GE ~ MD + PVE_tissue','RobustOpts','on');


    coeffs_mat_cvrratiovsMD=table2array(mdl_cvrratiovsMD.Coefficients);
    pvalue_regional_cvrratiovsMD=coeffs_mat_cvrratiovsMD(2,4);
    estimate_regional_cvrratiovsMD=coeffs_mat_cvrratiovsMD(2,1);

    coeffs_mat_cvrBOLDSEvsMD=table2array(mdl_cvrBOLDSEvsMD.Coefficients);
    pvalue_regional_cvrBOLDSEvsMD=coeffs_mat_cvrBOLDSEvsMD(2,4);
    estimate_regional_cvrBOLDSEvsMD=coeffs_mat_cvrBOLDSEvsMD(2,1);

    coeffs_mat_cvrBOLDGEvsMD=table2array(mdl_cvrBOLDGEvsMD.Coefficients);
    pvalue_regional_cvrBOLDGEvsMD=coeffs_mat_cvrBOLDGEvsMD(2,4);
    estimate_regional_cvrBOLDGEvsMD=coeffs_mat_cvrBOLDGEvsMD(2,1);


    % append results

    MD_regional_vessatlas_medians_tot(end+1) = MD_regional_vessatlas_median;
    CVRratio_regional_vessatlas_medians_tot(end+1) =  CVRratio_regional_vessatlas_median;
    CVRBOLD_GE_regional_vessatlas_medians_tot(end+1) =  CVRBOLD_GE_regional_vessatlas_median;
    CVRBOLD_SE_regional_vessatlas_medians_tot(end+1) =  CVRBOLD_SE_regional_vessatlas_median;   
    corrcoef_cvrratiovsMD_region_vessatlas_tot(end+1) =  r_cvrratiovsMD(2);  
    corrcoef_CVRSEvsMD_region_vessatlas_tot(end+1) =  r_CVRSEvsMD(2);  
    corrcoef_CVRGEvsMD_region_vessatlas_tot(end+1) =  r_CVRGEvsMD(2);  
    prob_venous_density_regional_tot(end+1) = median(prob_venous_density_regional);

    pvalue_regional_cvrratiovsMD_zscored_tot(end+1) = pvalue_regional_cvrratiovsMD_zscored;
    estimate_regional_cvrratiovsMD_zscored_tot(end+1) = estimate_regional_cvrratiovsMD_zscored;  

    pvalue_regional_cvrBOLDSEvsMD_zscored_tot(end+1) = pvalue_regional_cvrBOLDSEvsMD_zscored;
    estimate_regional_cvrBOLDSEvsMD_zscored_tot(end+1) = estimate_regional_cvrBOLDSEvsMD_zscored;  

    pvalue_regional_cvrBOLDGEvsMD_zscored_tot(end+1) = pvalue_regional_cvrBOLDGEvsMD_zscored;
    estimate_regional_cvrBOLDGEvsMD_zscored_tot(end+1) = estimate_regional_cvrBOLDGEvsMD_zscored;  

    pvalue_regional_cvrratiovsMD_tot(end+1) = pvalue_regional_cvrratiovsMD;
    estimate_regional_cvrratiovsMD_tot(end+1) = estimate_regional_cvrratiovsMD;  

    pvalue_regional_cvrBOLDSEvsMD_tot(end+1) = pvalue_regional_cvrBOLDSEvsMD;
    estimate_regional_cvrBOLDSEvsMD_tot(end+1) = estimate_regional_cvrBOLDSEvsMD;  

    pvalue_regional_cvrBOLDGEvsMD_tot(end+1) = pvalue_regional_cvrBOLDGEvsMD;
    estimate_regional_cvrBOLDGEvsMD_tot(end+1) = estimate_regional_cvrBOLDGEvsMD;  

 
    n_voxels_tot(end+1)=n_voxels;

    % % if you want to plot the distribution
%     CVRBOLD_SE_regionalvoxels_vessatlas_tot(n_voxels_tot,region)=CVRBOLD_SE_regional(:);
%     CVRBOLD_GE_regionalvoxels_vessatlas_tot(n_voxels_tot,region)=CVRBOLD_GE_regional(:);
%     CVRratio_regionalvoxels_vessatlas_tot(n_voxels_tot,region)=CVRratio_regional(:);
%     MD_regionalvoxels_vessatlas_tot(n_voxels_tot,region)=MD_regional(:);



end

%% check CVRs and MD dependence on macrovascular density 

figure,
subplot(2,2,1)
s=scatter(prob_venous_density_regional_tot,CVRratio_regional_vessatlas_medians_tot,150, "filled")
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('CVR_{ratio}','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Venous Density (%)','FontWeight','bold','FontSize',19,'FontName','Calibri')
[r,p] = corrcoef(prob_venous_density_regional_tot,CVRratio_regional_vessatlas_medians_tot);
corr_coef_str = num2str(round(r(2),2));
% title('CVR_{ratio} vs MD','FontSize',25)
% text(8.7,55,txt,'FontWeight', 'Bold','FontSize',18);
% ylim([-0.4,0.8])
grid on

subplot(2,2,2)
s=scatter(prob_venous_density_regional_tot,MD_regional_vessatlas_medians_tot,150, "filled")
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('MD(mm^2/s)','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Venous Density (%)','FontWeight','bold','FontSize',19,'FontName','Calibri')
% [r,p] = corrcoef(prob_venous_density_regional_tot,CVRratio_regional_vessatlas_medians_tot);
% corr_coef_str = num2str(round(r(2),2));
% title('CVR_{ratio} vs MD','FontSize',25)
% text(8.7,55,txt,'FontWeight', 'Bold','FontSize',18);
% ylim([-0.4,0.8])
grid on

subplot(2,2,3)
s=scatter(prob_venous_density_regional_tot,CVRBOLD_GE_regional_vessatlas_medians_tot,150, "filled")
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('GE-BOLD-CVR','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Venous Density (%)','FontWeight','bold','FontSize',19,'FontName','Calibri')
% [r,p] = corrcoef(prob_venous_density_regional_tot,CVRratio_regional_vessatlas_medians_tot);
% corr_coef_str = num2str(round(r(2),2));
% title('CVR_{ratio} vs MD','FontSize',25)
% text(8.7,55,txt,'FontWeight', 'Bold','FontSize',18);
% ylim([-0.4,0.8])
grid on

subplot(2,2,4)
s=scatter(prob_venous_density_regional_tot,CVRBOLD_SE_regional_vessatlas_medians_tot,150, "filled")
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('SE-BOLD-CVR','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Venous Density (%)','FontWeight','bold','FontSize',19,'FontName','Calibri')
% [r,p] = corrcoef(prob_venous_density_regional_tot,CVRratio_regional_vessatlas_medians_tot);
% corr_coef_str = num2str(round(r(2),2));
% title('CVR_{ratio} vs MD','FontSize',25)
% text(8.7,55,txt,'FontWeight', 'Bold','FontSize',18);
% ylim([-0.4,0.8])
sgtitle('Effects of Macrovascular Venous Density','FontWeight','bold','FontSize',25,'FontName','Calibri')
grid on

%%
% check MD dependence on macrovascular density


%% corr coef trends

figure,
scatter(prob_venous_density_regional_tot,corrcoef_cvrratiovsMD_region_vessatlas_tot,"filled",SizeData=50)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Correlation Coefficient, r','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Prob venous density','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('CVRratio vs MD')
% ylim([-0.2,0.4])
grid on


figure,
scatter(prob_venous_density_regional_tot,corrcoef_CVRSEvsMD_region_vessatlas_tot,"filled",SizeData=50)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Correlation Coefficient, r','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Prob venous density','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('CVR SPIN ECHO vs MD')
% ylim([-0.2,0.4])
grid on

figure,
scatter(prob_venous_density_regional_tot,corrcoef_CVRGEvsMD_region_vessatlas_tot,"filled",SizeData=50)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Correlation Coefficient, r','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Prob venous density','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('CVR GRADIENT ECHO vs MD')
% ylim([-0.2,0.4])
grid on


%% regression coefficient estimates

figure,
subplot(1,3,1)
s=scatter(prob_venous_density_regional_tot,estimate_regional_cvrratiovsMD_tot,150, "filled")
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Regression Coefficient (%s/mm^2)','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Venous Density (%)','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('CVR_{ratio} vs MD','FontSize',25)
% ylim([-0.4,0.8])
grid on


subplot(1,3,2)
s=scatter(prob_venous_density_regional_tot,estimate_regional_cvrBOLDSEvsMD_tot,150, "filled")
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Regression Coefficient (%s/mm^2)','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Venous Density (%)','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('SE-BOLD-CVR vs MD','FontSize',25)
% ylim([-0.4,0.8])
grid on

subplot(1,3,3)
s=scatter(prob_venous_density_regional_tot,estimate_regional_cvrBOLDGEvsMD_tot,150,"filled")
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Regression Coefficient (%s/mm^2)','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Venous Density (%)','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('GE-BOLD-CVR vs MD','FontSize',25)
% ylim([-0.4,0.8])
sgtitle('CVRs vs MD','FontWeight','bold','FontSize',25,'FontName','Calibri')
grid on

%% pvalues

figure,
subplot(1,3,1)
s=scatter(prob_venous_density_regional_tot,pvalue_regional_cvrratiovsMD_tot,150, "filled")
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('p-value','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Venous Density (%)','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('CVR_{ratio} vs MD','FontSize',25)
ylim([-0.4,0.8])
grid on


subplot(1,3,2)
s=scatter(prob_venous_density_regional_tot,pvalue_regional_cvrBOLDSEvsMD_tot,150, "filled")
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('p-value','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Venous Density (%)','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('SE-BOLD-CVR vs MD','FontSize',25)
ylim([-0.4,0.8])
grid on

subplot(1,3,3)
s=scatter(prob_venous_density_regional_tot,pvalue_regional_cvrBOLDGEvsMD_tot,150,"filled")
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('p-value','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Venous Density (%)','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('GE-BOLD-CVR vs MD','FontSize',25)
ylim([-0.4,0.8])
sgtitle('CVRs vs MD','FontWeight','bold','FontSize',25,'FontName','Calibri')
grid on

%%

figure,
s=scatter(prob_venous_density_regional_tot,n_voxels_tot,150,"filled")
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('# voxels','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Venous Density (%)','FontWeight','bold','FontSize',19,'FontName','Calibri')
% title('GE-BOLD-CVR vs MD','FontSize',25)
% ylim([-0.4,0.8])
sgtitle('CVRs vs MD','FontWeight','bold','FontSize',25,'FontName','Calibri')
grid on

%%
figure,
hist(n_voxels_tot)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('# voxels','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Venous Density (%)','FontWeight','bold','FontSize',19,'FontName','Calibri')
% title('GE-BOLD-CVR vs MD','FontSize',25)
% ylim([-0.4,0.8])
sgtitle('CVRs vs MD','FontWeight','bold','FontSize',25,'FontName','Calibri')
grid on

%% II APPROACH for the analysis: create a categorical map based on the values of probability of vessels
%loosing info about the anatomical information
%working on the median across subjects

median_PVE_tissue_maps=median_PVE_tissue_cvr_maps;

% % BrainCharter
% img_path_venous_density_prob = '/media/nas_rete/Work_manuela/DEXIGESEDiffProject/SUBJ2MNI/MEAN_Harvard_Oxford_swi_ved_on_MNI152_T1_2mm_brain.nii.gz';
% V_vol_venous_density_prob = spm_vol(img_path_venous_density_prob);
% V_venous_density_prob=spm_read_vols(V_vol_venous_density_prob);
% 
% diff=10;
% prob_groups=40:diff:130;
% figure, hist(V_venous_density_prob(:))
% 


%Venat
img_path_venous_density_prob = '/media/nas_rete/Work_manuela/DEXIGESEDiffProject/SUBJ2MNI/atlas/venat/VENAT_DensityMap_on_MNI152_T1_2mm_brain_NearestNeighbor.nii.gz';
V_vol_venous_density_prob = spm_vol(img_path_venous_density_prob);
V_venous_density_prob=spm_read_vols(V_vol_venous_density_prob);

diff=0.1;
prob_groups=0.1:diff:0.9;

% %create a categorical map based on venous density

MD_regional_vessatlas_medians_tot=[];
CVRratio_regional_vessatlas_medians_tot=[];
CVRBOLD_GE_regional_vessatlas_medians_tot=[];
CVRBOLD_SE_regional_vessatlas_medians_tot=[];  
V_venous_density_prob_regional_median_tot=[];

corrcoef_cvrratiovsMD_region_vessatlas_tot=[];
corrcoef_CVRSEvsMD_region_vessatlas_tot=[];
corrcoef_CVRGEvsMD_region_vessatlas_tot=[];  

pvalue_regional_cvrratiovsMD_tot = [];
estimate_regional_cvrratiovsMD_tot = []; 

pvalue_regional_cvrBOLDSEvsMD_tot = [];
estimate_regional_cvrBOLDSEvsMD_tot = []; 

pvalue_regional_cvrBOLDGEvsMD_tot = [];
estimate_regional_cvrBOLDGEvsMD_tot = [];

for region = 1:length(prob_groups)
 
    V_venous_density_prob_mask=V_venous_density_prob;

    for ii = 1:length(V_venous_density_prob(:))
        if V_venous_density_prob(ii) > prob_groups(region) && V_venous_density_prob(ii) < prob_groups(region)+diff 
            V_venous_density_prob_mask(ii) = 1;
        else
            V_venous_density_prob_mask(ii) = 0;
        end
    end

    MD_regional = V_venous_density_prob_mask.*median_MD_map_tissue_subjs;
    CVRratio_regional =  V_venous_density_prob_mask.*median_CVRratio_GEoverSE_BOLDGM_tissue_subjs;
    CVRBOLD_GE_regional = V_venous_density_prob_mask.*median_BOLDGM_CVRBOLD_GE_map_tissue_subjs;
    CVRBOLD_SE_regional = V_venous_density_prob_mask.*median_BOLDGM_CVRBOLD_SE_map_tissue_subjs;
    V_venous_density_prob_regional = V_venous_density_prob_mask.*V_venous_density_prob;
    PVE_tissue_regional = V_venous_density_prob_mask.*median_PVE_tissue_maps;

    MD_regional(V_venous_density_prob_mask==0)=[];
    CVRratio_regional(V_venous_density_prob_mask==0)=[];
    CVRBOLD_GE_regional(V_venous_density_prob_mask==0)=[];
    CVRBOLD_SE_regional(V_venous_density_prob_mask==0)=[];
    V_venous_density_prob_regional(V_venous_density_prob_mask==0)=[];
    PVE_tissue_regional(V_venous_density_prob_mask==0)=[];

    MD_regional_vessatlas_median = nanmedian(MD_regional(:));
    CVRratio_regional_vessatlas_median =  nanmedian(CVRratio_regional(:));
    CVRBOLD_GE_regional_median = nanmedian(CVRBOLD_GE_regional(:));
    CVRBOLD_SE_regional_median = nanmedian(CVRBOLD_SE_regional(:));
    V_venous_density_prob_regional_median = nanmedian(V_venous_density_prob_regional(:));


    [r_cvrratiovsMD,p] = corrcoef(MD_regional(:),CVRratio_regional(:),'rows','complete');
    [r_CVRSEvsMD,p] = corrcoef(MD_regional(:),CVRBOLD_SE_regional(:),'rows','complete');
    [r_CVRGEvsMD,p] = corrcoef(MD_regional(:),CVRBOLD_GE_regional(:),'rows','complete');

    %compute glm regressing out pve
    MD_regional_zscored = nanzscore(MD_regional(:));
    CVRratio_regional_zscored = nanzscore(CVRratio_regional(:));
    CVRBOLD_SE_regional_zscored = nanzscore(CVRBOLD_SE_regional(:));
    CVRBOLD_GE_regional_zscored = nanzscore(CVRBOLD_GE_regional(:));

    PVE_tissue_regional_scored = nanzscore(PVE_tissue_regional(:));

    tbl = table(CVRratio_regional_zscored,CVRBOLD_SE_regional_zscored, CVRBOLD_GE_regional_zscored, MD_regional_zscored,PVE_tissue_regional_scored,'VariableNames', ...
            {'CVRratio', 'CVRBOLD_SE','CVRBOLD_GE','MD','PVE_tissue'});

    %build your model
    mdl_cvrratiovsMD=fitlm(tbl,'CVRratio ~ MD + PVE_tissue','RobustOpts','on');
    mdl_cvrBOLDSEvsMD=fitlm(tbl,'CVRBOLD_SE ~ MD + PVE_tissue','RobustOpts','on');
    mdl_cvrBOLDGEvsMD=fitlm(tbl,'CVRBOLD_GE ~ MD + PVE_tissue','RobustOpts','on');


    coeffs_mat_cvrratiovsMD=table2array(mdl_cvrratiovsMD.Coefficients);
    pvalue_regional_cvrratiovsMD=coeffs_mat_cvrratiovsMD(2,4);
    estimate_regional_cvrratiovsMD=coeffs_mat_cvrratiovsMD(2,1);

    coeffs_mat_cvrBOLDSEvsMD=table2array(mdl_cvrBOLDSEvsMD.Coefficients);
    pvalue_regional_cvrBOLDSEvsMD=coeffs_mat_cvrBOLDSEvsMD(2,4);
    estimate_regional_cvrBOLDSEvsMD=coeffs_mat_cvrBOLDSEvsMD(2,1);

    coeffs_mat_cvrBOLDGEvsMD=table2array(mdl_cvrBOLDGEvsMD.Coefficients);
    pvalue_regional_cvrBOLDGEvsMD=coeffs_mat_cvrBOLDGEvsMD(2,4);
    estimate_regional_cvrBOLDGEvsMD=coeffs_mat_cvrBOLDGEvsMD(2,1);

    MD_regional_vessatlas_medians_tot(end+1) = MD_regional_vessatlas_median;
    CVRratio_regional_vessatlas_medians_tot(end+1) =  CVRratio_regional_vessatlas_median;
    CVRBOLD_GE_regional_vessatlas_medians_tot(end+1)=CVRBOLD_GE_regional_median;
    CVRBOLD_SE_regional_vessatlas_medians_tot(end+1)=CVRBOLD_SE_regional_median;  
    V_venous_density_prob_regional_median_tot(end+1) = V_venous_density_prob_regional_median;
    corrcoef_cvrratiovsMD_region_vessatlas_tot(end+1) =  r_cvrratiovsMD(2);  
    corrcoef_CVRSEvsMD_region_vessatlas_tot(end+1) =  r_CVRSEvsMD(2);  
    corrcoef_CVRGEvsMD_region_vessatlas_tot(end+1) =  r_CVRGEvsMD(2);  

        pvalue_regional_cvrratiovsMD_tot(end+1) = pvalue_regional_cvrratiovsMD;
    estimate_regional_cvrratiovsMD_tot(end+1) = estimate_regional_cvrratiovsMD;  

    pvalue_regional_cvrBOLDSEvsMD_tot(end+1) = pvalue_regional_cvrBOLDSEvsMD;
    estimate_regional_cvrBOLDSEvsMD_tot(end+1) = estimate_regional_cvrBOLDSEvsMD;  

    pvalue_regional_cvrBOLDGEvsMD_tot(end+1) = pvalue_regional_cvrBOLDGEvsMD;
    estimate_regional_cvrBOLDGEvsMD_tot(end+1) = estimate_regional_cvrBOLDGEvsMD;  


end

%% corr coef

prob_groups_categorical = 1:1:length(prob_groups);

figure,
scatter(prob_groups_categorical,corrcoef_cvrratiovsMD_region_vessatlas_tot,"filled",SizeData=50)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Correlation Coefficient, r','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Prob venous density','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('CVR_{ratio} vs MD','FontSize',25)
% ylim([-0.2,0.4])
grid on


figure,
scatter(prob_groups_categorical,corrcoef_CVRSEvsMD_region_vessatlas_tot,"filled",SizeData=50)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Correlation Coefficient, r','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Prob venous density','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('SE-BOLD-CVR vs MD','FontSize',25)
% ylim([-0.2,0.4])
grid on

figure,
scatter(prob_groups_categorical,corrcoef_CVRGEvsMD_region_vessatlas_tot,"filled",SizeData=50)
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Correlation Coefficient, r','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Prob venous density','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('GE-BOLD-CVR vs MD','FontSize',25)
% ylim([-0.2,0.4])
grid on

%% regression estimates

figure,
s=scatter(prob_groups_categorical,estimate_regional_cvrratiovsMD_tot,"filled",SizeData=150)
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Regression Coefficient (\beta)','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Macrovascular venous density','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('CVR_{ratio} vs MD','FontSize',25)
ylim([-0.15,0.3])
grid on


figure,
s=scatter(prob_groups_categorical,estimate_regional_cvrBOLDSEvsMD_tot,"filled",SizeData=150)
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Regression Coefficient (\beta)','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Macrovascular venous density','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('SE-BOLD-CVR vs MD','FontSize',25)
ylim([-0.15,0.3])
grid on

figure,
s=scatter(prob_groups_categorical,estimate_regional_cvrBOLDGEvsMD_tot,"filled",SizeData=150)
s.MarkerFaceColor='b';
s.MarkerEdgeColor='k';
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Regression Coefficient (\beta)','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Macrovascular venous density','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('GE-BOLD-CVR vs MD','FontSize',25)
ylim([-0.15,0.3])
grid on

%% Davide's plot
% CVR GE vs CVR SE coloured based on density of vessels.
diff_sizes_list = 40;
sizes_list = 20:diff_sizes_list:20+length(prob_groups)*diff_sizes_list; 

figure,
for prob = 1:length(prob_groups)
s=scatter(CVRBOLD_SE_regional_vessatlas_medians_tot(prob),CVRBOLD_GE_regional_vessatlas_medians_tot(prob),'filled',SizeData=sizes_list(prob));
s.MarkerFaceColor='b';
hold on
end
set(get(gca, 'XAxis'), 'FontWeight', 'bold','FontSize',14);
set(get(gca, 'YAxis'), 'FontWeight', 'bold','FontSize',14);
set(gca,'box','off')
ylabel('Gradient Echo','FontWeight','bold','FontSize',19,'FontName','Calibri')
xlabel('Spin Echo','FontWeight','bold','FontSize',19,'FontName','Calibri')
title('GE vs SE (Medians of ROIs)')
grid on