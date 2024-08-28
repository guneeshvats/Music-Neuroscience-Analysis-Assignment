%% For Musical
subject_mus = [load('./MUSICIANS/mus20.mat'), load('./MUSICIANS/mus16.mat'), load('./MUSICIANS/mus17.mat'), load('./MUSICIANS/mus18.mat'), load('./MUSICIANS/mus19.mat')];
data = subject_mus;

% N = length(data);
values = {data.fmri};
isc = zeros(size(values{1}, 1), 1);

count = 0;
for i = 1:numel(data)
   for j = (i + 1):numel(data)
       count = count + 1;
       isc = isc + fmri_corrvoldata(values{i}, values{j});
   end
end

mean_isc = isc / count;
threshold = 0.3;
mean_isc_thresholded = mean_isc;
mean_isc_thresholded(mean_isc_thresholded <= threshold) = 0;


fmri_show3d(mean_isc_thresholded);
%% For Non-Musical
subject_nonmus = [load('./NONMUSICIANS/mus13.mat'), load('./NONMUSICIANS/mus16.mat'), load('./NONMUSICIANS/mus17.mat'), load('./NONMUSICIANS/mus14.mat'), load('./NONMUSICIANS/mus15.mat')];
data = subject_nonmus;

% N = length(data);
values = {data.fmri};
isc = zeros(size(values{1}, 1), 1);

count = 0;
for i = 1:numel(data)
   for j = (i + 1):numel(data)
       count = count + 1;
       isc = isc + fmri_corrvoldata(values{i}, values{j});
   end
end

mean_isc = isc / count;
threshold = 0.3;
mean_isc_thresholded = mean_isc;
mean_isc_thresholded(mean_isc_thresholded <= threshold) = 0;


fmri_show3d(mean_isc_thresholded);