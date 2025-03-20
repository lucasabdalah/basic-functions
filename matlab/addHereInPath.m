% Get the full path of the script
scriptFullPath = mfilename('fullpath');

% Extract the folder containing the script
scriptFolder = fileparts(scriptFullPath);
% Add the folder to MATLAB's search path
addpath(scriptFolder);

% Save the updated search path permanently
status = savepath;

% Check if saving was successful
if status == 0
    fprintf('Successfully added "%s" to the permanent search path.\n', scriptFolder);
else
    fprintf('Failed to save the path. Try running MATLAB as administrator.\n');
end

return