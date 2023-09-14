clear all; close all;

cepNum = 36;
separator = ',';
number = '9';
%separator = ','
%newLine = '\n'

inputPath = 'D:\1-ML\speech_lab\output\';
inFName = strcat(inputPath, number, '_cep.txt');
inFRecord = strcat(inputPath, '0_9_record_cep.txt');
outputPath = 'D:\1-ML\speech_lab\output_ceps\';
outFName = strcat(outputPath, number, '_ceps.txt');

fid = fopen(inFName, 'r');
fidRecord = fopen(inFRecord, 'r');
fidOut = fopen(outFName, 'w');
if ((fid == -1) || (fidRecord == -1) || (fidOut == -1))
    error('Cannot open file for writing');
end

maxRecord = -1;
while(1)
    lineRecord = fgetl(fidRecord);
    if(~ischar(lineRecord))
        break;
    end
    record = str2num(lineRecord);
    if(record > maxRecord)
        maxRecord = record;
    end
end
maxRecord

cnt = 0;
flag = 0;
vector0 = zeros(1, cepNum);
while(1)
    line = fgetl(fid);
    if(~ischar(line))
        break;
    end
    %disp(line)
    if(line(1) == '#')
        if(flag == 1)
            diff = maxRecord - cnt;
            %if(diff == 0)
            %    disp(line)
            %end
            for i=1:diff
                for j=1:cepNum
                    if(j == cepNum)
                        fprintf(fidOut, '%f\n', vector0(j));
                    else
                        fprintf(fidOut, '%f,', vector0(j));
                    end
                end
            end
        end
        fprintf(fidOut, strcat(line, '\n'));
        cnt = 0;
    else
        fprintf(fidOut, strcat(line, '\n'));
        flag = 1;
        cnt = cnt + 1;
    end
end

% print last zeros
diff = maxRecord - cnt;
for i=1:diff
    for j=1:cepNum
        if(j == cepNum)
            fprintf(fidOut, '%f\n', vector0(j));
        else
            fprintf(fidOut, '%f,', vector0(j));
        end
    end
end

fclose('all');
