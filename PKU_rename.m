raw_path = '\\hi-024L\CV-008_Students\wan4hi\PKU-Reid-Dataset';
new_dir = fullfile(raw_path,'img');
if ~isdir(new_dir)
    mkdir(new_dir);
end
dir_info = dir(fullfile(raw_path,'PKUv1a_128x48','*.png'));
for idx = 1:numel(dir_info)
    img_name = dir_info(idx).name;
    img_path = fullfile(raw_path,'PKUv1a_128x48',img_name);
    I = imread(img_path);
    new_path = fullfile(new_dir, [img_name(1:end-3) 'jpg']);
    imwrite(I, new_path);
end