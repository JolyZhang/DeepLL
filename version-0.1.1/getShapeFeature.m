function [ feature ] = getShapeFeature( imgray,x1,x2  )
%% 
%   获取每个棋子的轮廓特征，每个位置用一个160x1的列向量表示
%   
feature = zeros(41*41,64);
[~, threshold] = edge(imgray, 'sobel');
%figure,imshow(X);
I = imgray;
fudgeFactor = .5;
BWs = edge(I,'sobel', threshold * fudgeFactor);
%figure,imshow(BWs);
se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);
BWsdil = imdilate(BWs, [se90 se0]);
BWdfill = imfill(BWsdil, 'holes');
BWnobord = imclearborder(BWdfill, 4);
seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
BWoutline = bwperim(BWfinal);
% Segout = I;
% Segout(BWoutline) = 255;
% pices = BWoutline;
%imshow(BWoutline);

for i = 1:8
    for j = 1:8
        img = imcrop(imgray, [x2(j),x1(i),40,40]);
        feature(:,8*(i-1) + j) = reshape(img,41*41,1);
    end
end
end

