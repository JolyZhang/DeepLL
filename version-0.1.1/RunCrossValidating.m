load data\feat.mat
load data\labels.mat

disp('�����С�');
ac=tenfoldCV(feat,labels);
disp(['ģ�͵�׼ȷ����:' ,num2str(ac*100),'%.'])
disp('-----------------------------');

clear feat
clear labels