%clear all;
function Rd_canopy=RdCal(LAI)
kn=0.2;
Rd0=1.2;
Rdi=zeros(28,1);
for i=1:round(LAI)*2
    LAIi=(i-1)/2;
Rdi(i)=Rd0*exp(-kn*LAIi);
end
Rd_canopy=sum(Rdi)/2;


% for i=1:7*10
%     LAIi=(i-1)/10;
% Rdi(i)=Rd0*exp(-kn*LAIi);
% end
% Rd_canopy=sum(Rdi)/10;