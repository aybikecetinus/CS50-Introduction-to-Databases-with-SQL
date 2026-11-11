# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Adopt this approach: Splitting the data across multiple locations instead of storing it all in one place is more efficient for large datasets.

Do not adopt this approach: Additionally, since the data is distributed randomly, every query may need to be executed across all boats, resulting in unnecessary processing time.

## Partitioning by Hour

Adopt this approach: Distributing the data based on time allows us to know which boat stores data for specific time intervals. As a result, we don't need to execute queries across every boat in the network.

Do not adopt this approach: This distribution method may cause more data to accumulate on Boat A because the system records more observations during nighttime and early morning hours. This could lead to an uneven data distribution and an excessive data load on Boat A.

## Partitioning by Hash Value

Adopt this approach: Since we know which hash value corresponds to a specific time being queried, there is no need to execute queries across every boat.

Do not adopt this approach: Since hash values are assigned to queries randomly, data may accumulate unevenly across certain boats, leading to an imbalance in data distribution.
