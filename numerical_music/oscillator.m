function x = oscillator(freq, fs, dur, A, D, S, R)
  total_samples = dur * fs;
  t = (0:1/fs:dur - 1/fs)';
  sine_wave = sin(2 * pi * freq * t);
  a = floor(A * fs);
  d = floor(D * fs);
  r = floor(R * fs);
  s = length(t) - a -d -r;
  ae = linspace(0,1,a)';
  de = linspace(1,S,d)';
  se = S * ones(s,1);
  re = linspace(S,0,r)';
  env = [ae;de;se;re];
  x = sine_wave .* env;
endfunction

