function [ rn ] = LCGbad( x ) 

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
  M = 2048;
  a = 1229;
  b = 1;
  
  if(isempty(seed))
    seed = 0;
  end
  
  seed = mod(seed .* a + b, M);
  
  rnStep = seed ./ M;

end

