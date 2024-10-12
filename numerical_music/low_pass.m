function signal = low_pass(signal, fs, cutoff_freq)
  X = fft(signal);
  N = length(signal);
  f = (0:N-1) * (fs/N);
  filter = (f <= cutoff_freq);
  X_filter = X .* filter';
  filtered = ifft(X_filter);
  maxi = max(abs(filtered));
  signal = filtered / maxi;
endfunction

