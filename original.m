clc;
clear;
 fileName = fullfile([pwd '\data'],'sitting1.dat');
 csi_trace_los = read_bf_file(fileName);
 l = length(csi_trace_los);
 
 % csiEnergyLos;
 
 for i=1:l
    
     csi_energy_los = csi_trace_los {i};  
     csi_energy = get_scaled_csi(csi_energy_los);
     
     csi_data1 = csi_energy(1,:,:);
     csi_trace2 = squeeze(csi_data1); 
     csi_data = csi_trace2(1,:);

     csi_ifft= ifft(csi_data);
     csiI =db(abs(csi_ifft));
     [max_energy,time_index]=max(csiI);
     max_time_index(i,:)=time_index;
 end
 
 smoothed = csiI.*(csiI)/max(abs(csiI));
 
figure
x=1:1:30;
plot(x, smoothed);
grid on;

spectrogram(csiI,[],[],[],[],'yaxis')
axis([0,30,-30,30]);
xlabel('Subcarrier Index');
ylabel('Amplitude');
% set(gca,'FontName','Times New Roman','FontSize',10);
% set(get(gca,'xlabel'),'fontweight','bold','fontsize',12);
%. set(get(gca,'ylabel'),'fontweight','bold','fontsize',12);