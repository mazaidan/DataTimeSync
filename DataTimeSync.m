function DataOutputFinal = DataTimeSync(data_input_only,time_input_datevec,time_output_datevec,varargin)

% DataTimeSync is the function used to sync

% https://se.mathworks.com/help/matlab/ref/timeseries.synchronize.html
% https://se.mathworks.com/help/matlab/matlab_prog/combine-timetables-and-synchronize-their-data.html
% https://se.mathworks.com/help/matlab/ref/retime.html

time_type

% Input time_output:
datetime_input = datetime(time_input_datevec,'InputFormat','dd-MMM-yyyy HH:mm:ss');
% Input time_output & data (in the timetable format):
data_input = timetable(datetime_input,data_input_only);

% Output time_output 
datetime_output = datetime(time_output_datevec,'InputFormat','dd-MMM-yyyy HH:mm:ss');

% Output time_output & data (in the timetable format):
switch time_type
    case 1
        disp('Use specified matrix time_output')
        data_output = retime(data_input,datetime_output,'mean');
    case 2
        disp('Use hourly')
        data_output = retime(data_input,'hourly','mean');
    case 3
        %dt = minutes(30);
        %data_output = retime(data_input,'regular','linear','TimeStep',dt);    
    otherwise
        error('Please specify time_type!')
end


time_output  = data_output.datetime_input;
time_datevec_output = datevec(time_output);

DataOutput= data_output.data;

DataOutputFinal = [time_datevec_output DataOutput];
