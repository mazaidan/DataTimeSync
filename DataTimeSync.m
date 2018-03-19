function DataOutputFinal = DataTimeSync(data_input_only,time_input_datevec,time_output_datevec,varargin)

% DataTimeSync is the function used to syncronize the time from the data
% downloaded from https://avaa.tdata.fi/web/smart
%
% Inputs function:
% data_input_only     : the data input only without the time
% time_input_datevec  : the time input only in the form of datevec
% time_output_datevec : the expected time output only without the data
% varargin{1} : time_type, option=1,2, default: time_type=1
% varargin{2} : method, option= 'nanmean', 'nanmedian', default = 'nanmean'
%
% Outputs function:
% DataOutputFinal : [the time_output_datevec newoutputdata]
%
% Martha Arbayani Zaidan, PhD
% Postdoctoral Researcher
% Institute for Atmospheric and Earth System Research (INAR)/Physics
% Helsinki University, Finland

if nargin < 3 || nargin > 5
    error('The number of input argument is incorrect');
elseif nargin == 3
    time_type = 1;         % default
    method    = 'mean'; % default
elseif nargin == 5
    time_type = varargin{1};
    method    = 'mean'; % default
elseif nargin ==5
    time_type = varargin{1};
    method    = varargin{2}; % 'mean', 'median'    
end

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
        data_output = retime(data_input,datetime_output,method);
    case 2
        disp('Use hourly')
        data_output = retime(data_input,'hourly',method);
    %case 3
        %dt = minutes(30);
        %data_output = retime(data_input,'regular','linear','TimeStep',dt);    
    otherwise
        error('Please specify time_type!')
end


time_output  = data_output.datetime_input;
time_datevec_output = datevec(time_output);

DataOutput= data_output.data_input_only;

DataOutputFinal = [time_datevec_output DataOutput];

% Some useful explanations:
% https://se.mathworks.com/help/matlab/ref/timeseries.synchronize.html
% https://se.mathworks.com/help/matlab/matlab_prog/combine-timetables-and-synchronize-their-data.html
% https://se.mathworks.com/help/matlab/ref/retime.html
