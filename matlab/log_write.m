function log_write(varargin)
%LOG_WRITE Logs a message with timestamp and optional elapsed time.
%
% Usage examples:
%   log_write()                           % default message, no time
%   log_write('message')                 % message only
%   log_write(elapsed_time)             % default message, with time
%   log_write('message', elapsed_time)  % message and time

% Default values
yourMsg = 'none';
elapsed_time = NaN;

% Handle input arguments
for i = 1:numel(varargin)
    if ischar(varargin{i}) || isstring(varargin{i})
        yourMsg = varargin{i};
    elseif isnumeric(varargin{i}) && isscalar(varargin{i})
        elapsed_time = varargin{i};
    end
end

% Prepare timestamp
timestamp = datetime('now', 'Format', 'yyyy-MM-dd HH:mm:ss');

% Open file for appending
fid = fopen('log.txt', 'a');
if fid == -1
    warning('Cannot open log file.');
    return;
end

% Format elapsed time
if isnan(elapsed_time)
    timeStr = 'XX:XX:XX';
else
    timeStr = sprintf('%02d:%02d:%02d', ...
        floor(elapsed_time / 3600), ...
        mod(floor(elapsed_time / 60), 60), ...
        round(mod(elapsed_time, 60)));
end

% Write to log
fprintf(fid, '[%s] Elapsed %s %s\n', ...
    char(timestamp), timeStr, yourMsg);

fclose(fid);
end
