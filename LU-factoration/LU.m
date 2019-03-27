% LU factorization 

function [L,U] = Fact_LU(A);
  [n,m] = size(A);
  L = eye(n); % matrix L has diagonal equal 1
  U = A;
  
  for r=1:(n-1) % row reduction / Gaussian elimination
    for c=(r+1):n
     m = (U(c,r)/U(r,r)); % multiplier
     U(c,:) = U(c,:) - m*U(r,:); % deletes the elements below the pivot
     L(c,r) = m; % inserting the multiplier in its respective position in L
    end
  end

  fprintf('\nLower triangular matrix L:\n');
  disp(L);
  fprintf('\nUper triangular matrix U:\n');
  disp(U);

end
