function [ feat ] = getFeaturesForAll( path )
%%
%   path 指定棋盘图像的存放路径
%   feat 15 * N 存放从所有图像中提取的 特征

if path(end) ~= '\'
    path = [path,'\'];
end
feat = [];
load('data\x1.mat');
load('data\x2.mat');
fnames = ls(path);
for name = fnames'
    xname = name';
    if strcmp(strtrim(xname(strfind(xname,'.')+1:end)),'gif')
        img = readImageToRGB([path, strtrim(xname)]);
        disp(xname);
        %imshow(img);
        imgray = rgb2gray(img);
        ft = getFeatures(imgray,x1,x2);
        feat = cat(2,feat,ft);
    end
end

end

