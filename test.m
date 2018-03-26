clear;
clc;
a = randi(100,[1,50]);  % My sequence
win_width = 10;  %Sliding window width
slide_incr = 1;  %Slide for each iteration
numstps = (length(a)-win_width)/slide_incr; %Number of windows
for i = 1:numstps
   mean_win(i) = mean(a(i:i+win_width));  %Calculation for each window
end
plot(mean_win)