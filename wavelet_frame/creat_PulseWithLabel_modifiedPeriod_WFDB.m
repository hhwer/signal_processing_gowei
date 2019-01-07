
% wfdb
data = load('wfdb.mat');
data = data.data;
n = length(data);
pulse_len = 3000;
pulse = {};
label = {};
wholeperiod = {};
modifiedperiod = {};
opts.plot = 0;
opts.min_var = 10;
opts.d = pulse_len;
num = 0;
good_num = 0;
good_data = {};
for i = 1:n
    data_i = data{i};
    data_pred = data_i.pred;
    data_pired = data_i.pired;
    modifiedperiod_i =zeros(1,40,2);
    pulse_i = zeros(0, pulse_len);
    label_i = zeros(0,2);
    pred_len = length(data_pred);
    idx_i = get_GoodPointForLongPulse(data_pred, opts);
    for k = 1:length(idx_i)
%     for k = 1:pred_len/pulse_len
        custom = struct();
        start_num = idx_i(k);
%         start_num = (k-1)*pulse_len+1;
        pulse_local = data_pred(start_num:start_num+pulse_len-1);
        custom.pulse = pulse_local';
        opts.data={custom};
        num = num+1;
        [quality(num),index,~,period] = f2_neighbor_low(1,opts);
        if quality(num) == 1
            good_num = good_num + 1;
            good_data{good_num} = custom;
        end
        pulse_i(k, 1:pulse_len) = pulse_local;
        label_i(k,1) = str2num(data_i.systolic);
        label_i(k,2) = str2num(data_i.diastolic);
        modifiedperiod_i(k,1:size(index,1),1:2) = index;
    end
    pulse{i,1} = pulse_i;
    label{i,1} = label_i;
    modifiedperiod{i,1} = modifiedperiod_i;
end
save(['~/wfdb-data/pulse_wfdblow',num2str(n)  ,'.mat'], 'pulse');
save(['~/wfdb-data/label_wfdblow',num2str(n)  ,'.mat'], 'label');
save(['~/wfdb-data/modifiedperiod_wfdblow',num2str(n)  ,'.mat'], 'modifiedperiod');

