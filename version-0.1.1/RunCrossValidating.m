load data\feat.mat
load data\labels.mat

disp('计算中…');
ac=tenfoldCV(feat,labels);
disp(['模型的准确率是:' ,num2str(ac*100),'%.'])
disp('-----------------------------');

clear feat
clear labels