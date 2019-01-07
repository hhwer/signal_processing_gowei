% % noisePart_1 = cell(1,3000);
% noisePart_2 = cell(1,3000);
% noisePart_3 = cell(1,3000);
% noisePart_4 = cell(1,3000);
% for i = 1:3000
%     try
% %         x = Part_1{i};
% %         x(1,:) = add_noise(x(1,:));
% %         x(3,:) = add_noise(x(3,:));
% %         noisePart_1{i} = x;
%         x = Part_2{i};
%         x(1,:) = add_noise(x(1,:));
%         x(3,:) = add_noise(x(3,:));
%         noisePart_2{i} = x;
%         x = Part_3{i};
%         x(1,:) = add_noise(x(1,:));
%         x(3,:) = add_noise(x(3,:));
%         noisePart_3{i} = x;
%         x = Part_4{i};
%         x(1,:) = add_noise(x(1,:));
%         x(3,:) = add_noise(x(3,:));
%         noisePart_4{i} = x;
%     catch
%         disp(i)
%     end
% end



% % signal = load('/home/hh/signal_processing/signal_progressing-master/test_old/wfdb-data/5b/5bff7/5bff72a90d49c87b775f50edpred.mat');
% % signal = signal.array;
% % signal = data{1}.pred(11000:14000);
% signal = Part_1{2}(1,1000:4000);
% level = 12;
% wave_name = 'db5';
% [c,l] = wavedec(signal, level, wave_name);
% d_level = 7;
% x = wrcoef('a', c, l, wave_name, d_level);
% figure(1)
% subplot(2,1,1)
% plot(signal);
% hold on
% plot(x, 'LineWidth', 2)
% hold off
% subplot(2,1,2)
% plot(signal-x+mean(x))
% 
% y = signal-x;
% noise=0.1;
% y = y+noise*rand(size(y))*(max(yhttps://cpro.baidu.com/cpro/ui/uijs.php?en=mywWUA71T1YsFh7sT7qGujYsFhPC5H0huAbqrauGTdq9TZ0qnauJp1d-uyFbPjK9ujDLmWDzPHwBFh_qmzRzfBRzfBNaniN7naNanzNjfzNDniNKPzNjwBNanauonjdWFHFaFHFaFRckFRRsFRc1FRPjFRfkFRDLFRPAFRcsFh_k5yn-nbc-nbc-wjn-fYR-fYm-fWT-fWD-wH0-fWn-fYnhp1cqIyT-fWD-wH0-fWn-fYn-wjD-fHT-fYm-fW0hp1nqFRn3FRRLFRFKFRP7FRfkFRDLFRckFRRsFRc1FRPjFh_Y5iNDniNKPzNjriNAfiNaniN7naNanzNjfzuoPHY-fWD-wH0-fWn-fYn-f1R-wH0-wjD-fWR-fWm-wH0-f1b-wjb-f1T-fRRhUZNopHYYFhdWTAYqnWT1rH6hTHdWTvw8mh7GuZNxmLKzFMFB5H0hTMnqniu1uyk_ugFxpyfqniu1pyfqPAczPycknHI9ujfsmhw-uiu1IA-b5HRhIjdYTAP_pyPouyf1gv9WFMwb5HndnjD1rH6hIAd15HDdPjmkn16LrjThIZRqIHndnjD1rH6hIHdCIZwsTzR1fiRzwBRzwhF_UvT-nbNWTvw8FHF7UhNYFMmqniuG5H01uhuhuWw-&c=news&cf=1&expid=9002_9012_9013_9082_9230_9512_9527_9551_9559_9564_9566_9570_9588&fv=0&itm=0&kdi0=8&kdi1=8&kdi2=8&kdi3=8&kdi4=8&kdi5=8&lu_idc=yf&lukid=4&lus=4b25b117ad40bdee&lust=5c2834a3&mscf=0&n=10&nttp=1&p=baidu&ssp2=1&tsf=dtp:1&u=%2Fqq%5F19531479%2Farticle%2Fdetails%2F79468458&urlid=0)-min(y));
% subplot(2,1,2)
% % plot(y+x)
% % figure(2)
% % plot(signal(10001:13000)-x(10001:13000))
% 
% % N = length(x);
% % d = 3000;
% % b = ones(1, d)/d;
% % tic;
% % x_ave = filter(b, 1, x);
% % x_ave = x_ave(d:N);
% % z = 0;
% % for i = 1:d
% %     z = z + (x(i:N-d+i)-x_ave).^2;
% % end
% % z = z/(d-1);
% % t1 = toc;
% % % figure(3)
% % % plot(z)
% % 
% % % tic;
% % % z1 = zeros(1,N-d+1);
% % % for i = 1:N-d+1
% % %     z1(i) = var(x(i:i+d-1));
% % % end
% % % t2 = toc;
% % 
% % figure(3)
% % [y1,idx1] = findpeaks(-z,'minpeakdistance',d);
% % plot(z)
% % hold on
% % plot(idx1,-y1,'ro')
% % hold off