function [f X] = daveFFT (t_input, x_input, scale_freq)

tstep = t_input(2)-t_input(1);
min_t = min(t_input);
max_t = max(t_input);

t = min_t:tstep/scale_freq:max_t;
N = length(t);
dt = tstep/scale_freq;
df = 1/(N*dt);
%t = (0:N-1)*dt;
f = df * (0:N-1);

x = interp1(t_input,x_input,t);
X = fft (x)/N;      %Not entirely sure why we need to divide by N, but the amplitudes seem correct when we run this on a standard exponential function

end