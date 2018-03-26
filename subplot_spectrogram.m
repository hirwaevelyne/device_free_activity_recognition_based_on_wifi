function subplot_spectrogram(row, column, position, data)
    mv = movvar(data.sample, 3);
    v = get_variance(mv.');
    subplot(row,column,position)
    spectrogram(mv,[],[],[],[],'xaxis')
    title(sprintf(data.s_title, num2str(v)), 'FontSize', 9)
    xlabel('Packet Index')
    ylabel('Subcarriers')
    set(gca,'fontsize',8) 
    colorbar('off')
end