% LDPC for DEEP-SPACE communications
% Copyright(C) 2014 Nicola Piovesan
% 
% Print pre-computed results
%
%  This program is free software: you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published by
%  the Free Software Foundation, either version 3 of the License, or
%  (at your option) any later version.
%  
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
%  
%  You should have received a copy of the GNU General Public License
%  along with this program.  If not, see <http://www.gnu.org/licenses/>.

%% sum-product
load ./data/SP_5.mat
semilogy(SNRsteps,Pbit);
hold on;
load ./data/SP_10.mat
semilogy(SNRsteps,Pbit);
load ./data/SP_20.mat
semilogy(SNRsteps,Pbit);
load ./data/SP_30.mat
semilogy(SNRsteps,Pbit);
semilogy([3:0.5:4.6],qfunc(sqrt(2*10.^([3:0.5:4.6]/10))),'--');
legend('SP - 5 iterations','SP - 10 iterations','SP - 20 iterations','SP - 30 iterations','Uncoded','Location','southwest');
xlabel('E_b/N_0')
ylabel('P_{bit}')
title('(8176,7154) Code')
grid on;
ylim([0.000009 0.1])
legend('boxoff')
set(gca,'xtick',[3:0.2:4.5])

%% min-sum
figure
load ./data/MS_10.mat
semilogy(SNRsteps,Pbit);
hold on;
load ./data/MS_20.mat
ylim([0.000009 0.1])
semilogy(SNRsteps,Pbit);
load ./data/MS_30.mat
semilogy(SNRsteps,Pbit);
semilogy([3:0.5:4.6],qfunc(sqrt(2*10.^([3:0.5:4.6]/10))),'--');
legend('MS - 10 iterations','MS - 20 iterations','MS - 30 iterations','Uncoded','Location','southwest');
grid on;
legend('boxoff')
xlabel('E_b/N_0')
ylabel('P_{bit}')
title('(8176,7154) Code')
set(gca,'xtick',[3:0.2:4.5])

%% sum-product vs min-sum
%To do: add gain
figure
load ./data/SP_10.mat
semilogy(SNRsteps,Pbit);
hold on;
load ./data/SP_20.mat
semilogy(SNRsteps,Pbit);
load ./data/SP_30.mat
semilogy(SNRsteps,Pbit);
load ./data/MS_10.mat
semilogy(SNRsteps,Pbit);
hold on;
load ./data/MS_20.mat
ylim([0.000009 0.1])
semilogy(SNRsteps,Pbit);
semilogy([3:0.5:4.6],qfunc(sqrt(2*10.^([3:0.5:4.6]/10))),'--');
legend('SP - 10 iterations','SP - 20 iterations','SP - 30 iterations','MS  - 10 iterations','MS - 20 iterations','Uncoded','Location','southwest');
grid on
xlabel('E_b/N_0')
ylabel('P_{bit}')
title('(8176,7154) Code')
legend('boxoff')
set(gca,'xtick',[3:0.2:4.5])

%% sum-product vs min-sum vs hard
%To do: add gain
figure
load ./data/SP_20.mat
semilogy(SNRsteps,Pbit);
hold on;
load ./data/MS_20.mat
semilogy(SNRsteps,Pbit);
load('./data/SP_H_20.mat')
semilogy(SNRsteps,Pbit);
semilogy([3:0.1:6],qfunc(sqrt(2*10.^([3:0.1:6]/10))),'--');
ylim([0.000009 0.05])
legend('SP - 20 iterations','MS - 20 iterations','SP-H - 20 iterations','Uncoded','Location','northeast');
grid on
xlabel('E_b/N_0')
ylabel('P_{bit}')
title('(8176,7154) Code')
legend('boxoff')
set(gca,'xtick',[3:0.3:6])

%%
ro=1:0.1:5;
EbNo=(2.^ro-1)./ro;
plot(EbNo,ro);
hold on
plot(3.83,2*7/8,'*');
ylabel('\rho [bit/s/Hz]')
xlabel('E_b/N_0 [dB]')
legend('Shannon bound','(8176,7154) code)');

%%
EbNo=1:0.1:10;
p=2*7/8;
C=0.5*log2(1+p*EbNo);
plot(10*log10(EbNo),C)
y=ones(1,91)*7/8;
hold on
plot(10*log10(EbNo),y);
ylabel('C');
xlabel('E_b/N_0')