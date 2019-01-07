function [ idx,y ] = get_index( x,opts )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
if nargin < 2
    opts = struct;
end
if ~isfield(opts,'para1')
    opts.para1 = 40;
end
if ~isfield(opts,'para2')
    n = length(x);
    sam = x(floor(n/4):floor(3/4*n));
    opts.para2 = (max(sam)+min(sam))/2;
%     opts.para2 = 3/2*mean(x);
end
[y1,~] = findpeaks(x,'minpeakdistance',opts.para1,'MinPeakHeight',opts.para2);
[y2,~] = findpeaks(-x,'minpeakdistance',opts.para1,'MinPeakHeight',-opts.para2);
media_height = (median(y1)-median(y2))/2;

[~,idx] = findpeaks(x,'minpeakdistance',opts.para1,'MinPeakHeight',media_height);
media_distance = median(idx(2:end)-idx(1:end-1))*2/3;
[y,idx] = findpeaks(x,'minpeakdistance',media_distance,'MinPeakHeight',media_height);
end

