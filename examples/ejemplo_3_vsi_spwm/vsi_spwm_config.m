clear all
close all

%% General
cfg.fpga.ts = 1/12e6;
cfg.ts = 1e-6;
cfg.fl = 50;
cfg.mf = 21;

%% References
cfg.ref.n = 12;
cfg.ref.out_n = 12;
cfg.ref.out_n_bp = 0;
cfg.ref.max = 2000; % Maximun 2^(cfg.ref.n-1)-1;
cfg.ref.data = cfg.ref.max*sin(2*pi*((0:2^(cfg.ref.n-1)-1)/2^cfg.ref.n));
cfg.ref.factor = 2^cfg.ref.n/(1/cfg.fl/cfg.ts);

%% Triangular
cfg.tri.len   = fix(1/cfg.ts/cfg.fl/cfg.mf);
cfg.tri.n     = ceil(log2(cfg.tri.len));
aux           = [0:fix(cfg.tri.len/4) fix(cfg.tri.len/4)-1:-1:1];
aux           = [aux -aux];
cfg.tri.out_n = 12;
cfg.tri.data  = fix(aux*(2^(cfg.tri.out_n-1)-1)/cfg.tri.len*4);
clear aux

%% Switches values
cfg.switch.Ron        = 1e-3;
cfg.switch.snubber_Rs = 1e7;
cfg.switch.snubber_Cs = inf;
%% Diode values
cfg.diode.Ron         = 1e-3;
cfg.diode.snubber_Rs  = inf;
cfg.diode.snubber_Cs  = inf;

%% Electrical values
cfg.r    = 16;
cfg.l    = 10e-3;
cfg.vdc  = 100;
