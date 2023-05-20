%% Band-Pass filter
% input DirtyData = dirty data,
%       pass = target cutting frequency,
%       fs= sampling rate
%
% Jack 07.05.2015 19.29

function [FiltData]=PassFilter(DirtyData,pass,Fs)

            Time=(0:length(DirtyData)-1)/Fs;
            Raw=timeseries(DirtyData,Time);
            Ints=pass; % the frequency intervals, in hertz, for filtering the data:
            Filt = idealfilter(Raw,Ints,'pass');
            FiltData=Filt.Data;
%             figure
%             plot(Time, DirtyData);
%             hold on
%             plot(Time, FiltData, 'r');