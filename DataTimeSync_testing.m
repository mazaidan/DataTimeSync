clear;close all; clc

% Let say we have the data:
% Specify input time_output and data:
time_input_datenum = datenum({'01-Jan-2015 00:00:00';'31-Jan-2015 23:30:00'});
time_input_datevec = datevec(time_input_datenum(1):1/480:time_input_datenum(2));

% if we use the below case, we have to apply interpolation
% time_input_datevec = datevec(time_input_datenum(1):1/40:time_input_datenum(2));
% because the input is less data than output

data_input_only = randn(size(time_input_datevec,1),1);

data_input_only(1,1)=NaN;
data_input_only(5,1)=NaN;
% Specify output time_output:
time_output_datevec = datevec(time_input_datenum(1):1/48:time_input_datenum(2));

DataInput=[time_input_datevec data_input_only data_input_only];


DataOutputFinal = DataTimeSync(DataInput,time_output_datevec);
%DataOutputFinal = DataTimeSync(DataInput,time_output_datevec,1,'mean');


% check the result:
nanmean(data_input_only(1:10,1))
DataOutputFinal(1,end)

clear time_input_datenum time_input_datevec data_input_only 
