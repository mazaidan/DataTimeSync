clear;close all; clc

% Let say we have the data:

% Specify input time_output and data:
time_input_datenum = datenum({'01-Jan-2015 00:00:00';'31-Dec-2015 23:30:00'});
time_input_datevec = datevec(time_input_datenum(1):1/480:time_input_datenum(2));
data = randn(size(time_input_datenum,1),1);

% Specify output time_output:
time_output_datevec = datevec(time_input_datenum(1):1/48:time_input_datenum(2));
