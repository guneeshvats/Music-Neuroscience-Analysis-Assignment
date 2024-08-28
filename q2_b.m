load('musicalfeatures.mat');

% Concatenate the features for all stimuli
feat = load('./musicalfeatures.mat');

features = feat.feat{1, 1};
labels = feat.featlbl;

brightness = features(:,2);
pulse_clarity = features(:,5);
%% For Musical
subject_mus = [load('./MUSICIANS/mus20.mat'), load('./MUSICIANS/mus16.mat'), load('./MUSICIANS/mus17.mat'), load('./MUSICIANS/mus18.mat'), load('./MUSICIANS/mus19.mat')];
data = subject_mus;
values = {data.fmri};

%% Brightness
for i = 1:5
    c = fmri_corregressor(brightness, values{i});
    figure(i)
    fmri_show3d((c > 0.25)|(c<-0.25));
end

%% Pulse Clarity
for i = 1:5
    c = fmri_corregressor(pulse_clarity, values{i});
    figure(i)
    fmri_show3d((c > 0.25)|(c<-0.25));
end
