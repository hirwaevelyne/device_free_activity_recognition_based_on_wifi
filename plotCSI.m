%function plotCSI(fileName)
    csi_trace_los = read_bf_file('data/lyingInTraceLos2.dat');

    csi_energy_los = csi_trace_los {4};  
    csi_energy = get_scaled_csi(csi_energy_los);
    csi_trace = squeeze(csi_energy);

    a = db(abs(csi_trace));
    a = a.';
    
    fhp = hfilter;
    flp = lfilter;

    fl = filter(fhp, a);
    lf = filter(fhp, a);
    
    mv = movvar(a, 3);
    
    subplot(2,1,1)
    plot(a)
    axis([0 30 0 30])
    legend('RX Antenna A', 'RX Antenna B', 'RX Antenna C', 'Location', 'SouthEast');
    title('(A4)Lying In', 'FontSize', 11)
    xlabel('Subcarrier index');
    ylabel('Amplitude [dB]');
    set(gca,'fontsize',11) 
    
    subplot(2,1,2)
    plot(mv)
    axis([0 30 -10 200])
    legend('RX Antenna A', 'RX Antenna B', 'RX Antenna C', 'Location', 'NorthEast');
    title('(A4)Lying In filtered', 'FontSize', 11)
    xlabel('Subcarrier index');
    ylabel('Amplitude [dB]');
    set(gca,'fontsize',11) 
%end