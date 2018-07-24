% train_path = '\\hi-024L\CV-008_Students\wan4hi\Market-1501-v15.09.15\bounding_box_train_mat2_skip';
% target_path = '\\hi-024L\CV-008_Students\wan4hi\MARS\MARS_occ_test_3\query';
% 
% dir_train = dir(fullfile(train_path,'*.mat'));
% dir_target = dir(fullfile(target_path,'*.jpg'));
% trainid_set = [];
% targetid_set = [];
% for idx = 1:numel(dir_train)
%     pid = str2double(dir_train(idx).name(1:4));
%     if ~ismember(pid, trainid_set)
%         trainid_set = [trainid_set pid];
%     end
% end
% for idx = 1:numel(dir_target)
%     pid = str2double(dir_target(idx).name(1:4));
%     if ~ismember(pid, targetid_set)
%         targetid_set = [targetid_set pid];
%     end
% end
% diff_set = setdiff(targetid_set, trainid_set);

%% copy file
save_path = '\\hi-024L\CV-008_Students\wan4hi\MARS\MARS_occ_test_4';
src_path = '\\hi-024L\CV-008_Students\wan4hi\MARS\MARS_occ_test_3';
target_dirnm = 'bounding_box_test';
if ~isdir(fullfile(save_path,target_dirnm))
    mkdir(fullfile(save_path,target_dirnm));
end

dir_info = dir(fullfile(src_path, target_dirnm, '*.jpg'));
for idx = 1:numel(dir_info)
    img_name = dir_info(idx).name;
    pid = str2double(img_name(1:4));
    if ismember(pid, diff_set)
        copyfile(fullfile(src_path, target_dirnm, img_name), fullfile(save_path, target_dirnm, img_name));
    end
end
