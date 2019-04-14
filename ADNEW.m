
clc
clear
close all
parameters=xlsread('house_prices_data_training_data.csv');
X=parameters(:,4:21);
m=length(parameters);
fprintf('%i\n', X)
fprintf('%i\n', m)

%calculate the data average value 
%calculate the data standard deviation 
%assume that the system pdf is multiplication of the features pdf 

mean=mean(X);
fprintf('%i\n', mean)

STD=std(X)
fprintf('%i\n', STD)

prod=1;

for i=1:18
 cdf=normcdf(X(5,i),mean(i),STD(i));
 prod=prod*cdf;
end
fprintf('%i\n', prod)


epsilon=0.00001;
%anomaly_deteced=0;
%anomaly_indices=[];
for i=1:m
    if(prod>epsilon || prod<1-epsilon)
      fprintf('anomaly_detected');

    end

end
%for i=1:m
 %   for j=1:length(x(1,:))
 %       if(qfunc(x(i,j))<epsilon || qfunc(x(i,j))>1-epsilon)
  %          anomaly_deteced=anomaly_deteced+1;
   %         anomaly_indices=[anomaly_indices;i,j];
    %        fprintf('anomaly_detected');
     %   end
   % end
%end