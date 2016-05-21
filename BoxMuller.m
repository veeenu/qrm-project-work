function [ Z1, Z2 ] = BoxMuller( x )

  U  = LCG(x);
  U1 = U(1:2:x);
  U2 = U(2:2:x);
  
  theta = 2 * pi * U2;
  rho   = sqrt(-2 * log(U1));
  
  Z1 = rho .* cos(theta);
  Z2 = rho .* sin(theta);

end