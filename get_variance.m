function ret = get_variance(M) 
    n = 0;
    S = 0.0;
    m = 0.0;
    
    for i=1:length(M)
        n = n + 1;
        m_prev = m;
        m = m + (M(i,:) - m) / n;
        S = S + (M(i,:) - m) * (M(i,:) - m_prev);
    end    
    
    ret = S/n;
end