close all;
figure;

smpSize = [ 10 1000 1000000 ];
COLS  = 4;
LINES = length(smpSize);

subp = @(i) subplot(LINES,COLS,i);

for i = 1:length(smpSize)
  ii = i - 1;
  
  dataA = rand(smpSize(i), 1);
  dataB = LCG(smpSize(i));
  dataC = FIBG(smpSize(i));
  dataD = norminv(dataC, 0.5, 0.5);
  
  a = subp(ii * COLS + 1);
  histogram(dataA, 10);
  title(a, sprintf('MATLAB rand(), %d samples', smpSize(i)));
  
  b = subp(ii * COLS + 2);
  histogram(dataB, 10);
  title(b, sprintf('LCG, %d samples', smpSize(i)));
  
  c = subp(ii * COLS + 3);
  histogram(dataC, 10);
  title(c, sprintf('Fibonacci, %d samples', smpSize(i)));
  
  d = subp(ii * COLS + 4);
  histogram(dataD, 100);
  title(d, sprintf('Fibonacci normal inversion, %d samples', smpSize(i)));
end

f = FIBG(64);