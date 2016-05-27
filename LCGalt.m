function [ rn ] = LCGalt( x ) 
% I have no clue as to why this function is 9x-10x faster than the other
% one (with the nested function call). Somebody should give a call to
% Matlab developers and suggest them an easy introductory book on
% compiler optimization.
  persistent seed;
  M = 244944;
  a = 1597;
  b = 51749;
  
  if(isempty(seed))
    seed = 0;
  end

  if(nargin == 0)
    x = 1;
  end
  
  rn = zeros(x,1);
  
  for i = 1:x
    seed = mod(seed .* a + b, M);
    rn(i) = seed ./ M;
  end

end
