

% data = load('data_4106_total.mat');
% data = data.data;
opts.data = data;
n = length(data);
opts.plot = 0;
quality = zeros(n,1);
label = [];
% age=[];
pulse = zeros(1,4000);
modifiedperiod =zeros(1,40,2);
wholeperiod = zeros(1,30);
age = [];
min_length = 4000;
max_length = 0;
num = 0;
for i = 1:n
    [quality(i),index,~,period] = f2_neighbor_low(i,opts);
            custom = opts.data{i};
        pulse_i = custom.pulse;
    local_length = length(pulse_i);
            max_length = max(max_length,local_length);
        min_length = min(min_length,local_length);
    if quality(i) == 1
        num = num+1;

        

        pulse(num,1:length(pulse_i)) = pulse_i;
        label(num,1) = custom.pweeks;
        age(num,1) = custom.age;
        modifiedperiod(num,1:length(index),1:2) = index; 
        wholeperiod(num,1:length(period)) = period;
    end
end

save_path = './npy_data/';
writeNPY(modifiedperiod,[save_path,'modifiedperiod',date,'.npy'])
writeNPY(ecg_pulse,[save_path,'ecg_pulse',date,'.npy'])
writeNPY(ppg_pulse,[save_path,'ppg_pulse',date,'.npy'])
writeNPY(label,[save_path,'label',date,'.npy'])
