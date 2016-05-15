function [ rn ] = FIBG( x )

  if(nargin == 0)
    x = 1;
  end
  
  rn = zeros(x, 1);
  
  for i = 1:x
    rn(i) = FIBGstep();
  end

end

function [ rnStep ] = FIBGstep()

  persistent seed;
  persistent last;
  
  if(isempty(seed))
    seed = zeros(4096, 1);
    seed(1:17) = LCG(17);
    last = 17;
  end
  
  if(last >= length(seed))
    nl = length(seed) - 1;
    seed(nl:nl + 4095) = zeros(4096,1);
  end
  
  last = last + 1;
  seed(last) = mod(seed(last - 17) - seed(last - 5) + 1, 1);
  
  rnStep = seed(last);

end