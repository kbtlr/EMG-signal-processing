% This function processed EMG:  filtered, rectified and smoothed.
%
% Filtering: needs two functions: NotchFilter and PassFilter
% Rectifying: Prof's idea of rectifying the negative values according to
% the mean of de- and re-polarisation, rather than according to zero.

% Smoothing: according to the window size depending on the sample
% frequenct, but being always 0.1 sec 

SF = 100;

function proEMG = proEMG(rawEMG, SF)
% for TMSI following Prof
% windowSize is 0.1 sec (depending on the sampling frequency of the input data)
windowSize=0.1*SF;
[FiltData1]=NotchFilter(rawEMG,50,SF);% 50 here - what frequency is desired to be filtered out
[FiltData2]=PassFilter(FiltData1,[10 400],SF);
bls=mean(FiltData2(1000:length(FiltData2),:),1);
rectEMG=abs(FiltData2-repmat(bls,length(FiltData2),1));

proEMG=filter(ones(1,windowSize)/windowSize,1,rectEMG);


