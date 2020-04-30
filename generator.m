% LDPC for DEEP-SPACE communications
% Copyright(C) 2014 Nicola Piovesan
%
% Parity check matrix and generator matrix generator.
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

%define circulats according with the CCSDS standard
A11=zeros(511,511);
A11(1,1)=1;
A11(1,177)=1;
for i=2:size(A11,1)
    A11(i,:)=circshift(A11(i-1,:)',1)';
end

A12=zeros(511,511);
A12(1,13)=1;
A12(1,240)=1;
for i=2:size(A12,1)
    A12(i,:)=circshift(A12(i-1,:)',1)';
end

A13=zeros(511,511);
A13(1,1)=1;
A13(1,353)=1;
for i=2:size(A13,1)
    A13(i,:)=circshift(A13(i-1,:)',1)';
end

A14=zeros(511,511);
A14(1,25)=1;
A14(1,432)=1;
for i=2:size(A14,1)
    A14(i,:)=circshift(A14(i-1,:)',1)';
end

A15=zeros(511,511);
A15(1,1)=1;
A15(1,393)=1;
for i=2:size(A15,1)
    A15(i,:)=circshift(A15(i-1,:)',1)';
end

A16=zeros(511,511);
A16(1,152)=1;
A16(1,410)=1;
for i=2:size(A16,1)
    A16(i,:)=circshift(A16(i-1,:)',1)';
end

A17=zeros(511,511);
A17(1,1)=1;
A17(1,352)=1;
for i=2:size(A17,1)
    A17(i,:)=circshift(A17(i-1,:)',1)';
end

A18=zeros(511,511);
A18(1,10)=1;
A18(1,360)=1;
for i=2:size(A18,1)
    A18(i,:)=circshift(A18(i-1,:)',1)';
end

A19=zeros(511,511);
A19(1,1)=1;
A19(1,308)=1;
for i=2:size(A19,1)
    A19(i,:)=circshift(A19(i-1,:)',1)';
end

A110=zeros(511,511);
A110(1,54)=1;
A110(1,330)=1;
for i=2:size(A110,1)
    A110(i,:)=circshift(A110(i-1,:)',1)';
end

A111=zeros(511,511);
A111(1,1)=1;
A111(1,208)=1;
for i=2:size(A111,1)
    A111(i,:)=circshift(A111(i-1,:)',1)';
end

A112=zeros(511,511);
A112(1,19)=1;
A112(1,282)=1;
for i=2:size(A112,1)
    A112(i,:)=circshift(A112(i-1,:)',1)';
end

A113=zeros(511,511);
A113(1,1)=1;
A113(1,400)=1;
for i=2:size(A113,1)
    A113(i,:)=circshift(A113(i-1,:)',1)';
end

A114=zeros(511,511);
A114(1,203)=1;
A114(1,458)=1;
for i=2:size(A114,1)
    A114(i,:)=circshift(A114(i-1,:)',1)';
end

A115=zeros(511,511);
A115(1,1)=1;
A115(1,248)=1;
for i=2:size(A115,1)
    A115(i,:)=circshift(A115(i-1,:)',1)';
end

A116=zeros(511,511);
A116(1,37)=1;
A116(1,262)=1;
for i=2:size(A116,1)
    A116(i,:)=circshift(A116(i-1,:)',1)';
end

A21=zeros(511,511);
A21(1,100)=1;
A21(1,472)=1;
for i=2:size(A21,1)
    A21(i,:)=circshift(A21(i-1,:)',1)';
end

A22=zeros(511,511);
A22(1,131)=1;
A22(1,474)=1;
for i=2:size(A22,1)
    A22(i,:)=circshift(A22(i-1,:)',1)';
end

A23=zeros(511,511);
A23(1,199)=1;
A23(1,436)=1;
for i=2:size(A23,1)
    A23(i,:)=circshift(A23(i-1,:)',1)';
end

A24=zeros(511,511);
A24(1,261)=1;
A24(1,479)=1;
for i=2:size(A24,1)
    A24(i,:)=circshift(A24(i-1,:)',1)';
end

A25=zeros(511,511);
A25(1,216)=1;
A25(1,421)=1;
for i=2:size(A25,1)
    A25(i,:)=circshift(A25(i-1,:)',1)';
end

A26=zeros(511,511);
A26(1,283)=1;
A26(1,482)=1;
for i=2:size(A26,1)
    A26(i,:)=circshift(A26(i-1,:)',1)';
end

A27=zeros(511,511);
A27(1,49)=1;
A27(1,397)=1;
for i=2:size(A27,1)
    A27(i,:)=circshift(A27(i-1,:)',1)';
end

A28=zeros(511,511);
A28(1,194)=1;
A28(1,446)=1;
for i=2:size(A28,1)
    A28(i,:)=circshift(A28(i-1,:)',1)';
end

A29=zeros(511,511);
A29(1,274)=1;
A29(1,431)=1;
for i=2:size(A29,1)
    A29(i,:)=circshift(A29(i-1,:)',1)';
end

A210=zeros(511,511);
A210(1,303)=1;
A210(1,452)=1;
for i=2:size(A210,1)
    A210(i,:)=circshift(A210(i-1,:)',1)';
end

A211=zeros(511,511);
A211(1,97)=1;
A211(1,380)=1;
for i=2:size(A211,1)
    A211(i,:)=circshift(A211(i-1,:)',1)';
end

A212=zeros(511,511);
A212(1,192)=1;
A212(1,387)=1;
for i=2:size(A212,1)
    A212(i,:)=circshift(A212(i-1,:)',1)';
end

A213=zeros(511,511);
A213(1,245)=1;
A213(1,468)=1;
for i=2:size(A213,1)
    A213(i,:)=circshift(A213(i-1,:)',1)';
end

A214=zeros(511,511);
A214(1,365)=1;
A214(1,471)=1;
for i=2:size(A214,1)
    A214(i,:)=circshift(A214(i-1,:)',1)';
end

A215=zeros(511,511);
A215(1,52)=1;
A215(1,383)=1;
for i=2:size(A215,1)
    A215(i,:)=circshift(A215(i-1,:)',1)';
end

A216=zeros(511,511);
A216(1,193)=1;
A216(1,415)=1;
for i=2:size(A216,1)
    A216(i,:)=circshift(A216(i-1,:)',1)';
end

%create the (8176,7156) parity check matrix
Hd=[A11 A12 A13 A14 A15 A16 A17 A18 A19 A110 A111 A112 A113 A114 A115 A116; A21 A22 A23 A24 A25 A26 A27 A28 A29 A210 A211 A212 A213 A214 A215 A216];
H=uint8(Hd);

%free memory
clearvars -except H

%definining the generator matrix circulants (1st rows)
b11='55BF56CC55283DFEEFEA8C8CFF04E1EBD9067710988E25048D67525426939E2068D2DC6FCD2F822BEB6BD96C8A76F4932AAE9BC53AD20A2A9C86BB461E43759C';
b12='6855AE08698A50AA3051768793DC238544AF3FE987391021AAF6383A6503409C3CE971A80B3ECE12363EE809A01D91204F1811123EAB867D3E40E8C652585D28';
b21='62B21CF0AEE0649FA67B7D0EA6551C1CD194CA77501E0FCF8C85867B9CF679C18BCF7939E10F8550661848A4E0A9E9EDB7DAB9EDABA18C168C8E28AACDDEAB1E';
b22='64B71F486AD57125660C4512247B229F0017BA649C6C11148FB00B70808286F1A9790748D296A593FA4FD2C6D7AAF7750F0C71B31AEE5B400C7F5D73AAF00710';
b31='681A8E51420BD8294ECE13E491D618083FFBBA830DB5FAF330209877D801F92B5E07117C57E75F6F0D873B3E520F21EAFD78C1612C6228111A369D5790F5929A';
b32='04DF1DD77F1C20C1FB570D7DD7A1219EAECEA4B2877282651B0FFE713DF338A63263BC0E324A87E2DC1AD64C9F10AAA585ED6905946EE167A73CF04AD2AF9218';
b41='35951FEE6F20C902296C9488003345E6C5526C5519230454C556B8A04FC0DC642D682D94B4594B5197037DF15B5817B26F16D0A3302C09383412822F6D2B234E';
b42='7681CF7F278380E28F1262B22F40BF3405BFB92311A8A34D084C086464777431DBFDDD2E82A2E6742BAD6533B51B2BDEE0377E9F6E63DCA0B0F1DF97E73D5CD8';
b51='188157AE41830744BAE0ADA6295E08B79A44081E111F69BBE7831D07BEEBF76232E065F752D4F218D39B6C5BF20AE5B8FF172A7F1F680E6BF5AAC3C4343736C2';
b52='5D80A6007C175B5C0DD88A442440E2C29C6A136BBCE0D95A58A83B48CA0E7474E9476C92E33D164BFF943A61CE1031DFF441B0B175209B498394F4794644392E';
b61='60CD1F1C282A1612657E8C7C1420332CA245C0756F78744C807966C3E1326438878BD2CCC83388415A612705AB192B3512EEF0D95248F7B73E5B0F412BF76DB4';
b62='434B697B98C9F3E48502C8DBD891D0A0386996146DEBEF11D4B833033E05EDC28F808F25E8F314135E6675B7608B66F7FF3392308242930025DDC4BB65CD7B6E';
b71='766855125CFDC804DAF8DBE3660E8686420230ED4E049DF11D82E357C54FE256EA01F5681D95544C7A1E32B7C30A8E6CF5D0869E754FFDE6AEFA6D7BE8F1B148';
b72='222975D325A487FE560A6D146311578D9C5501D28BC0A1FB48C9BDA173E869133A3AA9506C42AE9F466E85611FC5F8F74E439638D66D2F00C682987A96D8887C';
b81='14B5F98E8D55FC8E9B4EE453C6963E052147A857AC1E08675D99A308E7269FAC5600D7B155DE8CB1BAC786F45B46B523073692DE745FDF10724DDA38FD093B1C';
b82='1B71AFFB8117BCF8B5D002A99FEEA49503C0359B056963FE5271140E626F6F8FCE9F29B37047F9CA89EBCE760405C6277F329065DF21AB3B779AB3E8C8955400';
b91='0008B4E899E5F7E692BDCE69CE3FAD997183CFAEB2785D0C3D9CAE510316D4BD65A2A06CBA7F4E4C4A80839ACA81012343648EEA8DBBA2464A68E115AB3F4034';
b92='5B7FE6808A10EA42FEF0ED9B41920F82023085C106FBBC1F56B567A14257021BC5FDA60CBA05B08FAD6DC3B0410295884C7CCDE0E56347D649DE6DDCEEB0C95E';
b101='5E9B2B33EF82D0E64AA2226D6A0ADCD179D5932EE1CF401B336449D0FF775754CA56650716E61A43F963D59865C7F017F53830514306649822CAA72C152F6EB2';
b102='2CD8140C8A37DE0D0261259F63AA2A420A8F81FECB661DBA5C62DF6C817B4A61D2BC1F068A50DFD0EA8FE1BD387601062E2276A4987A19A70B460C54F215E184';
b111='06F1FF249192F2EAF063488E267EEE994E7760995C4FA6FFA0E4241825A7F5B65C74FB16AC4C891BC008D33AD4FF97523EE5BD14126916E0502FF2F8E4A07FC2';
b112='65287840D00243278F41CE1156D1868F24E02F91D3A1886ACE906CE741662B40B4EFDFB90F76C1ADD884D920AFA8B3427EEB84A759FA02E00635743F50B942F0';
b121='4109DA2A24E41B1F375645229981D4B7E88C36A12DAB64E91C764CC43CCEC188EC8C5855C8FF488BB91003602BEF43DBEC4A621048906A2CDC5DBD4103431DB8';
b122='2185E3BC7076BA51AAD6B199C8C60BCD70E8245B874927136E6D8DD527DF0693DC10A1C8E51B5BE93FF7538FA138B335738F4315361ABF8C73BF40593AE22BE4';
b131='228845775A262505B47288E065B23B4A6D78AFBDDB2356B392C692EF56A35AB4AA27767DE72F058C6484457C95A8CCDD0EF225ABA56B7657B7F0E947DC17F972';
b132='2630C6F79878E50CF5ABD353A6ED80BEACC7169179EA57435E44411BC7D566136DFA983019F3443DE8E4C60940BC4E31DCEAD514D755AF95A622585D69572692';
b141='7273E8342918E097B1C1F5FEF32A150AEF5E11184782B5BD5A1D8071E94578B0AC722D7BF49E8C78D391294371FFBA7B88FABF8CC03A62B940CE60D669DFB7B6';
b142='087EA12042793307045B283D7305E93D8F74725034E77D25D3FF043ADC5F8B5B186DB70A968A816835EFB575952EAE7EA4E76DF0D5F097590E1A2A978025573E';

%creating the circulants
B11=zeros(511,511);
tmp=hex2bin(b11);
B11(1,:)=tmp(2:end);
for i=2:size(B11,1)
    B11(i,:)=circshift(B11(i-1,:)',1)';
end

clear tmp
B12=zeros(511,511);
tmp=hex2bin(b12);
B12(1,:)=tmp(2:end);
for i=2:size(B12,1)
    B12(i,:)=circshift(B12(i-1,:)',1)';
end

clear tmp
B21=zeros(511,511);
tmp=hex2bin(b21);
B21(1,:)=tmp(2:end);
for i=2:size(B21,1)
    B21(i,:)=circshift(B21(i-1,:)',1)';
end

clear tmp
B22=zeros(511,511);
tmp=hex2bin(b22);
B22(1,:)=tmp(2:end);
for i=2:size(B22,1)
    B22(i,:)=circshift(B22(i-1,:)',1)';
end

clear tmp
B31=zeros(511,511);
tmp=hex2bin(b31);
B31(1,:)=tmp(2:end);
for i=2:size(B31,1)
    B31(i,:)=circshift(B31(i-1,:)',1)';
end

clear tmp
B32=zeros(511,511);
tmp=hex2bin(b32);
B32(1,:)=tmp(2:end);
for i=2:size(B32,1)
    B32(i,:)=circshift(B32(i-1,:)',1)';
end

clear tmp
B41=zeros(511,511);
tmp=hex2bin(b41);
B41(1,:)=tmp(2:end);
for i=2:size(B41,1)
    B41(i,:)=circshift(B41(i-1,:)',1)';
end

clear tmp
B42=zeros(511,511);
tmp=hex2bin(b42);
B42(1,:)=tmp(2:end);
for i=2:size(B42,1)
    B42(i,:)=circshift(B42(i-1,:)',1)';
end

clear tmp
B51=zeros(511,511);
tmp=hex2bin(b51);
B51(1,:)=tmp(2:end);
for i=2:size(B51,1)
    B51(i,:)=circshift(B51(i-1,:)',1)';
end

clear tmp
B52=zeros(511,511);
tmp=hex2bin(b52);
B52(1,:)=tmp(2:end);
for i=2:size(B52,1)
    B52(i,:)=circshift(B52(i-1,:)',1)';
end

clear tmp
B61=zeros(511,511);
tmp=hex2bin(b61);
B61(1,:)=tmp(2:end);
for i=2:size(B61,1)
    B61(i,:)=circshift(B61(i-1,:)',1)';
end

clear tmp
B62=zeros(511,511);
tmp=hex2bin(b62);
B62(1,:)=tmp(2:end);
for i=2:size(B62,1)
    B62(i,:)=circshift(B62(i-1,:)',1)';
end

clear tmp
B71=zeros(511,511);
tmp=hex2bin(b71);
B71(1,:)=tmp(2:end);
for i=2:size(B71,1)
    B71(i,:)=circshift(B71(i-1,:)',1)';
end

clear tmp
B72=zeros(511,511);
tmp=hex2bin(b72);
B72(1,:)=tmp(2:end);
for i=2:size(B72,1)
    B72(i,:)=circshift(B72(i-1,:)',1)';
end

clear tmp
B81=zeros(511,511);
tmp=hex2bin(b81);
B81(1,:)=tmp(2:end);
for i=2:size(B81,1)
    B81(i,:)=circshift(B81(i-1,:)',1)';
end

clear tmp
B82=zeros(511,511);
tmp=hex2bin(b82);
B82(1,:)=tmp(2:end);
for i=2:size(B82,1)
    B82(i,:)=circshift(B82(i-1,:)',1)';
end

clear tmp
B91=zeros(511,511);
tmp=hex2bin(b91);
B91(1,:)=tmp(2:end);
for i=2:size(B91,1)
    B91(i,:)=circshift(B91(i-1,:)',1)';
end

clear tmp
B92=zeros(511,511);
tmp=hex2bin(b92);
B92(1,:)=tmp(2:end);
for i=2:size(B92,1)
    B92(i,:)=circshift(B92(i-1,:)',1)';
end

clear tmp
B101=zeros(511,511);
tmp=hex2bin(b101);
B101(1,:)=tmp(2:end);
for i=2:size(B101,1)
    B101(i,:)=circshift(B101(i-1,:)',1)';
end

clear tmp
B102=zeros(511,511);
tmp=hex2bin(b102);
B102(1,:)=tmp(2:end);
for i=2:size(B102,1)
    B102(i,:)=circshift(B102(i-1,:)',1)';
end

clear tmp
B111=zeros(511,511);
tmp=hex2bin(b111);
B111(1,:)=tmp(2:end);
for i=2:size(B111,1)
    B111(i,:)=circshift(B111(i-1,:)',1)';
end

clear tmp
B112=zeros(511,511);
tmp=hex2bin(b112);
B112(1,:)=tmp(2:end);
for i=2:size(B112,1)
    B112(i,:)=circshift(B112(i-1,:)',1)';
end

clear tmp
B121=zeros(511,511);
tmp=hex2bin(b121);
B121(1,:)=tmp(2:end);
for i=2:size(B121,1)
    B121(i,:)=circshift(B121(i-1,:)',1)';
end

clear tmp
B122=zeros(511,511);
tmp=hex2bin(b122);
B122(1,:)=tmp(2:end);
for i=2:size(B122,1)
    B122(i,:)=circshift(B122(i-1,:)',1)';
end

clear tmp
B131=zeros(511,511);
tmp=hex2bin(b131);
B131(1,:)=tmp(2:end);
for i=2:size(B131,1)
    B131(i,:)=circshift(B131(i-1,:)',1)';
end

clear tmp
B132=zeros(511,511);
tmp=hex2bin(b132);
B132(1,:)=tmp(2:end);
for i=2:size(B132,1)
    B132(i,:)=circshift(B132(i-1,:)',1)';
end

clear tmp
B141=zeros(511,511);
tmp=hex2bin(b141);
B141(1,:)=tmp(2:end);
for i=2:size(B141,1)
    B141(i,:)=circshift(B141(i-1,:)',1)';
end

clear tmpclear
B142=zeros(511,511);
tmp=hex2bin(b142);
B142(1,:)=tmp(2:end);
for i=2:size(B142,1)
    B142(i,:)=circshift(B142(i-1,:)',1)';
end

%creating the generator matrix G
sys=eye(7154);
cp=[B11 B12;B21 B22;B31 B32;B41 B42;B51 B52;B61 B62;B71 B72;B81 B82;B91 B92;B101 B102;B111 B112;B121 B122;B131 B132;B141 B142];
Gd=[sys cp];
G=uint8(Gd);

clearvars -except H G
save('data.mat','G','H')