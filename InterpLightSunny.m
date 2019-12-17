
function InterpLightSunny(Input1,Input2,Output1,Output2)
%The simulated area in the canopy
X1=30;
X2=40;
Y1=19;
Y2=57;
%Light input
STdata1=importdata(Input1);
STdata2=importdata(Input2);
CasSTdata1=STdata1.data;
CasSTdata2=STdata2.data;
PPF_ratio=importdata('PPF_ratio3.txt');% Qin_c(t)/Qin_s(t); Qin_s(t) is the incident light above the canopy in the sunny day and Qin_c(t) is the incident light above the canopy on the cloudy day, based on the  actual measured incident light.
SimLightData=[CasSTdata1(:,1:9),CasSTdata1(:,17),CasSTdata1(:,18:437),CasSTdata2(:,18:437)];

[SimLightDataRow,SimLightDataCol]=size(SimLightData);
Noqel=0;
NoRac=0;
NoLTnpq=0;
TimeStep=1;
1
AF=zeros(SimLightDataRow,84);
for FNo=1:SimLightDataRow
if SimLightData(FNo,1)>=X1&&SimLightData(FNo,1)<X2&&SimLightData(FNo,2)>=Y1&&SimLightData(FNo,2)<Y2
MeasuredLight(:,1)=SimLightData(FNo,11:SimLightDataCol)';
AF(FNo,:)=TqemEstimation5x(MeasuredLight,TimeStep,Noqel,NoRac,NoLTnpq)*SimLightData(FNo,10);
   end
end
size(AF)
ACanopy=sum(AF)';
0
Noqel=1;
NoRac=1;
NoLTnpq=1;
AF0=zeros(SimLightDataRow,84);
LAIi=zeros(SimLightDataRow,1);
for FNo=1:SimLightDataRow 
if SimLightData(FNo,1)>=X1&&SimLightData(FNo,1)<X2&&SimLightData(FNo,2)>=Y1&&SimLightData(FNo,2)<Y2
MeasuredLight=SimLightData(FNo,11:SimLightDataCol)';
   AF0(FNo,:)=TqemEstimation5x(MeasuredLight,TimeStep,Noqel,NoRac,NoLTnpq)*SimLightData(FNo,10);
   LAIi(FNo,1)=SimLightData(FNo,10);
   end
end
ACanopy0=sum(AF0)';
LAICanopy=sum(LAIi)/(X2-X1)/(Y2-Y1)

Noqel=0;
NoRac=1;
NoLTnpq=1;
2
AF2=zeros(SimLightDataRow,84);
for FNo=1:SimLightDataRow
if SimLightData(FNo,1)>=X1&&SimLightData(FNo,1)<X2&&SimLightData(FNo,2)>=Y1&&SimLightData(FNo,2)<Y2
MeasuredLight=SimLightData(FNo,11:SimLightDataCol)';
 AF2(FNo,:)=TqemEstimation5x(MeasuredLight,TimeStep,Noqel,NoRac,NoLTnpq)*SimLightData(FNo,10);
 end
end
ACanopy2=sum(AF2)';


Noqel=0;
NoRac=0;
NoLTnpq=1;
3
AF3=zeros(SimLightDataRow,84);
for FNo=1:SimLightDataRow
if SimLightData(FNo,1)>=X1&&SimLightData(FNo,1)<X2&&SimLightData(FNo,2)>=Y1&&SimLightData(FNo,2)<Y2
MeasuredLight=SimLightData(FNo,11:SimLightDataCol)';
 AF3(FNo,:)=TqemEstimation5x(MeasuredLight,TimeStep,Noqel,NoRac,NoLTnpq)*SimLightData(FNo,10);
 end
end
ACanopy3=sum(AF3)';


Noqel=1;
NoRac=1;
NoLTnpq=0;
4
AF4=zeros(SimLightDataRow,84);
for FNo=1:SimLightDataRow
if SimLightData(FNo,1)>=X1&&SimLightData(FNo,1)<X2&&SimLightData(FNo,2)>=Y1&&SimLightData(FNo,2)<Y2
MeasuredLight=SimLightData(FNo,11:SimLightDataCol)';
 AF4(FNo,:)=TqemEstimation5x(MeasuredLight,TimeStep,Noqel,NoRac,NoLTnpq)*SimLightData(FNo,10);
 end
end
ACanopy4=sum(AF4)';


Noqel=1;
NoRac=0;
NoLTnpq=1;
5
AF5=zeros(SimLightDataRow,84);
for FNo=1:SimLightDataRow
if SimLightData(FNo,1)>=X1&&SimLightData(FNo,1)<X2&&SimLightData(FNo,2)>=Y1&&SimLightData(FNo,2)<Y2
MeasuredLight=SimLightData(FNo,11:SimLightDataCol)';
 AF5(FNo,:)=TqemEstimation5x(MeasuredLight,TimeStep,Noqel,NoRac,NoLTnpq)*SimLightData(FNo,10);
 end
end
ACanopy5=sum(AF5)';

Noqel=0;
NoRac=1;
NoLTnpq=0;
6
AF6=zeros(SimLightDataRow,84);
for FNo=1:SimLightDataRow
if SimLightData(FNo,1)>=X1&&SimLightData(FNo,1)<X2&&SimLightData(FNo,2)>=Y1&&SimLightData(FNo,2)<Y2
MeasuredLight=SimLightData(FNo,11:SimLightDataCol)';
 AF6(FNo,:)=TqemEstimation5x(MeasuredLight,TimeStep,Noqel,NoRac,NoLTnpq)*SimLightData(FNo,10);
 end
end
ACanopy6=sum(AF6)';


Noqel=1;
NoRac=0;
NoLTnpq=0;
7
AF7=zeros(SimLightDataRow,84);
for FNo=1:SimLightDataRow
if SimLightData(FNo,1)>=X1&&SimLightData(FNo,1)<X2&&SimLightData(FNo,2)>=Y1&&SimLightData(FNo,2)<Y2
MeasuredLight=SimLightData(FNo,11:SimLightDataCol)';
 AF7(FNo,:)=TqemEstimation5x(MeasuredLight,TimeStep,Noqel,NoRac,NoLTnpq)*SimLightData(FNo,10);
 end
end
ACanopy7=sum(AF7)';

RdCanopy=RdCal(LAICanopy);%Unit: umol m-2 s-1
global ACanopyT
ACanopyT=[ACanopy0,ACanopy,ACanopy2,ACanopy3,ACanopy4,ACanopy5,ACanopy6,ACanopy7];
ACanopyT=ACanopyT/6/(X2-X1)/(Y2-Y1)*60/1000-RdCanopy*3600/6/1000;
AresultT=sum(ACanopyT);% Unit mmol m-2 day-1


dlmwrite(Output1,ACanopyT,'delimiter','\t','precision', '%.3f');% The carbon gain of every 10 min
dlmwrite(Output2,AresultT,'delimiter','\t','precision', '%.3f');% The carbon gain of the day