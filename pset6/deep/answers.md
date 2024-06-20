# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

I'd adopt this because it evenly distribute data among the three servers. One down side is the nearby time will likely be spreaded among all three. This led to querying have to take a look into all the three servers.

## Partitioning by Hour

It keeps nearby times close to each other in the same server which is easy to look up. But the trade off is there will be hot spots and cool spots in the servers. The data distribution is not good.

## Partitioning by Hash Value

I think this is the best solution since it evenly distribute datas and also easier to query. Hashing allow us to know which server particular data are in.
