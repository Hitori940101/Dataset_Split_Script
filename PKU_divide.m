dataset_path = '\\hi-024L\CV-008_Students\wan4hi\PKU-Reid-Dataset';

imgseq_path = fullfile(dataset_path, 'img');
cam1_path = fullfile(dataset_path, 'cam1');
cam2_path = fullfile(dataset_path, 'cam2');
if ~isdir(cam1_path)
    mkdir(cam1_path);
end
if ~isdir(cam2_path)
    mkdir(cam2_path);
end

dir_info = dir(fullfile(imgseq_path, '*.jpg'));
for idx = 1:numel(dir_info)
    img_name = dir_info(idx).name;
    if img_name(6) == '1'
        copyfile(fullfile(imgseq_path, img_name), fullfile(cam1_path, img_name));
    else
        copyfile(fullfile(imgseq_path, img_name), fullfile(cam2_path, img_name));
    end
end