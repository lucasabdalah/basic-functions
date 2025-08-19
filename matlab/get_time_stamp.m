function filename = get_time_stamp(suffix)
timestamp = string(datetime("now", 'Format', 'yyyyMMdd_HHmmss'));
filename = sprintf('%s_%s.mat',suffix, timestamp);
end
