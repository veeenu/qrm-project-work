close all;
figure;

smpSize = [ 100 10000 1000000 ];
COLS  = 3;
LINES = length(smpSize);

subp = @(i) subplot(LINES,COLS,i);

for i = 1:length(smpSize)
  ii = i - 1;
  
  dataA = rand(smpSize(i), 1);
  dataB = LCG(smpSize(i));
  dataC = norminv(dataB, 0.5, 0.5);
  
  a = subp(ii * COLS + 1);
  histogram(dataA, 10);
  title(a, sprintf('MATLAB rand(), 10^{%d} samples', log10(smpSize(i))));
  
  b = subp(ii * COLS + 2);
  histogram(dataB, 10);
  title(b, sprintf('LCG, 10^{%d} samples', log10(smpSize(i))));
  
  c = subp(ii * COLS + 3);
  histogram(dataC, 50);
  title(c, sprintf('LCG normal inversion, 10^{%d} samples', log10(smpSize(i))));
end

% f = FIBG(64);