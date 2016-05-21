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
  
  dataA = norminv(rand(smpSize(i), 2), 0.5, 0.5);
  dataB = BoxMuller(smpSize(i));
  dataC = Marsaglia(smpSize(i));
  
  a = subp(ii * COLS + 1);
  hist3(dataA, BINS);
  title(a, sprintf('norminv(rand()), 10^{%d} samples', log10(smpSize(i))));
  
  b = subp(ii * COLS + 2);
  hist3(dataB, BINS);
  title(b, sprintf('Box-Muller, 10^{%d} samples', log10(smpSize(i))));
  
  c = subp(ii * COLS + 3);
  hist3(dataC, BINS);
  title(c, sprintf('Marsaglia, 10^{%d} samples', log10(smpSize(i))));
end