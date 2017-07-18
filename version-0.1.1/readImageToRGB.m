function [ rgb ] = readImageToRGB( filename )
%%
%   读取图像，并表示为rgb模式
[ind, map] = imread(filename);
if ~isempty(map)
    ind = ind2rgb(ind,map);
end
rgb = ind;

end

