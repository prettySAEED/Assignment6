parameters=xlsread('house_prices_data_training_data.csv');
X=parameters(:,4:21);
%generate randomly (centers)
%check distance between x and these centers
%keep changing centers till we reach min distance
%min error --> number of clusters
%number of clusters vs error--> graph
%el k el andaha 22l error heya number of clusters eli ayzenha
% ----------------------------------------------------------------------
% iteratively partitions the data into k clusters based on a distance function. 

%K-means algorithm groups the data into k cohesive clusters. Each cluster has a cluster center, called centroid. The cluster centroid is used to represent the cluster and it is the mean of all the data points that belongs to the cluster.
%iterative procedure that starts by randomly assigning k data points as initial centroids. 
%hen, the distance is computed between each centroid and every data point.
%Each data point is assigned to the cluster (centroid) with the lowest distance.
%After the assignment of every data points to the clusters, the centroids are re-computed using the data points of the newly created clusters. These steps of cluster assignment and centroid re-computation are repeated until the convergence criteria is met.

%We need to implement three methods to perform following tasks:

%Randomly initializing K centroids
%Assigning data points to K clusters
%Re-computing K centroids
K = 3;
max_iterations = 10;
centroids = initCentroids(X, K);

for i=1:max_iterations
  indices = getClosestCentroids(X, centroids);
  centroids = computeCentroids(X, indices, K);
end
