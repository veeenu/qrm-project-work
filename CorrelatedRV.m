function [ Zc ] = CorrelatedRV( x, mu, Sigma )

  if(nargin == 0)
    x = 1;
  end
  
  A = chol(Sigma);
  Z = BoxMuller(x);
  
  mu = mu(:);
  Zc = zeros(x,2);
  
  for i = 1:x
    Zc(i,:) = mu + (A * Z(i,:)');
  end

end