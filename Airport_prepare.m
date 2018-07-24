%load('E:\希尔德斯海姆\毕设\Dataset\AirportALERT_image\Partition_airport');
%filepath = importdata('E:\希尔德斯海姆\毕设\Dataset\AirportALERT_image\filepath.txt');
%save_path = 'E:\希尔德斯海姆\毕设\Dataset\AirportALERT_image\Partition_airport';
% 
% [result test_idx] = sort(partition.idx_test == 1);
% train_idx = test_idx(~result);
% test_idx = test_idx(result);

%mkdir('train');
% for i = 1:numel(train_idx)
%     %disp(train_idx(i));
%     file_name = strsplit(filepath{train_idx(i)},'\');
%     copyfile(fullfile('.',filepath{train_idx(i)}), fullfile('train',file_name{end}));
% end

%mkdir('test');
cd 'test';
parfor i = 2:numel(partition.galCam)
    dir_name = strcat('test_',sprintf('%02d',i));
    mkdir(dir_name);
    mkdir(fullfile(dir_name, 'gallery'));
    mkdir(fullfile(dir_name, 'query'));
    gal_set = test_idx(partition.idx_gallery(i,:));
    pro_set = test_idx(partition.idx_probe(i,:));
    for j = 1:numel(gal_set)
        file_name = strsplit(filepath{gal_set(j)},'\');
        copyfile(fullfile('..',filepath{gal_set(j)}), fullfile(dir_name,'gallery',file_name{end}));
    end
    for j = 1:numel(pro_set)
        file_name = strsplit(filepath{pro_set(j)},'\');
        copyfile(fullfile('..',filepath{pro_set(j)}), fullfile(dir_name,'query',file_name{end}));
    end
end
    