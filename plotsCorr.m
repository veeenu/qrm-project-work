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
  dataA = CorrelatedRV(smpSize(i), [0 0], [ 1 0 ; 0 1 ]);
  timeA = toc*1000;
  tic;
  dataB = CorrelatedRV(smpSize(i), [0 0], [ 1 0.8 ; 0.8 1 ]);
  timeB = toc*1000;
  tic;
  dataC = CorrelatedRV(smpSize(i), [0 0], [ 1 -0.2 ; -0.2 1 ]);
  timeC = toc*1000;
  
  a = subp(ii * COLS + 1);
  hist3(dataA, BINS);
  title(a, sprintf('\\rho = 0, 10^{%d} samples, {%0.2f}ms', log10(smpSize(i)), timeA), 'FontSize', 20);
  
  b = subp(ii * COLS + 2);
  hist3(dataB, BINS);
  title(b, sprintf('\\rho = 0.8, 10^{%d} samples, {%0.2f}ms', log10(smpSize(i)), timeB), 'FontSize', 20);
  
  c = subp(ii * COLS + 3);
  hist3(dataC, BINS);
  title(c, sprintf('\\rho = -0.2, 10^{%d} samples, {%0.2f}ms', log10(smpSize(i)), timeC), 'FontSize', 20);
end