function [ rn ] = LCG( x ) 

  if(nargin == 0)
    x = 1;
  end
  
  rn = zeros(x,1);
  
  for i = 1:x
    rn(i) = LCGstep();
  end

end
