function ret = get_csi_vector(fileName, index)
    fullPath = fullfile([pwd '\data'], fileName);
    csi_trace_los = read_bf_file(fullPath);
    csi_vector = [];
    
    for i=1:6
    
         csi_energy_los = csi_trace_los {i};  
         csi_energy = get_scaled_csi(csi_energy_los);

         [M N S] = size(csi_energy);

         if (M >= 2)
             c = mean(csi_energy);
             csi_trace = squeeze(c);
         else
             csi_trace = squeeze(csi_energy);
         end
         
         a = db(abs(csi_trace));
         %a = a(:);
         if (length(csi_vector) == 0)
             csi_vector = a(index,:,:);
         else
             csi_vector = [csi_vector, a(1,:,:)];
         end
    end
    
    ret = csi_vector;
end