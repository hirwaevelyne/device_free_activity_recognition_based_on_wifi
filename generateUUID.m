function ret = generateUUID(start, l) 
    uuid =[];
    l = l * 2;
    for i=start:l
        uuid = [uuid, i];
    end
    
    ret = uuid;
end