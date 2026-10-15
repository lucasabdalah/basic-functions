function av_curve = average_curve(x)
  error_curves = x;
  num_curves = length(error_curves);
  num_interp_points = max(cellfun(@length, error_curves));
  common_x = linspace(1, num_interp_points, num_interp_points);
  interp_values = NaN(num_curves, num_interp_points);
  for i = 1:num_curves
      x_original = linspace(1, num_interp_points, length(error_curves{i}));
      interp_values(i, :) = interp1(x_original, error_curves{i}, common_x, 'linear', 'extrap');
  end
  av_curve = mean(interp_values, 1, 'omitnan');
end 