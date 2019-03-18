% finds out which node is the closest from current point

function [k,d_k] = closest(dis, list)
  [m,n] = size(list);
  
  k = list(1);
  d_k = dis(k);
  
  for i = 2:n
    if dis(list(i)) < d_k 
      k = list(i);
      d_k = dis(k);
    end
  end
