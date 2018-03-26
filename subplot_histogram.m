function subplot_histogram(row, column, position, data, xaxis)
    subplot(row,column,position)
    bar(xaxis, data.sample)
    axis([0 30 0 30])
    title(data.h_title, 'FontSize', 9)
    xlabel('CSI Amplitude')
    ylabel('Subcarriers')
    set(gca,'fontsize',8) 
end