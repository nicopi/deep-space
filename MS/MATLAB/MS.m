% LDPC for DEEP-SPACE communications
% Copyright(C) 2014 Nicola Piovesan
%
% (8176,7154) LDPC Code
% MATLAB, Soft decoding, min-sum
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
SNRsteps=[3 3.25 3.5:0.05:4 4.1]; %SNR values to test
ERR=zeros(1,length(SNRsteps));

for st=1: nblocks
    disp(['Transmitting BLOCK #' num2str(st)]);
    u=randi([0 1],1,7154); %string to TX
    co=mod(u*double(G),2); %codeword
    noise=randn(1,8176); %noise vector
    co2=(2*co)-1;
    
    for S=1:length(SNRsteps)
        SNR=SNRsteps(S);
        fprintf([' SNR= ' num2str(SNR)]);
        sig=sqrt(4/7*1/(10^(SNR/10)));
        y=co2+sig*noise;

        r=-2*y./(sig^2);  %initialization
        
        %initialize messages from bits
        M=ones(ncheck,1)*r;
        exit=false;
        I=0;
        while(I<maxIT && ~exit)
            for c=1:ncheck %checknodes
                for i=1:dp %check nodes inputs
                    num=1;
                    counter=1;
                    for j=1:dp
                        if i~=j
                            num=num*sign((M(c,bitToCheck(c,j))));
                            temp(counter)=M(c,bitToCheck(c,j));
                            counter=counter+1;
                        end
                    end
                    E(c,bitToCheck(c,i))=num*min(abs(temp)); %E(c,b) storer message from check-node c to bit-node b
                end
            end
            
            L=sum(E)+r; %Compute total LLRs
            z=-(sign(L)-1)/2; %Decoded word
            
            test=mod(double(H)*z',2); %Check decoded codeword
            if(sum(test)==0) %If OK, exit
                exit=true;
            end
            
            M=zeros(size(M)); %Reset messages
            for b=1:nbit %bits
                for i=1:dl %checknodes for every bit
                    num=0;
                    for j=1:dl
                        if i~=j
                            num=num+(E(checkToBit(b,j),b));
                        end
                    end
                    M(checkToBit(b,i),b)=num+r(b); %M(c,b) stores message from bit-node b to check-node c
                end
            end
            I=I+1;
            
            %Print informations
            if(sum(abs(test))==0)
                fprintf(['[' num2str(I) ']\n']);
            end
        end
        if I==maxIT
            disp(['[' num2str(maxIT) ']']);
        end
        %Compute errors sum
        ERR(S)=ERR(S)+sum(abs(z(1:7154)-u));
    end
end
Pbit=ERR./(7154*st);
save('out.mat','Pbit','SNRsteps')
a=semilogy(SNRsteps,Pbit);
hold on;
semilogy([SNRsteps],qfunc(sqrt(2*10.^([SNRsteps]/10))));
legend('coded','uncoded');
xlabel('E_b/N_0')
ylabel('P_{bit}')
title('(8176,7154) Code')
