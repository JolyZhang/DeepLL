function [ rgb ] = readImageToRGB( filename )
%%
%   ��ȡͼ�񣬲���ʾΪrgbģʽ
[ind, map] = imread(filename);
if ~isempty(map)
    ind = ind2rgb(ind,map);
end
rgb = ind;

end

