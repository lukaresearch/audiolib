clear all; close all;

Ndigit = 10;
Nperson = 6;
Nutterance = 50;
Nframe = 120;
Ncepstrum = 36;
NutterancePerDigit = Nperson * Nutterance;
Nfile = Ndigit * NutterancePerDigit;

NspeakerTrain = 5; % speaker-independent
NdataTrain = Ndigit * NspeakerTrain * Nutterance;
NdataTest = Ndigit * (Nperson - NspeakerTrain) * Nutterance;

fileData = fopen('data.bin','r');
fileLabel = fopen('label.bin','r');

traindata = fread(fileData, Nframe*Ncepstrum*Nfile, 'double');
traindata = reshape(traindata, Nframe, Ncepstrum, NutterancePerDigit, Ndigit);
trainlabel = fread(fileLabel, Nfile, 'uint');
trainlabel = reshape(trainlabel, Nfile, 1);
fclose('all');

trainlabel = categorical(trainlabel);

dataTrain = zeros(Nframe, Ncepstrum, NdataTrain);
labelTrain = [];
dataTest = zeros(Nframe, Ncepstrum, NdataTest);
labelTest = [];
startTrain = 1;
endTrain = NspeakerTrain * Nutterance;
startTest = endTrain + 1;
endTest = Nperson * Nutterance; % 300
accTrain = 0;
accTest = 0;
testLen = endTest - endTrain;
for i=1:Ndigit
    dataTrain(:,:, accTrain+1:accTrain+endTrain) = traindata( :, :,startTrain:endTrain, i);
    labelTrain = [labelTrain; trainlabel((i-1)*endTest + (startTrain:endTrain))];
    
    dataTest(:,:, accTest+1:accTest+testLen) = traindata(:, :, startTest:endTest, i);
    labelTest = [labelTest; trainlabel((i-1)*endTest + (startTest:endTest))];
   
    accTrain = accTrain + endTrain;
    accTest = accTest + testLen;
end
labelTrain = categorical(labelTrain);
labelTest = categorical(labelTest);

dataTrain1 = reshape(dataTrain, [Nframe, Ncepstrum, 1, NdataTrain]);
dataTest1 = reshape(dataTest,  [Nframe, Ncepstrum, 1, NdataTest]);

layers = [
    imageInputLayer([120 36 1])
    fullyConnectedLayer(1024, 'Name', 'fc1')
    reluLayer
    fullyConnectedLayer(512)
    reluLayer
    fullyConnectedLayer(256)
    
    preluLayer
    
    fullyConnectedLayer(128)
    reluLayer
    fullyConnectedLayer(64)
    reluLayer
    fullyConnectedLayer(32)
    reluLayer
    fullyConnectedLayer(Ndigit)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',90, ...
    'Shuffle','every-epoch', ...
    'ValidationData',{dataTest1, labelTest}, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(dataTrain1, labelTrain, layers, options);
YPred = classify(net, dataTest1);
YValidation = labelTest;

accuracy = sum(YPred == YValidation)/numel(YValidation)