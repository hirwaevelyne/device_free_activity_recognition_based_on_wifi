function ret = process_csi_data(fileName)
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

         csiData(i,:) = ifft(sum(csi_trace));
         csiData1(i,:) = db(abs(csiData(i,:)));
    end
    
    ret = csiData1;
end