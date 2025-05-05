function filename = get_unique_filename(base_name, extension)
  % Initialize counter
  counter = 1;
  
  % Construct initial filename
  filename = [base_name, extension];

  % Check if the file exists and increment the counter if necessary
  while isfile(filename)
      filename = sprintf('%s%d%s', base_name, counter, extension);
      counter = counter + 1;
  end
end