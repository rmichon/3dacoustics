name = '1center';

scaleFreq = 6;
nbins = 2048;   % stft analysis half bandwidth, bins
nskip = 32;     % stft hop size, samples

impulseName = strcat(strcat('../IR/',name),'_imp.wav');
respName = strcat(strcat('../IR/',name),'_resp.wav');

[impulse, fs] = audioread(impulseName);
[response, fs] = audioread(respName);
L = length(response);

%% Spectrogram

figure(1);
responseSTFT = ftgram(sum(response,2), fs, 'music', 'nbins', nbins, 'nskip', nskip);
title('Response Spectrogram');

%% Computing Spectrum

impulseFFT = fft(impulse);
impulseP2 = abs(impulseFFT/L);
impulseSpectrum = impulseP2(1:L/(2*scaleFreq)+1);
impulseSpectrum(2:end-1) = 2*impulseSpectrum(2:end-1);
impulseSpectrum = impulseSpectrum/max(impulseSpectrum);

reponseFFT = fft(response);
responseP2 = abs(reponseFFT/L);
responseSpectrum = responseP2(1:L/(2*scaleFreq)+1);
responseSpectrum(2:end-1) = 2*responseSpectrum(2:end-1);
responseSpectrum = responseSpectrum/max(responseSpectrum);

% deconvolution
irSpectrum = responseSpectrum./impulseSpectrum;

%% Plotting

%P1dB = 20*log10(responseSpectrum/max(responseSpectrum));

%% Find mode frequencies and amplitudes

[gammam, fm] = localmax(responseSpectrum); % should change to irSpectrum
nmodes = length(fm);

sorted_gammam = sort(gammam,'descend');
maxIndex = find(ismember(gammam,sorted_gammam(1:nmodes)));

figure(2)
f = fs*(0:(L/(2*scaleFreq)))/L;
plot(f,responseSpectrum,'-',fm,gammam,'o') 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

