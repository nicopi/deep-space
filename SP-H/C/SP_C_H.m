% LDPC for DEEP-SPACE communications
% Copyright(C) 2014 Nicola Piovesan
%
% (8176,7154) LDPC Code
% MATLAB+C, Hard decoding, sum-product
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

disp('Compiling mex...')
mex -O CFLAGS="\$CFLAGS -std=c99" decoder.c
disp('Mex compiled.')
clear all

load ../../data
disp('Data loaded.')
%graph and information
for i=1:size(H,1)
    bitToCheck(i,:)=find(H(i,:)==1);
end
for i=1:size(H,2)
    checkToBit(i,:)=find(H(:,i)==1);
end
dp=length(bitToCheck(1,:));
dl=length(checkToBit(1,:));
ncheck=size(H,1);
nbit=size(H,2);

nblocks=1000; % Number of blocks to TX
maxIT=10; % Maximum number of iterations
SNRsteps=[3:0.1:5 5.01:0.01:7.5]; %SNR values to test
ERR=zeros(1,length(SNRsteps));

%Change matrices to C format
H=double(H)';
checkToBit=double(checkToBit)';
bitToCheck=double(bitToCheck)';

for st=1: nblocks
    disp(['Transmitting BLOCK #' num2str(st)]);
    u=randi([0 1],1,7154); %string to TX
    co=mod(u*double(G),2); %codeword
    noise=randn(1,8176); %noise vector
    co2=(2*co)-1;
    
    for S=1:length(SNRsteps)
        SNR=SNRsteps(S);
        fprintf([' SNR= ' num2str(SNR) ' ']);
        sig=sqrt(4/7*1/(10^(SNR/10)));
        y=co2+sig*noise;
        y=sign(y); %Hard decoding
        
        out=decoder(y,double(H),sig,double(bitToCheck),double(checkToBit),maxIT); %call MEX function
        
        %Compute errors sum
        ERR(S)=ERR(S)+sum(abs(out-u));
    end
end
%Save data and print plot
Pbit=ERR./(7154*st);
save('out.mat','Pbit','SNRsteps','maxIT');
semilogy(SNRsteps,Pbit);
hold on;
semilogy([SNRsteps],qfunc(sqrt(2*10.^([SNRsteps]/10))));
legend('coded','uncoded');
xlabel('E_b/N_0')
ylabel('P_{bit}')
title('(8176,7154) Code')
