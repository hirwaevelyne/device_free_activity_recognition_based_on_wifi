clc;
clear;
fileName = fullfile([pwd '\data'],'standing4.dat');
csi_trace = read_bf_file(fileName);
csi_entry = csi_trace{1};
csi = get_scaled_csi(csi_entry);

snr = mean(csi);
csi_data = db(abs(squeeze(snr).'));

figure

plot(csi_data)
legend('RX A', 'RX B', 'RX C', 'Location', 'SouthEast');
xlabel('Subcarrier index');
ylabel('SNR [dB]');
