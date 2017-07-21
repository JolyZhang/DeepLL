function [ accuracy ] = tenfoldCV( feat,label )
%
%%  对特征用CART进行十重交叉检验
feat = feat';
label = label';
cp = cvpartition(label,'k',10);
%%crossval(f,feat',label','partition',cp)
ac = 0;
for i = 1:cp.NumTestSets
    feat_train = feat(training(cp,i),:);
    label_train = label(training(cp,i));
    model = classregtree(feat_train,label_train);
    ac = ac + sum(cell2mat(eval(model,feat(test(cp,i),:))) == label(test(cp,i)));
end
accuracy = ac./sum(cp.TestSize);
end

