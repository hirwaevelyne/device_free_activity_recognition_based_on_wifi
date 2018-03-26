function [m_new, s2_new, x_hist] = moving_mean_var(m_prev, s2_prev, x_hist, x_new, w)

% FUNCTION:
%   [m_new, s2_new, x_hist] = moving_mean_var(m_prev, s2_prev, x_hist, x_new, w)
%
% DESCRIPTION:
%   Moving-window mean and moving-window variance derived using Welford's approach.
%   [Welford, 1962]: "Note on a method for calculating corrected sums of squares
%   and products." Technometrics Vol.4 No.3
%
%   The function can handle one-dimensional or two-dimensional data (e.g. image data).
%   The means and averages are calculated per entry, so size(m_new)=size(x_new).
%
%   The x_hist window must contain at least 1 frame at the outset. If the number of
%   frames in x_hist equals 1, m_prev and s2_prev need to be initialized to x_hist and 
%   zeros(size(xhist)) respectively. While size(x_hist,3)<w, the history will grow 
%   and the running mean and running variance from Welford are calculated instead of
%   the moving-window mean and variance. 
%   
%
% INPUT ARGUMENTS:
%   m_prev  = moving mean of previous iteration [.] (p-by-q)
%   s2_prev = moving variance of previous iteration [.] (p-by-q)
%   x_hist  = history of w observations [.] (grows to p-by-q-by-w)
%   x_new   = new observation [.] (p-by-q)
%   w       = moving window size [-] (scalar)
%   
% OUTPUT ARGUMENTS:
%   m_new  = new moving mean [.] (p-by-q)
%   s2_new = new moving variance [.] (p-by-q)
%   x_hist = updated history of w observations [.] (grows to p-by-q-by-w)
%
% EXAMPLE:
%
%   clear; close all; clc;
%
%   % Parameters  
%   N = 1000; % Number of iterations [-]
%   p = 10; % Number of rows per data frame [-]
%   q = 20; % Number of columns per data frame [-]
%   w = 40; % Window size [-]
%
%   % Initialize variables
%   x_hist = randn(p,q); % Initialize history with first data frame (will grow to be p-by-q-by-w)
%   m   = mean(x_hist,3); % Initialize mean
%   s2  = zeros(p,q); % Initialize variance
%   
%   % Simulate data stream and calculate moving mean and variance
%   for i = 2:N % NOTE: you have to start at 2, otherwise the variance will be incorrect while i<w
%     
%       % Get new dummy frame
%       x_new = randn(p,q);
%     
%       % Compute moving-window mean (m) and moving-window variance (s2)
%       [m, s2, x_hist] = moving_mean_var(m, s2, x_hist, x_new, w);
%       
%   end
%
%   NOTE: The running mean and variance 
%
% Author: D.J. van Gerwen
% Created: 18-Jun-2014

% Old length of history
wo = size(x_hist,3);

% Update history
x_old = x_hist(:,:,max(1,end-w+1)); % Update x_old
x_hist = cat(3,x_hist(:,:,max(1,end+2-w):end),x_new); % Grow history until size w, then append new x and remove oldest x

% New length of history
wn = size(x_hist,3);

% Update mean and variance
if wo < w % Important to use the length of the old history, because the growing window still needs to be used when wc=w for the first time.
    m_new  = m_prev  + (x_new-m_prev)/wn; % Running mean [Welford 1962] Eq.1
    s2_new = s2_prev*(wn-2)/(wn-1) + (x_new-m_prev).^2/wn; % Running variance [Welford 1962] Eq.I
    
else
    m_new  = m_prev + (x_new-x_old)/wn; % Moving-window mean
    s2_new = abs( s2_prev + ( (x_new-m_prev).^2 - (x_old-m_prev).^2 - wn*(m_new-m_prev).^2 ) / (wn-1) ); % Movgin-window variance
    % NOTE: Due to numerical issues, the expression above may lead to very small
    % negative numbers, but variance must always be positive, hence the use of abs().
end
