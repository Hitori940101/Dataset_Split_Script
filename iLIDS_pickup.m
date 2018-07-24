dataset_path = '\\hi-024L\CV-008_Students\wan4hi\iLIDS_Video';
txt_dat = importdata('\\hi-024L\CV-008_Students\wan4hi\iLIDS_Video\Attribute_Info.txt');

%% setting
cam1_path = fullfile(dataset_path, 'cam1');
cam2_path = fullfile(dataset_path, 'cam2');
cam1_str = [txt_dat.textdata{:,3}];
cam2_str = [txt_dat.textdata{:,9}];
cam1_mask = strfind(cam1_str,'0');
cam2_mask = strfind(cam2_str,'0');
ind_list = intersect(cam1_mask, cam2_mask);
ind_list = setdiff(1:300, ind_list);

cam1_dir = dir(fullfile(cam1_path, '*.png'));
cam2_dir = dir(fullfile(cam2_path, '*.png'));
src_path = fullfile(dataset_path, 'Test_all');
dst_path = fullfile(dataset_path, 'ILIDS_Occ');

%% copy file
for idx = ind_list
    gal_imgnm = cam1_dir(idx).name(1:end-3);
    pro_imgnm = cam2_dir(idx).name(1:end-3);
    copyfile(fullfile(cam1_path, [gal_imgnm 'png']), fullfile(dst_path, 'bounding_box_test', [gal_imgnm 'png']));
    copyfile(fullfile(cam2_path, [pro_imgnm 'png']), fullfile(dst_path, 'query', [pro_imgnm 'png']));
    copyfile(fullfile(src_path, 'bounding_box_test_mat3', [gal_imgnm 'mat']),...
             fullfile(dst_path, 'bounding_box_test_mat3', [gal_imgnm 'mat']));
    copyfile(fullfile(src_path, 'query_mat3', [pro_imgnm 'mat']),...
             fullfile(dst_path, 'query_mat3', [pro_imgnm 'mat']));
end