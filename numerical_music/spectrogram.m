function [S, f, t] = spectrogram(signal, fs, window_size)
    n_windows = floor(length(signal)/window_size);
    f = zeros(window_size, 1);
    t = zeros(n_windows, 1);
    S = zeros(window_size, n_windows);

    H = hanning(window_size);
    for i  = 1:n_windows
        ws = signal(((i-1) * window_size + 1): (i * window_size)) .* H;
        window = fft(ws, 2 * window_size);
        window = window(1:window_size);
        S(:,i) = abs(window);
    endfor
    f = (0:(window_size - 1))' * ((fs / window_size)/2);
    t = (0:(n_windows-1))' * (window_size/fs);
end
