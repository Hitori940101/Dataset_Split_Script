dataset_path = '\\hi-024L\CV-008_Students\wan4hi\Market-1203';

imgseq_path = fullfile(dataset_path, 'Market1203');
view1_path = fullfile(dataset_path, 'f_view');
view2_path = fullfile(dataset_path, 'b_view');
view3_path = fullfile(dataset_path, 's_view');

if ~isdir(view1_path)
    mkdir(view1_path);
end
if ~isdir(view2_path)
    mkdir(view2_path);
end
if ~isdir(view3_path)
    mkdir(view3_path);
end

dir_info = dir(fullfile(imgseq_path, '*.jpg'));
for idx = 1:numel(dir_info)
    img_name = dir_info(idx).name;
    switch img_name(9)
        case {'6','7','8'}
            copyfile(fullfile(imgseq_path, img_name), fullfile(view1_path, img_name));
        case {'2','3','4'}
            copyfile(fullfile(imgseq_path, img_name), fullfile(view2_path, img_name));
        case {'1','5'}
            copyfile(fullfile(imgseq_path, img_name), fullfile(view3_path, img_name));
    end
end