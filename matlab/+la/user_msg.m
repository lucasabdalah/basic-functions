%% USER_MSG - Display a status message based on input command
%
%   This function prints a status message to indicate the start or end 
%   of a script execution. It also handles unrecognized inputs with 
%   a default message.
%
%   Syntax:
%       user_msg(input)
%
%   Input:
%       input (char) - A string specifying the message type. It can be:
%           'start'  - Prints a message indicating the script is starting.
%           'over'   - Prints a message indicating the script has finished.
%           Any other input will print a default message.
%
%   EXAMPLE:
%       user_msg('start') % Displays script start message
%       user_msg('over')  % Displays script completion message
%       user_msg('other') % Displays default message
%
function user_msg(input)
  switch input
    case 'start'
      fprintf('%s.m run starting.\n.\n', mfilename)
    case 'over'      
      fprintf('%s.m run is over.\n.\n', mfilename)
    otherwise
      fprintf('.\n.\n')
  end
end