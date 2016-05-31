clear;
clc;
close all;
figure;

smpSize = 10000;
COLS  = 2;
LINES = length(smpSize);
BINS = 40;

set(gcf, 'units', 'pixels', 'position', [0, 0, 1920, 800]);

subp = @(i) subplot(LINES,COLS,i);

for i = 1:length(smpSize)
  ii = i - 1;
  
  tic;
  dataA = LCG(smpSize(i));
  timeA = toc*1000;
  tic;
  dataB = LCGbad(smpSize(i));
  timeB = toc*1000;
  
  a = subp(ii * COLS + 2);
  scatter(dataA(1:2:smpSize(i)), dataA(2:2:smpSize(i)), 16, [0,0,0], 'filled');
  title(a, sprintf('M = 244944, a = 1597, b = 51749, 10^{%d} samples, {%0.2f}ms', log10(smpSize(i)), timeA), 'FontSize', 20);
  
  b = subp(ii * COLS + 1);
  scatter(dataB(1:2:smpSize(i)), dataB(2:2:smpSize(i)), 16, [0,0,0], 'filled');
  title(b, sprintf('M = 2048, a = 1229, b = 1, 10^{%d} samples, {%0.2f}ms', log10(smpSize(i)), timeB), 'FontSize', 20);
  
end