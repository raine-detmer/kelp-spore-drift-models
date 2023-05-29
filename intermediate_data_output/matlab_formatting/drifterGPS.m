% README: extract the deployment dates for the drifter GPS data published
% by Ohlmann et al. (2018)

% data are in the file "kelp_drifter_data.mat" downloaded from 
% https://www.bco-dmo.org/dataset-deployment/739117

% note: the data need to be in the same file as this .m script in order for
% the code below to run

%% load data
load('kelp_drifter_data.mat')

%% check the readme
% this is a struct object with descriptions for all the variables
% struct objects contain fields (here, each there is a field for each
% variable). To look at a field do [name of struct].[name of field]

readme.day % cell variable for each day that contains a structure for 
% each drifter track collected on that day
readme.drift %structure in a day cell corresponding to a single drifter track

%% look at the data
day{1,24} % day goes from {1,1} to {1,24}. 

% each day{1, x} is a struct with one field (drift) which contains all the
% data on the gps id, location, time, velocity, and water depth for each
% gps that was deployed that day

%day{1,1}.drift
%day{1,1}.drift.id

% day{1,1}.drift(1).id % first drifter id on deployment day 1

% max(day{1,1}.drift(1).matime); % max matime of the first drifter id that started on day 1

%% extract min and max times for each drifter's track

%size(day{1,1}.drift,2)% use ,2 to get 2nd value = number of drifters deployed on day 1
%size(day{1,2}.drift,2)% number of drifters deployed on day 2

% day{1,1}.drift(1).id % id of first drifter deployed on day 1

%min(day{1,1}.drift(1).matime) % min time for first drifter deployed on day 1
%max(day{1,1}.drift(1).matime) % max time for first drifter deployed on day 1

% want matrix where first row = deployment day, second row = drifter id,
% 3rd = min time, and 4th = max time

% get a vector with the number of drifters deployed on each day
depday = 1:24;
for i = 1:24
    depday(i) = size(day{1,i}.drift,2);
end

% now need a vector 1:24 where each element of the vector is repeated
% the number of times given by the corresponding element of depday

depdayfull = repelem(1:24, depday);

% also need a vector that goes 1:n for each deployment day, where n is the
% number of drifters on that day

idvec = [1:5];

for k = 2:length(depday)

    newvec = 1:depday(k);
    
    idvec = [idvec,newvec];

end



% can now do a for loop: for each element of depdayfull, record the deployment day,
% drifter id min matime, and the max matime

% holding matrix: first column = deployment day, 2nd = drifter id, 3rd = min
% matime, 4th = max matime

% make holding matrix of zeros
holdmat = zeros(sum(depday),4);


for j = 1:length(depdayfull) % for each deployment day
        holdmat(j,1)=depdayfull(j);
        holdmat(j,2)= day{1,depdayfull(j)}.drift(idvec(j)).id; % id of jth drifter deployed on day i
        holdmat(j,3)=min(day{1,depdayfull(j)}.drift(idvec(j)).matime); % min time for jth drifter deployed on day i
        holdmat(j,4)=max(day{1,depdayfull(j)}.drift(idvec(j)).matime); % max time for jth drifter deployed on day i
end

%% export results

% export the results
writematrix(holdmat,'deploytimes.csv') 


