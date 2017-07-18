function [ prediction ] = test( test)
%%
%   ����modelCART ���з���
%x1 = loadGrayImage(src);
load('data\\x1.mat'); %�궨ˮƽ����
load('data\\x2.mat'); %�궨��ֱ����

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