function log_write(yourMsg)
    %log_write.m - Description
    %
    % Syntax: log_write(yourMsg)
    %
    % Long description
    
    fid = fopen(fullfile('log.txt'), 'a');
    
    if fid == -1
        error('Cannot open log file.');
    end
    
    fprintf(fid, '--------------------\n%s\n--------------------\n%s\n\n', ...
        datestr(now, 0), sprintf(yourMsg));
    fclose(fid);
    
    end