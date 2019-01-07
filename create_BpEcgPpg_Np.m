addpath('/home/hh/signal_processing/signal_progressing-master/test_old');

data = Part_1;
opts.data = data;
n = length(data);
opts.plot = 1;
label = [];
ppg_pulse = zeros(1,256);
ecg_pulse = zeros(1,256);
modifiedperiod =zeros(1,40,2);
num = 0;
bias = [];
for i = 1:n
    data_i = data{i};
    local_length = size(data_i, 2);
    if local_length < 512
        continue
    end
    st = floor(local_length/2);
    ppg_i = data_i(1, st+1:st+256);
    bp_i = data_i(2, st+1:st+256);
    ecg_i = data_i(3, st+1:st+256);
    try
    [~,idx_low,~,idx] = get_period_low(bp_i', opts);
    y_low = bp_i(idx_low);
    y = bp_i(idx);
%     bias = [bias,[max(abs(y_low-mean(y_low)));max(abs(y-mean(y)))]];
%     max(abs(y_low-mean(y_low)))
%     max(abs(y-mean(y)))
    if max(max(abs(y_low-mean(y_low))),max(abs(y-mean(y)))) > 2
        continue
    end
    num = num+1;
    ppg_pulse(num,1:256) = ppg_i;
    ecg_pulse(num,1:256) = ecg_i;
    label(num,1) = mean(bp_i(idx_low));
    label(num,2) = mean(bp_i(idx));
    modifiedperiod(num,1,1:2) = [1,256];
    catch
        disp(i)
    end
end
