clc;
clear;

% mean Activities
activity_samples = {};
activity_samples{1} = struct('sample', process_csi_data('walking4.dat'), 'h_title', '(a) Walking, round 1', 's_title', '(a) Moving Variance: %s');
activity_samples{2} = struct('sample', process_csi_data('sitting4.dat'), 'h_title', '(b) Sitting, round 1', 's_title', '(b) Moving Variance: %s');
activity_samples{3} = struct('sample', process_csi_data('walking9.dat'), 'h_title', '(c) Walking, round 2', 's_title', '(c) Moving Variance: %s');
activity_samples{4} = struct('sample', process_csi_data('sitting3.dat'), 'h_title', '(d) Sitting, round 2', 's_title', '(d) Moving Variance: %s');

activity_samples{5} = struct('sample', process_csi_data('standing6.dat'), 'h_title', '(e) Standing, round 1', 's_title', '(e) Moving Variance: %s');
activity_samples{6} = struct('sample', process_csi_data('lyingInTraceLos5.dat'), 'h_title', '(f) Lying In, round 1', 's_title', '(f) Moving Variance: %s');
activity_samples{7} = struct('sample', process_csi_data('standingTraceLos5.dat'), 'h_title', '(g) Standing, round 2', 's_title', '(g) Moving Variance: %s');
activity_samples{8} = struct('sample', process_csi_data('lyingInTraceLos2.dat'), 'h_title', '(h) Lying In, round 2', 's_title', '(h) Moving Variance: %s');

x = 1:1:30;
cell = 1;

figure

for i=1:4
   for j=1:2
       if j == 1, position_h = (i * 2) - 1; else, position_h = i * 2; end 
       subplot_histogram(4, 4, cell, activity_samples{position_h}, x) 
       cell = cell + 1;
   end
   for k=1:2
       if k == 1, position_s = (i * 2) - 1; else, position_s = i * 2; end
       subplot_spectrogram(4, 4, cell, activity_samples{position_s})
       cell = cell + 1;
   end
end
