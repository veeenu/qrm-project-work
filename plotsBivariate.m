clear;
clc;
close all;
figure;

smpSize = [ 100 10000 1000000 ];
COLS  = 3;
LINES = length(smpSize);
BINS = [ 40, 40 ];

set(gcf, 'units', 'pixels', 'position', [0, 0, 1920, 1080]);

subp = @(i) subplot(LINES,COLS,i);

for i = 1:length(smpSize)
  ii = i - 1;
  
  tic;
  dataA = norminv(rand(smpSize(i), 2), 0.5, 0.5);
  timeA = toc*1000;
  tic;
  dataB = BoxMuller(smpSize(i));
  timeB = toc*1000;
  tic;
  dataC = Marsaglia(smpSize(i));
  timeC = toc*1000;
  
  a = subp(ii * COLS + 1);
  hist3(dataA, BINS);
  title(a, sprintf('norminv(rand()), 10^{%d} samples, {%0.2f}ms', log10(smpSize(i)), timeA), 'FontSize', 20);
  
  b = subp(ii * COLS + 2);
  hist3(dataB, BINS);
  title(b, sprintf('Box-Muller, 10^{%d} samples, {%0.2f}ms', log10(smpSize(i)), timeB), 'FontSize', 20);
  
  c = subp(ii * COLS + 3);
  hist3(dataC, BINS);
  title(c, sprintf('Marsaglia, 10^{%d} samples, {%0.2f}ms', log10(smpSize(i)), timeC), 'FontSize', 20);
end