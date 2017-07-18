function [ feat ] = getFeatures( imgray,x1,x2 )
%%
%   综合颜色和轮廓特征 1937x64
%   返回值 feat 是 15 * 64 的矩阵， 每一行表示一个特征，每一列表示一个方格
 f1 = getGrayFeatures(imgray,x1,x2);
 f2 = getShapeFeature(imgray,x1,x2);
 feat = [f1;f2];
 
 %通过PCA方法降维
 trans = princomp(feat');
 feat = feat' * trans(:,1:15);
 feat = feat';
end

