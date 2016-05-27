clear;
clc;
close all;
figure;

set(gcf, 'units', 'pixels', 'position', [0, 0, 1920, 1080]);

smpSize = [ 100 10000 1000000 ];
COLS  = 3;
LINES = length(smpSize);

subp = @(i) subplot(LINES,COLS,i);

invExp = @(x) -log(1-x);
invCauchy = @(x) tan(pi .* (x - 1 / 2));

for i = 1:length(smpSize)
  ii = i - 1;
  
  tic; dataA = rand(smpSize(i), 1); timeA = toc * 1000;
  tic; dataB = invExp(dataA); timeB = toc * 1000;
  tic; dataC = invCauchy(dataA); timeC = toc * 1000;
  
  a = subp(ii * COLS + 1);
  histogram(dataA, 10);
  title(a, sprintf('MATLAB rand(), 10^{%d} samples, {%0.2f}ms', log10(smpSize(i)), timeA), 'FontSize', 20);
  
  b = subp(ii * COLS + 2);
  histogram(dataB, 0:0.1:5);
  title(b, sprintf('Exponential, 10^{%d} samples, {%0.2f}ms', log10(smpSize(i)), timeB), 'FontSize', 20);
  
  c = subp(ii * COLS + 3);
  histogram(dataC, -5:0.1:5);
  title(c, sprintf('Cauchy, 10^{%d} samples, {%0.2f}ms', log10(smpSize(i)), timeC), 'FontSize', 20);
end