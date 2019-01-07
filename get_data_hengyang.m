%%%  从new的文件中获取数据    对于以前的 和 衡阳的  要修改读入pulse的位置！！
%%%
% data_path = '.\medical_data_new';
data_path = '.\medical_data_hengyang';
data_path = '.\choose_data';
data_path = [data_path,'\all_data\medical_data_hengyang'];
opts.plot=0;
data = {};
data_num = 0;

worker_num = 0;
work_name = {};
work_total_pulse_num = [];
work_good_num = [];
work_bad_num=[];
work_wrong_id_num = [];
work_good_rate = [];
work_wrong_id_rate = [];
work_wrong_length_num = [];
work_bad_rate = [];
dirs = dir([data_path,'\*']);
for i=1:length(dirs)
    if (dirs(i).isdir && ~strcmp(dirs(i).name,'.') && ~strcmp(dirs(i).name,'..') )
        str_path=[data_path,'\',dirs(i).name];
        filename =  dir([str_path,'\*']);
         for ii = 1:length(filename)
            if (filename(ii).isdir && ~strcmp(filename(ii).name,'.') && ~strcmp(filename(ii).name,'..'))
                file_path = [str_path,'\',filename(ii).name];
                file = dir([file_path,'\*.csv']);

                
                a={};
                for j = 1:length(file)
                    a = [a;get_GoodIdWithPweeks([file_path,'\',file(j).name])];
                end
                %怀孕周数的汇总在 '\medical_data\南京华世佳宝-叶朵-20180724\20182724\customs-2018224.cvs'
                %第二三层文件名可被替换  层数固定
                
                pulse_path = [file_path,'\csv\HK-2010'];
                pulse_file = dir([pulse_path,'\*.csv']);

                
                good_num = 0;
                bad_num = 0;
                pulse_num = length(pulse_file);
                total_id = size(a,1);
%                 wrong_id = pulse_num/2-total_id;
                wrong_length = 0;
                
                
                for k = 1:size(a,1)
                    id = a{k,1};
                    pweeks = a{k,2};
                    for kk = 1:pulse_num
                        pulse_i = pulse_file(kk);
                        name_i = pulse_i.name;
                        if contains(string(name_i),id) 
                            b = xlsread([pulse_path,'\',pulse_i.name]);
                            custom = struct();
                            custom.customid = id;
                            custom.pweeks = pweeks;
                            if isempty(b)
                                wrong_length = wrong_length + 1;
                                continue
                            end
%              
% % %  衡阳数据存在第2列 只有pulse                           
                            custom.pulse = b(:,2);    %%衡阳的数据格式
   
% 
% % % 以前的新数据 第2列为spressure 第3列为pulse
% %                             custom.spressure = b(:,2);
% %                             custom.pulse = b(:,3);
% %                             custom.data=custom.spressure - custom.pulse;
                            
                            pulse_length = length(custom.pulse);
                            if pulse_length > 5000 || pulse_length < 500
                                wrong_length = wrong_length + 1;
                                continue
                            end
                            opts.data={custom};
                            data_num = data_num+1
                            data{data_num} = custom;
                            quality = f2_neighbor(1,opts);
                            if quality == 1
                                good_num = good_num+1;
                            else
                                bad_num = bad_num+1;
                            end
                        end
                    end
                end
                worker_num = worker_num+1;
%                 work_name{worker_num} = filename(ii).name;
                work_name{worker_num} = dirs(i).name;
                work_total_pulse_num(worker_num) = pulse_num;
                work_good_num(worker_num) = good_num;
                work_bad_num(worker_num) = bad_num;
%                 work_wrong_id_num(worker_num) = wrong_id;
                work_good_rate(worker_num) = good_num/pulse_num;
                work_wrong_length_num(worker_num) = wrong_length;
                work_bad_rate(worker_num) = bad_num/pulse_num;
            end
        end
    end
end

% datacolumns = {'name','total_pulse_num','good_num','good_rate',...
%                'bad_num','bad_rate','wrong_length_num'};
% 
% sumary_data = table(work_name',work_total_pulse_num',work_good_num',work_good_rate',...
%                work_bad_num',work_bad_rate',work_wrong_length_num','VariableNames', datacolumns);
% % % 
% % % % writetable(sumary_data,'sumary.xls')
