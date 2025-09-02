function filename = get_time_stamp(suffix, includeMatExtension)
%GET_TIME_STAMP Generate timestamped filename with optional .mat extension
%
%   FILENAME = GET_TIME_STAMP(SUFFIX) creates a filename string combining
%   a user-provided suffix with a current timestamp in the format:
%   "suffix_yyyyMMdd_HHmmss.mat" (includes .mat extension by default)
%
%   FILENAME = GET_TIME_STAMP(SUFFIX, INCLUDEMATEXTENSION) controls whether
%   to include the .mat extension in the output filename.
%
%   Input:
%       suffix - String prefix for the filename (e.g., 'experiment', 'data')
%       includeMatExtension - (Optional) Logical flag to include .mat extension
%                           true: include .mat extension (default)
%                           false: return only timestamp without extension
%
%   Output:
%       filename - Formatted filename string
%
%   Examples:
%       % Default behavior with .mat extension
%       filename = get_time_stamp('experiment_data');
%       % Returns: 'experiment_data_20231215_143022.mat'
%
%       % Without .mat extension
%       filename = get_time_stamp('results', false);
%       % Returns: 'results_20231215_143022'
%
%       % Get only timestamp part (empty suffix)
%       timestamp = get_time_stamp('', false);
%       % Returns: '20231215_143022'
%
%   Features:
%     - Uses ISO 8601-like timestamp format (YYYYMMDD_HHMMSS)
%     - Ensures filename uniqueness for multiple saves
%     - Compatible with all operating systems (no invalid characters)
%     - Optional .mat extension control
%
%   See also: DATETIME, SPRINTF, NOW

% Set default value for optional parameter
if nargin < 2
    includeMatExtension = true;
end

% Generate timestamp
timestamp = string(datetime("now", 'Format', 'yyyyMMdd_HHmmss'));

% Format output based on parameters
if isempty(suffix)
    if includeMatExtension
        filename = sprintf('%s.mat', timestamp);
    else
        filename = sprintf('%s', timestamp);
    end
else
    if includeMatExtension
        filename = sprintf('%s_%s.mat', suffix, timestamp);
    else
        filename = sprintf('%s_%s', suffix, timestamp);
    end
end

end