function [ prediction ] = test( test)
%%
%   利用modelCART 进行分类
%x1 = loadGrayImage(src);
load('data\\x1.mat'); %标定水平方向
load('data\\x2.mat'); %标定竖直方向

load('model\\modelCART.mat');
imgRGB = readImageToRGB(test);
imgGray = rgb2gray(imgRGB);
ft = getFeatures(imgGray,x1,x2);
prediction = [];
for fi = ft;
    try
    x = eval(modelCART,fi');
    prediction = cat(2,prediction, x{:});
    catch e
        disp(e);
    end
end
end