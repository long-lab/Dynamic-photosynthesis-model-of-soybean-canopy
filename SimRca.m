clear all;
global TaoE;
global TaoM
TaoE=0.56;
TaoM=16.83;
global TaoRac;
global TaoRacd;
TaoRac=129.7/60;
TaoRacd=129.7/60*2;
InterpLightSunny('3PPF_outputV231_rep2_05-12.txt','3PPF_outputV231_rep2_12-19.txt','Rac1CanopySoy_Sunny10min.txt','Rac1CanopySoy_SunnyWholeDay.txt');
clear all;
global TaoE;
global TaoM
TaoE=0.56;
TaoM=16.83;
global TaoRac;
global TaoRacd;
TaoRac=129.7/60;
TaoRacd=129.7/60*2;
InterpLightCloudy('3PPF_outputV231_rep2_05-12.txt','3PPF_outputV231_rep2_12-19.txt','Rac1CanopySoy_Cloudy10min.txt','Rac1CanopySoy_CloudyWholeDay.txt');

clear all;
global TaoE;
global TaoM
TaoE=0.56;
TaoM=16.83;
global TaoRac;
global TaoRacd;
TaoRac=471.7/60;
TaoRacd=471.7/60*2;
InterpLightSunny('3PPF_outputV231_rep2_05-12.txt','3PPF_outputV231_rep2_12-19.txt','Rac2CanopySoy_Sunny10min.txt','Rac2CanopySoy_SunnyWholeDay.txt');
clear all;
global TaoE;
global TaoM
TaoE=0.56;
TaoM=16.83;
global TaoRac;
global TaoRacd;
TaoRac=471.7/60;
TaoRacd=471.7/60*2;
InterpLightCloudy('3PPF_outputV231_rep2_05-12.txt','3PPF_outputV231_rep2_12-19.txt','Rac2CanopySoy_Cloudy10min.txt','Rac2CanopySoy_CloudyWholeDay.txt');


clear all;
global TaoE;
global TaoM
TaoE=0.56;
TaoM=16.83;
global TaoRac;
global TaoRacd;
TaoRac=1850/60;
TaoRacd=1850/60*2;
InterpLightSunny('3PPF_outputV231_rep2_05-12.txt','3PPF_outputV231_rep2_12-19.txt','Rac3CanopySoy_Sunny10min.txt','Rac3CanopySoy_SunnyWholeDay.txt');
clear all;
global TaoE;
global TaoM
TaoE=0.56;
TaoM=16.83;
global TaoRac;
global TaoRacd;
TaoRac=1850/60;
TaoRacd=1850/60*2;
InterpLightCloudy('3PPF_outputV231_rep2_05-12.txt','3PPF_outputV231_rep2_12-19.txt','Rac3CanopySoy_Cloudy10min.txt','Rac3CanopySoy_CloudyWholeDay.txt');
