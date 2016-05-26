function [ rnStep ] = LCGstep()

  persistent seed;
  M = 244944;
  a = 1597;
  b = 51749;
  
  if(isempty(seed))
    seed = 0;
  end
  
  seed = mod(seed * a + b, M);
  
  rnStep = seed / M;

end
