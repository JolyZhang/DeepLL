function [ feature ] = getGrayFeatures( imgray,x1,x2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%[r,c] = size(pos);
feature = zeros(256,64);

for i = 1:8
    for j = 1:8
        hold off
        z1 = imcrop(imgray, [x2(j),x1(i),40,40]);
        %whos z1
        %imshow(z1)
        %[feature{i,j},~] = imhist(z1);
        feature(:, 8*(i-1)+j) = imhist(z1);
    end
end
end

