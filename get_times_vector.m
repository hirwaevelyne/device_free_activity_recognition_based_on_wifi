function ret = get_times_vector(fileName)
    fullPath = fullfile([pwd '\data'], fileName);
    csi_trace_los = read_bf_file(fullPath);
    
    for i=1:length(csi_trace_los) 
    
         csi_energy_los = csi_trace_los {i};  
         csi_energy = get_scaled_csi(csi_energy_los);

         [M N S] = size(csi_energy);

         if (M >= 2)
             c = mean(csi_energy);
             csi_trace = squeeze(c);
         else
             csi_trace = squeeze(csi_energy);
         end
         
         for j=1:90
             t = csi_energy_los.timestamp_low;
             str = num2str(t);
             dn = datenum(str, 'yyyymmddHHMM');
             ds = datestr(dn, 'yyyy-mm-dd HH:MM');
             disp(ds)
            times(i,j) = ' ';
         end
    end
    
    ret = times;
end