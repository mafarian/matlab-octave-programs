Hey!

In this repository I submited a project about Shortest Path Problem, using the Dijkstra and Floyd-Warshall Algorithms
to solve a garbage collection problem.

PROBLEM CONTEXT
.In May 2018, Brazil stopped cause the truckers went on strike for around 1 week, preventing many commodities and 
resources from reaching the population. And one of those products was fuel!
.That affect not only the common population, but all the comunity essential services, like ambulances, public 
transportation and the GARBAGE COLLECTION! Because of it, all fuel avaiable at the fuel stations must serve 
that kinda essential services.
.So, beyond that, we simmulate this problem, trying to find the best route to collect all the non-recyclable trash from 
Barão Geraldo (Campinas, São Paulo - Brazil), maintaining a fuel limit in the truck tank.

PROBLEM SIMPLIFICATION
To solve this problem, we had to assume a few things:
- Number of collection points is less than in real life, and well-located to make the collection easier.
- The garbage containers are always at least half-full. The trash amount in one container is random number, between the half
and the intire container.
- Everytime the truck bucket is almost full (less then the capacity of a full container), it has to go to the landfill Delta A
to release the bucket.
- The fuel limit is calculated applying the Floyd-Warshall Algorithm (closest.m), to find the greatest shortest distance of
the hole map, cause the limit should be enough to travel to any fuel station in case of emergency, regardless of where the truck
is.
- Everytime the fuel truck is below the fuel limit, it has to go to a fuel station.
- The fuel suplly is a random value, between the limit and the limit double.

MAP (input data)
.The input data is a adjacency matrix, where the position (i,j) is equal to 0 if there's no direct path from i to j, and Cij if
there is a path, where Cij is the respective distance.


--
Stark.
