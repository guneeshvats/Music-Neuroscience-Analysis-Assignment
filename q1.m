audio = miraudio('fmri_music_stimulus.mp3');

% Frames decomposition
rms = mirrms('fmri_music_stimulus.mp3', 'Frame', 0.025, 's', 0.0125, 's');
pulse_clarity = mirpulseclarity('fmri_music_stimulus.mp3', 'Frame', 3, 0.333);

hrf = fmri_doublegamma(0:1:25);
conv_pulse = conv(mirgetdata(pulse_clarity), hrf);
conv_trunc = conv_pulse(1:length(mirgetdata(pulse_clarity)));
detrend = fmri_detrend2(conv_trunc);
downsample_pulse = downsample(detrend, 2);

plot(mirgetdata(pulse_clarity));
hold on;
plot(conv_pulse);
hold on;
plot(detrend);
xlabel('Time');
ylabel('Music');
title('Processing Acoustic Features (Guneesh Vats)')
hold on;
legend({'Unconvolved Pulse', 'Convolved Pulse', 'Detrended Pulse'});

%% Downsample them to match the sampling rate of the fMRI data (TR = 2 sec)
down_factor = 2;
down_pulse_clarity = downsample(pulse_clarity, down_factor);
down_conv_pulse = downsample(conv_pulse, down_factor);
down_detrend_pulse = downsample(detrend, down_factor);
figure, 
plot(mirgetdata(down_pulse_clarity));
hold on; 
plot(down_conv_pulse);
plot(down_detrend_pulse);
xlabel('Time');
ylabel('Music');
title('Processing Acoustic Features - Downsampled (Guneesh Vats)')
hold on;
legend({'Unconvolved Pulse', 'Convolved Pulse', 'Detrended Pulse'});

%% repeating for rms
hrf = fmri_doublegamma(0:1:25);
conv_pulse = conv(mirgetdata(rms), hrf);
conv_trunc = conv_pulse(1:length(mirgetdata(rms)));
detrend = fmri_detrend2(conv_trunc);
downsample_pulse = downsample(detrend, 2);

plot(mirgetdata(rms));
hold on;
plot(conv_pulse);
hold on;
plot(detrend);
xlabel('Time');
ylabel('Music');
title('Processing Acoustic Features(RMS) (Guneesh Vats)')
hold on;
legend({'Unconvolved', 'Convolved', 'Detrended'});

%% Downsample them to match the sampling rate of the fMRI data (TR = 2 sec)
down_factor = 2;
down_pulse_clarity = downsample(rms, down_factor);
down_conv_pulse = downsample(conv_pulse, down_factor);
down_detrend_pulse = downsample(detrend, down_factor);
figure, 
plot(mirgetdata(down_pulse_clarity));
hold on; 
plot(down_conv_pulse);
plot(down_detrend_pulse);
xlabel('Time');
ylabel('Music');
title('Processing Acoustic Features(RMS) - Downsampled (Guneesh Vats)')
hold on;
legend({'Unconvolved', 'Convolved', 'Detrended'});