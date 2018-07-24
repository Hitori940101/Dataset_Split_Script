%load('cuhk03_new_protocol_config_detected.mat');
dataset_path = '\\hi-024L\CV-008_Students\wan4hi\CUHK03_New';

imgseq_path = fullfile(dataset_path, 'cuhk03_detected');
train_path = fullfile(dataset_path, 'detected_train');
gal_path = fullfile(dataset_path, 'detected_gallery');
pro_path = fullfile(dataset_path, 'detected_probe');
if ~isdir(train_path)
    mkdir(train_path);
end
if ~isdir(gal_path)
    mkdir(gal_path);
end
if ~isdir(pro_path)
    mkdir(pro_path);
end

for idx = 1:numel(filelist)
    img_name = filelist{idx};
    if ismember(idx, train_idx)
        copyfile(fullfile(imgseq_path, img_name), fullfile(train_path, img_name));
    else
        if ismember(idx, gallery_idx)
            copyfile(fullfile(imgseq_path, img_name), fullfile(gal_path, img_name));
        else
            if ismember(idx, query_idx)
                copyfile(fullfile(imgseq_path, img_name), fullfile(pro_path, img_name));
            end
        end
    end
end