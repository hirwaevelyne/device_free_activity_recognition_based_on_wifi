function ret = create_vector_label(l, label)
    lb = [];
    for i=1:l
        if (length(lb) == 0)
            lb = label;
        else
            lb = char(lb, label);
        end
    end
    
    ret = lb;
end