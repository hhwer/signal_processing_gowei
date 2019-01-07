function [good_idx] = get_GoodPointForLongPulse(signal, opts)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if nargin < 2
    opts = struct;
end
if ~isfield(opts,'level')
    level = 20;
else
    level = opts.level;
end
if ~isfield(opts,'plot')
    opts.plot = 0;
end
if ~isfield(opts,'wave_name')
    wave_name = 'db5';
else
    wave_name = opts.wave_name;
end
if ~isfield(opts,'d_level')
    d_level = 8;
else
    d_level = opts.d_level;
end
if ~isfield(opts,'d')
    d = 3000;
else
    d = opts.d;
end
if ~isfield(opts,'min_var')
    min_var = 0.2;
else
    min_var = opts.min_var;
end
[c,l] = wavedec(signal, level, wave_name);
x = wrcoef('a', c, l, wave_name, d_level);
N = length(x);
b = ones(1, d)/d;

x_ave = filter(b, 1, x);
x_ave = x_ave(d:N);
z = 0;
for i = 1:d
    z = z + (x(i:N-d+i)-x_ave).^2;
end
z = z/(d-1);

% [y1,idx1] = findpeaks(-z,'minpeakdistance',d);
idx = find(z < min_var);
num = 0;
good_idx = [];
while ~isempty(idx) 
    num = num+1;
    [~, index_i] = min(z(idx));
    good_idx(num) = idx(index_i);
    idx = idx(abs(idx-idx(index_i)) > d);
end

if opts.plot == 1
%     subplot(2,1,1)
    plot(signal)
    hold on
    plot(x, 'LineWidth', 2)
    for i = good_idx
    plot([i:i+d-1], signal(i:i+d-1), 'g')
    plot([i,i], ylim, 'black')
    plot([i+d-1,i+d-1], ylim, 'black')
    end
    hold off
end

%     subplot(2,1,2)
% plot(z)
% hold on
% plot(good_idx,z(good_idx),'ro')
% hold off

end

