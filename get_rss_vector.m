function ret = get_rss_vector(fileName)
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
            rss(i,j) = get_total_rss(csi_energy_los);
         end
    end
    
    ret = rss;
end