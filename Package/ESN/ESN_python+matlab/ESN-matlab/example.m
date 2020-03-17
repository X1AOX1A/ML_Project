% Demo script

%��������
data = load('MGtimeseries.mat');   
data = data.MGtimeseries;
inputData = cell2mat(data(1:end-1))'; 
targetData = cell2mat(data(2:end))';

%��Ҫwashout�����ݸ���
washout = 100;

%train��test���ݼ�
trlen = 2000; tslen = 2000; 
trX{1} = inputData(1:trlen);
tsX{1} = inputData(trlen+1:trlen+tslen);
% Remove initial points from target!
trY = targetData(1+washout:trlen);
tsY = targetData(trlen+1+washout:trlen+tslen);

%esn��������
esn = ESN(50, 'leakRate', 0.3, 'spectralRadius', 0.5, 'regularization', 1e-8);

%esnѵ��
esn.train(trX, trY, washout);

%����ؼ�������������(trX)�ϲ�
output=esn.internalState;
