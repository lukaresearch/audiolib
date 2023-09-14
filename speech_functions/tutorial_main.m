clear all; close all;

number = '9';
separator = ',';
%newLine = '\n'

outputPath = 'D:\1-ML\speech_lab\output\'
outRecord = strcat(outputPath, '0_9_record_cep.txt');
outFName = strcat(outputPath, number, '_cep.txt');

fid = fopen(outFName, 'w');
if (fid == -1)
    error('Cannot open file for writing');
end

dir = 'D:\1-ML\speech_lab\recordings\';
names = {'george', 'jackson', 'lucas', 'nicolas', 'theo', 'yweweler'};
names = string(names);
frameRecord = zeros(1, 300);
cnt = 1;
for i=1:6
    for j=0:49
        fname = strcat(dir, number, '_', names(i), '_', int2str(j), '.wav');
        %fname
        cout = LPC_cepstrum(fname);
        [M, N] = size(cout);
        frameRecord(cnt) = M;
        cnt = cnt + 1;
        matrix2text(M, N, cout, fid, i, j+1);
        %dlmwrite(dataFName, cout', 'delimiter', separator, '-append');
    end
    fprintf("number %s = [%s, %d]\n", number, names(i), j);
end
dlmwrite(outRecord, max(frameRecord), 'delimiter', separator, '-append');
fclose('all');