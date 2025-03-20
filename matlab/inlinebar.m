function inlinebar(i_Total, i_Now, varargin)
  persistent prev_length
  if isempty(prev_length), prev_length = 0; end

  % Compute percentage completed
  percentage = (i_Now / i_Total) * 100;

  % Define the number of progress bar characters
  num_chars = 20;  % You can adjust this number for bar length
  num_filled = round(percentage / 100 * num_chars);  % Number of filled bars
  progress_bar = [repmat([char(0x2588)], 1, num_filled), repmat(' ', 1, num_chars - num_filled)];

  % Check if time vector is provided
  if nargin > 2 && ~isempty(varargin{1})
    time_vec = varargin{1};

    % Ensure we have at least two time points to estimate remaining time
    if length(time_vec) > 1
      elapsed_time = sum(time_vec(1:i_Now));  % Sum of the first i_Now iterations' times
      mean_time_per_iter = mean(time_vec(1:i_Now));  % Average time per iteration
      time_left = mean_time_per_iter * (i_Total - i_Now);  % Remaining time based on average iteration time

      % Format ETA and elapsed time in hh:mm:ss without milliseconds
      time_str = sprintf(', ETA: %02d:%02d:%02d | Elapsed: %02d:%02d:%02d', ...
        floor(time_left / 3600), mod(floor(time_left / 60), 60), round(mod(time_left, 60)), ...
        floor(elapsed_time / 3600), mod(floor(elapsed_time / 60), 60), round(mod(elapsed_time, 60)));
    else
      time_str = ''; % Not enough data to estimate
    end
  else
    time_str = ''; % No time vector provided
  end

  % Construct output string with progress bar
  perc_str = sprintf('%s %3.1f%% %s', progress_bar, percentage, time_str);

  % Erase previous output and print new progress
  fprintf(repmat('\b', 1, prev_length));
  fprintf('%s', perc_str);

  % Store the current string length for the next update
  prev_length = length(perc_str);

  % Append a new line when reaching the last iteration
  if i_Now == i_Total
    fprintf('\n');
  end

  drawnow;
end