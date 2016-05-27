function [ rn ] = LCG( x ) 

  if(nargin == 0)
    x = 1;
  end
  
  rn = zeros(x,1);
  
  for i = 1:x
    rn(i) = LCGstep();
  end

end

function [ rnStep ] = LCGstep()

  persistent seed;
  M = 244944;
  a = 1597;
  b = 51749;
  
  if(isempty(seed))
    seed = 0;
  end
  
  seed = mod(seed .* a + b, M);
  
  rnStep = seed ./ M;

end

