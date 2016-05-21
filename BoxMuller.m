function [ Z ] = BoxMuller( x )

  if(nargin == 0)
    x = 1;
  end

  U = rand(x, 2);
  
  theta = 2 .* pi .* U(:, 2);
  rho   = sqrt( -2 .* log(U(:, 1)) );
  
  Z = [ rho .* cos(theta), rho .* sin(theta) ];

end