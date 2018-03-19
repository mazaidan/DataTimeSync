clear;close all; clc

% Let say we have the data:
% Specify input time_output and data:
time_input_datenum = datenum({'01-Jan-2015 00:00:00';'31-Jan-2015 23:30:00'});
time_input_datevec = datevec(time_input_datenum(1):1/480:time_input_datenum(2));
data_input_only = randn(size(time_input_datevec,1),1);

data_input_only(1,1)=NaN;
data_input_only(5,1)=NaN;
% Specify output time_output:
time_output_datevec = datevec(time_input_datenum(1):1/48:time_input_datenum(2));

%DataOutputFinal = DataTimeSync(data_input_only,time_input_datevec,time_output_datevec);
DataOutputFinal = DataTimeSync(data_input_only,time_input_datevec,time_output_datevec,1,'median');

% check the result:
nanmean(data_input_only(1:10,1))
DataOutputFinal(1,end)
