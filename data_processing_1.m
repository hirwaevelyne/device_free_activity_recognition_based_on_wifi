clc;
clear;

csi_trace = read_bf_file('data/standing3.dat');
csi_entry = csi_trace{2};

csi = get_scaled_csi(csi_entry);

snrTotal = get_eff_SNRs(csi);

tRSS = get_total_rss(csi_entry);

dB = db(abs(squeeze(mean(csi)).'));

% Sitting
%csiTraceSitting = read_bf_file('data/sitting4.dat');
%csi_entry_sitting = csi_trace{3};

%csi_sitting = get_scaled_csi(csi_entry_sitting);

%dB_sitting = mean(db(abs(squeeze(mean(csi_sitting))))).';


% plot(dB)
%legend('RX Antenna A', 'RX Antenna B', 'RX Antenna C', 'Location', 'SouthEast');
%xlabel('Subcarrier index');
%ylabel('SNR [dB]');
walking = process_csi_data('walking4.dat');

%fhp = hfilter;
%flp = lfilter;

%f_walking = filter(fhp, dB);
%f_sitting = filter(fhp, dB_sitting);

%walkingL = filter(flp, dB);
