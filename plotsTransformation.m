clear;
clc;
close all;
figure;

set(gcf, 'units', 'pixels', 'position', [0, 0, 1920, 1080]);

smpSize = [ 100 10000 1000000 ];
COLS  = 3;
LINES = length(smpSize);

subp = @(i) subplot(LINES,COLS,i);

transfExp = @(x) -log(x);
invCauchy = @(x) tan(pi .* (x - 1 / 2));

for i = 1:length(smpSize)
  ii = i - 1;
  
  dataA = norminv(rand(smpSize(i), 1), 0.5, 0.5);
  dataB = dataA;
  dataC = invCauchy(dataA);
  
  a = subp(ii * COLS + 1);
  histogram(dataA, 100);
  title(a, sprintf('Std normal, 10^{%d} samples', log10(smpSize(i))), 'FontSize', 20);
  
  b = subp(ii * COLS + 2);
  histogram(dataB, 0:0.1:5);
  title(b, sprintf('Exponential, 10^{%d} samples', log10(smpSize(i))), 'FontSize', 20);
  
  c = subp(ii * COLS + 3);
  histogram(dataC, -5:0.1:5);
  title(c, sprintf('Cauchy, 10^{%d} samples', log10(smpSize(i))), 'FontSize', 20);
end