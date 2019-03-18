% find the longest path lenght by Floyd-Warshall's method

function max = longest_path(A)
  [n,n] = size(A);
  max = 0;
  
  for i = 1:n
    for j = 1:n
      [d,p] = dijkstra(A, i, j);
      if d > max && d != Inf
        max = d;
      end
    end
  end
