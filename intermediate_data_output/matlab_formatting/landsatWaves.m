% README: getting the data on quarterly wave heights in Landsat pixels
% The swell height data were collected by the Coastal Data Information Program 
% (CDIP;  http://cdip.ucsd.edu/MOP_v1.1/) and formatted to give the quarterly 
% maximum wave height in each Landsat pixel in the southern California Bight 
% by Bell et al. in prep.

% use ncinfo to display the file information
% NOTE: the data need to be in the same file as this .m script in order for
% the code below to run
info = ncinfo('CAkelpCanopyEnv_2021.nc');

%% look at variable names
% see https://www.mathworks.com/help/matlab/ref/ncinfo.html for information
% on what ncinfo() returns
% info has class struct; to look at each component use '.'
% eg, to look at the variables, use info.Variables, which is also a struct,
% so to look at the variable names use info.Variables.Name
info.Variables.Name
% variable names: 'lat', 'lon', 'utm_x', 'utm_y', 'utm_zone', 'year',
% 'quarter', 'depth', 'area', 'biomass', 'temperature', 'nitrate',
% 'hsmax','parbttm_mean', 'parbttm_max'

%info.Attributes

%% look at variable descriptions
ncdisp('/Users/dandetmer/Desktop/resource model/landsat data/CAkelpCanopyEnv_2021.nc')
%% open individual variables
% then use ncread to open the variables of interest
lat = ncread('/Users/dandetmer/Desktop/resource model/landsat data/CAkelpCanopyEnv_2021.nc','lat');
lon = ncread('/Users/dandetmer/Desktop/resource model/landsat data/CAkelpCanopyEnv_2021.nc','lon');
utmx = ncread('/Users/dandetmer/Desktop/resource model/landsat data/CAkelpCanopyEnv_2021.nc','utm_x');
utmy = ncread('/Users/dandetmer/Desktop/resource model/landsat data/CAkelpCanopyEnv_2021.nc','utm_y');
yr = ncread('/Users/dandetmer/Desktop/resource model/landsat data/CAkelpCanopyEnv_2021.nc','year');
qtr = ncread('/Users/dandetmer/Desktop/resource model/landsat data/CAkelpCanopyEnv_2021.nc','quarter');
W = ncread('/Users/dandetmer/Desktop/resource model/landsat data/CAkelpCanopyEnv_2021.nc','hsmax');

% Each kelp and environmental variable is arranged in an array (332640 x 152). 
% The rows represent each 30 m Landsat pixel, either the kelp canopy biomass 
% or area or the environmental variable associated with each pixel. 
% The columns are 3-month quarters from 1984 to 2021. 
% You can get the year and quarter number (1 through 4) by opening the year and quarter variables.
%There is a lat variable that lists the latitude of each row, and the lon 
% variable represents the longitude of each variable (these are each 332640 x 1)

%% check utm zone
utmzn = ncread('/Users/dandetmer/Desktop/resource model/landsat data/CAkelpCanopyEnv_2021.nc','utm_zone');

%% filter
%lat(1) %42.8
%lat(573515) %27
% don't want the biomass in all the pixels along the west coast
% filter out just the pixels between 33 and 35 degrees latitude

% get the elements of lat that are between 33 and 35 degrees north
range = find(lat < 35 & lat >33);


% now subset out the lat, lon, utmx, utmy, and wave height variables to just include these
% rows

lat2 = lat(range);
lon2 = lon(range);
utmx2 = utmx(range);
utmy2 = utmy(range);
W2 = W(range, :);% want to keep all 152 columns (but note could probably 
% subset out years too - something like find(year > 2005) and then just
% keep these columns from the year, quarter, and biomass arrays

%% subset waves
% split the swell height data into two datasets (to make the file size
% smaller)
%size(W2) % dimensions are 172373, 152
Wfirsthalf = W2(1:86186, :);
Wsecondhalf = W2(86187:172373, :);

%% write to csv
% export these as csvs to work with in R
writematrix(lat2, '/Users/dandetmer/Desktop/resource model/00_github/intermediate_data_output/raw_waves/lat.csv')
writematrix(lon2, '/Users/dandetmer/Desktop/resource model/00_github/intermediate_data_output/raw_waves/lon.csv')
writematrix(utmx2, '/Users/dandetmer/Desktop/resource model/00_github/intermediate_data_output/raw_waves/utmx.csv')
writematrix(utmy2, '/Users/dandetmer/Desktop/resource model/00_github/intermediate_data_output/raw_waves/utmy.csv')
writematrix(yr, '/Users/dandetmer/Desktop/resource model/00_github/intermediate_data_output/raw_waves/year.csv')
writematrix(qtr, '/Users/dandetmer/Desktop/resource model/00_github/intermediate_data_output/raw_waves/qtr.csv')
%writematrix(W2, '/Users/dandetmer/Desktop/resource model/00_github/intermediate_data_output/raw_waves/waves.csv')
writematrix(Wfirsthalf, '/Users/dandetmer/Desktop/resource model/00_github/intermediate_data_output/raw_waves/waves1.csv')
writematrix(Wsecondhalf, '/Users/dandetmer/Desktop/resource model/00_github/intermediate_data_output/raw_waves/waves2.csv')



