function garbage_collection

map = load('data.m');

collection_list = [1,2,9,12,23,31,40,25,52,32,47,57,33,42,54,63,17,5,21,95,68,49,59,73,89,91,82,100,113,109,102,101,111,118,123,125,127,133,134,138];
fuelstation_list = [60,77,136];

collection_nodes = length(collection_list);
 
dist_barao_landfill = 25000; % meters
fuel = 9; % liter
bucket_capacity = 16000; % liter
truck_efficiency = 3000; % meters/liter
container_capacity = 1000; % liter
garbage_collected = 0; % liter
fuel_limit = 13; % liter
total_distance = 0; % meters

fprintf('Fuel limit calculated: %.2f liters. \n\n', fuel_limit);
free_bucket = bucket_capacity;

disp("Collection truck starts the trip from LANDFILL DELTA A, to Barao Geraldo's ENTRANCE/EXIT FUELS STATION:");
fprintf('Travelled distance: %d meters. \n\n', dist_barao_landfill);

i = 136; % Collection truck left ENTRANCE/EXIT FUELS STATION to begin the collection

while !isempty(collection_list)
  if fuel <= fuel_limit
    % need to fuel the truck
    if i == 136
      fuel = (1+rand)*fuel_limit;
    else      
      % compute the distance, and the respective path, from the current node to the others
      [dis,P] = dijkstra(map, i, []);
      % pick the closest fuelstation node 
      [k, d_k] = closest(dis, fuelstation_list);
      total_distance += d_k;
  
      fprintf('Left node %d and goes to FUEL STATION %d along the route: \n', i, k);
      disp(cell2mat(P(1,k)));   
      
      fprintf('Travelled distance: %d meters. \n', d_k);

      fuel -= d_k/truck_efficiency;
      i = k;
      
      fuel = (1+rand)*fuel_limit;
    end
    
    fprintf('Amount of fuel in the tank, after stocked: %2.f liters. \n\n', fuel);
  end
  
  if free_bucket < container_capacity
    % verify if the truck bucket is almost full
    [dis, P] = dijkstra(map, i,[]);
    total_distance += d_k;
    
    fprintf('Left from node %d, and goes to ENTRANCE/EXIT FUELS STATION: \n', i);   
    disp(cell2mat(P(1,136)));
    
    fuel -= dis(136)/truck_efficiency;
    
    fprintf('Travelled distance: %d meters. \n', dis(136));
    fprintf('Amount of fuel in the tank: %2.f liters. \n\n', fuel);
    
    if fuel < fuel_limit
      fuel = (1+rand)*fuel_limit;
      disp("Truck fueled, and goes to LANDFILL DELTA A, empties the bucket and returns to Barao Geraldo's ENTRANCE/EXIT FUELS STATION: \n\n");
    end
    
    i = 136;
    free_bucket = bucket_capacity;
    
  end

  % going to next collection point
  [dis, P] = dijkstra(map, i, []);
  [k, d_k] = closest(dis, collection_list);
  total_distance += d_k;
  
  fprintf('Left node %d e goes to COLLECTION NODE %d along route:\n', i, k);   
  disp(cell2mat(P(1,k)));

  i = k;
  
  for j = 1:collection_nodes
    if collection_list(j) == k  
      collection_list(j) = []; % remove the node already collected from the list
      break
    end
  end
  collection_nodes -= 1;
  
  fuel -= d_k/truck_efficiency;
  
  garb = (rand*container_capacity)/4;
  free_bucket -= garb;  % compute randomly the garbage quantity of the current container 
  garbage_collected += garb;
  
  fprintf('Travelled distance: %d meters. \n', d_k);
  fprintf('Amount of fuel in the tank: %2.f liters. \n', fuel);
  fprintf('Bucket free space: %.2f liters. \n\n', free_bucket);
end

[dis, P] = dijkstra(map, i,[]);

fprintf('Left node %d and goes to ENTRANCE/EXIT FUELSTATION along route:\n', i);   
disp(cell2mat(P(1,136)));

fuel -= dis(136)/truck_efficiency;
total_distance += dis(136);

fprintf('Distance travelled: %d meters. \n', dis(136));
fprintf('Amount of fuel in the tank: %2.f liters. \n\n', fuel);
   
if fuel < fuel_limit
  fuel = (1+rand)*fuel_limit;
end

disp('Truck goes finally to LANDFILL DELTA A.');
fprintf('Total distance travelled inside Barao Geraldo: %d meters.\n', total_distance);
fprintf('Amount of fuel spent: %2.f liters.\n', (total_distance/truck_efficiency));
fprintf('Total garbage collected, pressed: %.2f liters. \n', garbage_collected);
