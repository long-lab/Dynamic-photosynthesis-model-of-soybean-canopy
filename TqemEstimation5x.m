function Assimilation=TqemEstimation5x(SimLight,TimeStep,Noqel,NoRac,NoLTnpq)
%global Am;
global TaoE;
global TaoM;
global TaoRac;
global TaoRacd;

TRacd=TaoRacd;
Tqe=TaoE;
Tqm=TaoM;
Pqe=0.7;
Pqm=0.3;
Aql0=0.0371;
TRac=TaoRac;

Gama=38.6;%40;
Ko=404;%341;
Kc=248;%269;
O2=210;
Vmax0=120;
Ci=280;

Rd=0;% was 1;% the Rd is calculated by RdCal.m. See InterpLightSunny/InterpLightCludy: RdCanopy=RdCal(LAICanopy)
Jmax=200;
theta=0.9;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Rca model Mott and Woodrow 2000
 Rac=70;
 KaRac=12.4;%mg m-2
 Vcmax0_s=Rac/( KaRac+ Rac);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(SimLight);
ii=0:TimeStep:(m-1)*TimeStep;
iix=0:TimeStep/6:(m-1)*TimeStep;
TimeStepx=TimeStep/6;% TimeStepx is 10s
SimLightx=interp1(ii,SimLight(:,1),iix,'Nearest');%Get the light intensity for each time step

[k,l]=size(SimLightx);

Am=zeros(5040,1);
for Mtime=1:l
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Aql(Mtime)=0.00028*SimLightx(Mtime)+Aql0;%steady state NPQ value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%            
            %AVmax0(Mtime)=0.10+SimLightx(Mtime)*0.003;%steady state Vcmax value
            %if AVmax0(Mtime)>0.9
            %    AVmax0(Mtime)=0.9;
            %end

           klight=120*0.85; 
           AVmax0(Mtime)=Vcmax0_s*SimLightx(Mtime)/(klight+SimLightx(Mtime)); %steady state Vcmax value
                       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                
            if Mtime==1
            qste(Mtime)=Aql(Mtime)*Pqe;
            qstm(Mtime)=Aql(Mtime)*Pqm;
            AVmax(Mtime)=AVmax0(Mtime);
            else 
            Aqe(Mtime)=(qste(Mtime-1)-Aql(Mtime)*Pqe);
            Aqm(Mtime)=(qstm(Mtime-1)-Aql(Mtime)*Pqm);

            qste(Mtime)=qste(Mtime-1)-Aqe(Mtime)*1/Tqe*(TimeStepx);
            if qste(Mtime)<Aql(Mtime)*Pqe
            qste(Mtime)=Aql(Mtime)*Pqe;
            end
            qstm(Mtime)=qstm(Mtime-1)-Aqm(Mtime)*1/Tqm*(TimeStepx); 
            if qstm(Mtime)<Aql(Mtime)*Pqm
            qstm(Mtime)=Aql(Mtime)*Pqm;
            end
            ARac(Mtime)=(AVmax(Mtime-1)-AVmax0(Mtime));
            if AVmax(Mtime-1)<=AVmax0(Mtime)
            AVmax(Mtime)=AVmax(Mtime-1)-ARac(Mtime)*1/TRac*(TimeStepx);
            else
            AVmax(Mtime)=AVmax(Mtime-1)-ARac(Mtime)*1/TRacd*(TimeStepx);  
            end
            if Noqel==1
            qste(Mtime)=Aql(Mtime)*Pqe;
            qstm(Mtime)=Aql(Mtime)*Pqm;
            end
            if NoRac==1
            AVmax(Mtime)=Vmax0;
            end
            end            
qst(Mtime)=qste(Mtime)+qstm(Mtime);   
if qst(Mtime)<Aql(Mtime)
    qst(Mtime)=Aql(Mtime);
end
qno(Mtime)=SimLightx(Mtime)*0.0001395+0.1918;
if qno(Mtime)>0.28
    qno(Mtime)=0.280;
end

Vmax(Mtime)=AVmax(Mtime)*Vmax0;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LTNPQ calculation (Zhu et al., 2004)
if  Mtime>1/TimeStepx*60
      timea=round(Mtime*TimeStepx);
Qc=SimLight(timea-59:timea,1);
Iint=0;
for n=1:60 
    IntH(n)=Qc(60-n+1)*(1-(n-1)/(60));
    Iint=Iint+IntH(n);
end

Temp=25;%oC
fh=5.1e+5;%5.1e+5;% cold-susceptible species//7.0e+5;cold-tolearant species
Tf=0.0033*Temp^2-0.1795*Temp+3.4257;
  
Fvm=(1-Iint*Tf/fh); 
else
Fvm=1; 
end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if NoLTnpq==1
PhiPSII(Mtime)=0.801-qst(Mtime);
end

if NoLTnpq==0
PhiPSII(Mtime)=Fvm*0.801-qst(Mtime);
end

JETR(Mtime)=(PhiPSII(Mtime)*SimLightx(Mtime)/2+Jmax-sqrt((PhiPSII(Mtime)*SimLightx(Mtime)/2+Jmax)^2-4*theta*PhiPSII(Mtime)*SimLightx(Mtime)/2*Jmax))/(2*theta);
Aj(Mtime)=(Ci-Gama)*JETR(Mtime)/(4*Ci+9.3*Gama)-Rd;
Ac(Mtime)=Vmax(Mtime)*(Ci-Gama)/(Ci+Kc*(1+O2/Ko))-Rd;
Am(Mtime)=min(Aj(Mtime),Ac(Mtime));
end
for i=1:840/10
   Assimilation(1,i)=sum(Am((i-1)*60+1:i*60));
end

end


