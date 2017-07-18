function [ feat ] = getFeatures( imgray,x1,x2 )
%%
%   �ۺ���ɫ���������� 1937x64
%   ����ֵ feat �� 15 * 64 �ľ��� ÿһ�б�ʾһ��������ÿһ�б�ʾһ������
 f1 = getGrayFeatures(imgray,x1,x2);
 f2 = getShapeFeature(imgray,x1,x2);
 feat = [f1;f2];
 
 %ͨ��PCA������ά
 trans = princomp(feat');
 feat = feat' * trans(:,1:15);
 feat = feat';
end

