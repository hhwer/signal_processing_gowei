% % wfdb
% data = load('wfdb.mat');
% data = data.data;
n = length(data);
pulse_len = 3000;
pulse = {};
label = {};
wholeperiod = {};
modifiedperiod = {};
opts.plot = 1;
opts.min_var = .2;
opts.d = pulse_len;
num = 0;
good_num = 0;
good_data = {};
for i = 1:n
    data_i = data{i};
    data_pred = data_i.pred(1000: min(6000,end));
    data_pired = data_i.pired(1000: min(2000,end));
    data_ecg = data_i.ecg(1000: min(4000,end));
    modifiedperiod_i =zeros(1,40,2);
    pulse_i = zeros(0, pulse_len);
    label_i = zeros(0,2);
    pred_len = length(data_pred);
    idx_i = get_GoodPointForLongPulse(data_pred, opts);
%     idx_i = get_GoodPointForLongPulse(data_ecg, opts);
end
