clear;
clc;
tyy = imread('ty2.png');
tyy = tyy(:,:,1);

count = 0;
sz = size(tyy);

for y = 1:sz(1)
  for x = 1:sz(2)
    if(tyy(y,x) == 0); count = count + 1; end;
  end
end

img = zeros(316,2);
tcount = count;

for y = 1:sz(1)
  for x = 1:sz(2)
    if(tyy(y,x) == 0)
      img(317-count,:) = [x; sz(1)-y];
      count = count - 1;
    end
  end
end

s = '[';

for x = 1:tcount
  s = strcat(s, sprintf('%d,%d;', img(x,1), img(x,2)));
end;

s = strcat(s, ']');