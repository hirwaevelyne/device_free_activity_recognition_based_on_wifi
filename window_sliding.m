function ret = window_sliding(x)
    w = 3;
    N = length(x);
    
    n = conv(ones(1, N), ones(1, w), 'same');
    
    s = conv(x, ones(1, w), 'same');
    
    q = x.^2;
    q = conv(q, ones(1, w), 'same');
    
    o = (q - s .^ 2 ./ n) ./ (n - 1);
    
    ret = o .^ 0.5;
end