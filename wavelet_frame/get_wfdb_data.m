% data_path = '../wfdb-data/';
data_path = '../wfdb-data/1/';
fid = fopen([data_path,'ref.csv']);
C = textscan(fid, '%s %s %s%s%s%s%s%s%s%s%s','delimiter',',');
fclose(fid);
data = {};
num = 0;
for i = 1:length(C{1})-1
    custom = struct();
    try
        record_id = C{1}{i+1};
        custom.record_id = C{1}{i+1};
        custom.ref_id = C{2}{i+1};
        custom.diastolic = C{7}{i+1};
        custom.systolic = C{8}{i+1};
        if isempty(custom.diastolic) || isempty(custom.systolic)
            fprintf([num2str(i+1),' diastolic(systolic) loss\n'])
            continue
        end
        pred_filename = [data_path,record_id, 'pred.mat'];
        pired_filename = [data_path,record_id, 'pired.mat'];
        ecg_filename = [data_path,record_id, 'ecg.mat'];
        a = load(pred_filename);
        custom.pred = a.array;
        a = load(pired_filename);
        custom.pired = a.array;
        a = load(ecg_filename);
        custom.ecg = a.array;
%         custom.heart_rate = C{9}{i+1};
    catch
        fprintf([num2str(i+1),' data loss\n'])
        continue
    end
    num = num+1;
    data{num} = custom;
end

    