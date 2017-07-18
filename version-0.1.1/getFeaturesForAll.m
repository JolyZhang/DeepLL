function [ feat ] = getFeaturesForAll( path )
%%
%   path ָ������ͼ��Ĵ��·��
%   feat 15 * N ��Ŵ�����ͼ������ȡ�� ����

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

