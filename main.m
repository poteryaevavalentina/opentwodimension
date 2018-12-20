%program by Poteryaeva Valentina
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
epsil=sqrt( 51.2*10.22 ); 
sigm=0.2815; hslice=10;
m=0.00048; vsk=1351;q=140;%helium

%Пузырьковый слой
Np=1;R=3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z0=5;y0=5;
%изображение сферы:
    ph=[0:pi/180:2*pi]; % или гуще 
    zz=R*cos(ph)+z0; %x0 - центр окружности
    yy=R*sin(ph)+y0; 
    plot(zz,yy, 'LineWidth',1.3); hold on;
    
deltaz=0.08497;z=[0:deltaz:12];
;delta_for_r=0.0152137;delta_for_theta=0.01517;
Uslice=zeros(1,length(z));
for i=1:length(z)
    Uslice(i)=method_trapeciiSphere(delta_for_theta, delta_for_r, z(i),sigm,R);
end
Uslice=Uslice*8*pi*q*epsil;
%plot(z, Uslice);

dU=zeros(1,length(z));
for k=2:length(z)-1
    dU(k)=(Uslice(k+1)-Uslice(k-1))/(2*deltaz);
end
dU(1)=dU(2);dU(length(z))=dU(length(z)-1);
plot([0 hslice],[hslice hslice], 'b');
D=runpron( dU,z,R,vsk,Np,hslice,z0,y0,m )
