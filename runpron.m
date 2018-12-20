%program by Poteryaeva Valentina
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function D=runpron( dU,z1,R,vsk,Np,hslice,z0,y0,m )
dt=1*10^(-5);traectlong=30000;pass=0;notpass=0;

for tra=1:1
i=1;clear Z;clear Y; clear W; clear V;
Z(1)=0;W(1)=vsk;V(1)=0;Y(1)=8;
while i<traectlong
    zz1=Z(i);  yy1=Y(i);wb1=0;vb1=0;
    for l=1:Np
        ro=sqrt((zz1-z0(l))^2+(yy1-y0(l))^2);
        wb1=wb1-(zz1-z0(l))/ro*interpPU(ro, z1, dU)/m;
        vb1=vb1-(yy1-y0(l))/ro*interpPU(ro, z1, dU)/m;
    end
    zb1=W(i);yb1=V(i);
    
    zz2=Z(i)+dt*zb1/2; yy2=Y(i)+dt*yb1/2; wb2=0;vb2=0;
    for l=1:Np
        ro=sqrt((zz2-z0(l))^2+(yy2-y0(l))^2);
        wb2=wb2-(zz2-z0(l))/ro*interpPU(ro, z1, dU)/m;
        vb2=vb2-(yy2-y0(l))/ro*interpPU(ro, z1, dU)/m;
    end
    zb2=W(i)+dt*wb2/2;yb2=V(i)+dt*vb2/2;
    
    zz3=Z(i)+dt*zb2/2;yy3=Y(i)+dt*yb2/2;wb3=0;vb3=0;
    for l=1:Np
        ro=sqrt((zz3-z0(l))^2+(yy3-y0(l))^2);
        wb3=wb3-(zz3-z0(l))/ro*interpPU(ro, z1, dU)/m;
        vb3=vb3-(yy3-y0(l))/ro*interpPU(ro, z1, dU)/m;
    end
    zb3=W(i)+dt*wb3/2;yb3=V(i)+dt*vb3/2;
    
    zz4=Z(i)+dt*zb3;yy4=Y(i)+dt*yb3;wb4=0;vb4=0;
    for l=1:Np
        ro=sqrt((zz4-z0(l))^2+(yy4-y0(l))^2);
        wb4=wb4-(zz4-z0(l))/ro*interpPU(ro, z1, dU)/m;
        vb4=vb4-(yy4-y0(l))/ro*interpPU(ro, z1, dU)/m;
    end
    zb4=W(i)+dt*wb4;yb4=V(i)+dt*vb4;

    Z(i+1)=Z(i)+dt*(zb1+2*zb2+2*zb3+zb4)/6;
    Y(i+1)=Y(i)+dt*(yb1+2*yb2+2*yb3+yb4)/6;
    W(i+1)=W(i)+dt*(wb1+2*wb2+2*wb3+wb4)/6;
    V(i+1)=V(i)+dt*(vb1+2*vb2+2*vb3+vb4)/6;
    
    if Y(i+1)<0 || Y(i+1)>hslice     V(i+1)=-V(i+1);    end
    
    if Z(i+1) > hslice+0.1;   
        i=traectlong;pass=pass+1
    else
        if Z(i+1) < Z(1)-0.1;
            i=traectlong;notpass=notpass+1
        else
        i=i+1;
        end
    end
end
p=plot(Z,Y, 'red');hold on;set(p(1), 'LineWidth', 0.5);
end
D=pass/100
end