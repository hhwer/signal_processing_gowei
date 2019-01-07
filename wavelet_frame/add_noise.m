function [y] = add_noise(signal, opts)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if nargin < 2
    opts = struct;
end
if ~isfield(opts, 'level')
    level = 12;
else
    level = opts.level;
end
if ~isfield(opts, 'd_level')
    d_level = 7;
else
    d_level = opts.d_level;
end
if ~isfield(opts, 'wave_name')
    wave_name = 'db5';
else
    wave_name = opts.wave_name;
end
if ~isfield(opts, 'noise')
    noise = 0.2;
else
    noise = opts.noise;
end


[c,l] = wavedec(signal, level, wave_name);
x = wrcoef('a', c, l, wave_name, d_level);
% figure(1)
% subplot(2,1,1)
% plot(signal);
% hold on
% plot(x, 'LineWidth', 2)
% hold off
% subplot(2,1,2)
% plot(signal-x)

y = signal-x;
y = y+noise*rand(size(y))*(max(y)-min(y));
y = y + x;

end

