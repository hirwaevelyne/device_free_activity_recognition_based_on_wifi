clear;
clc;
fileName = fullfile([pwd '\data'], 'walking4.dat');
csi_trace = read_bf_file(fileName);
csi_entry = csi_trace{1};
csi = get_scaled_csi(csi_entry);

snr = mean(csi);

M = squeeze(movvar(snr, 3, 0, 2));
invM = M.';



figure
%plot(invM)
%spectrogram(mean(M),[],[],[],[],'xaxis')
plot(db(abs(squeeze(snr).')))
%legend('RX A', 'RX B', 'RX C', 'Location', 'SouthEast');
%xlabel('Subcarrier index');
%ylabel('SNR [dB]');
