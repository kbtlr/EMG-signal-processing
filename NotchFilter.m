%% Notch filter
% input DirtyData = dirty data,
%       cutoo = target cutting frequency,
%       fs= sampling rate
%
% Jack 07.05.2015 19.29
function [FiltData]=NotchFilter(DirtyData,cutoff,Fs)

            Time=(0:length(DirtyData)-1)/Fs;
            Raw=timeseries(DirtyData,Time);
            Ints=[cutoff-2 cutoff+2]; % the frequency intervals, in hertz, for filtering the data:
            Filt = idealfilter(Raw,Ints,'notch');
            FiltData=Filt.Data;
%             figure
%             plot(Time, DirtyData);
%             hold on
%             plot(Time, FiltData, 'r');