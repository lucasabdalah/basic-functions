function reg_log(yourMsg)
    %reg_log.m - Description
    %
    % Syntax: output = myFun(input)
    %
    % Long description
    
    fid = fopen(fullfile('YourLogFile.txt'), 'a');
    
    if fid == -1
        error('Cannot open log file.');
    end
    
    fprintf(fid, '%s: %s\n', datestr(now, 0), yourMsg);
    fclose(fid);
    
    end