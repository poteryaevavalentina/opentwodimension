%program by Poteryaeva Valentina
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%method trapecii (integration)
function ui=method_trapeciiSphere(delta_for_theta, delta_for_r_int, zi,sigm,R2);
theta=[0:delta_for_theta:pi];tmpu=zeros(1,length(theta));

for i=1:length(theta)
    tmpu(i)=sin(theta(i))*method_trap(theta(i),delta_for_r_int, zi,sigm,R2);
end
integr=zeros(1,length(theta)-1);
    for k=1:length(integr)
        integr(k)=(tmpu(k)+tmpu(k+1))/2*(theta(k+1)-theta(k));
    end
ui=sum(integr);
end


function integrr=method_trap(thetai,delta_for_r_int, zi,sigm,R2)
    r_int=[0.00000000001:delta_for_r_int:R2];tmpr=zeros(1,length(r_int));
    for j=1:length(r_int)
        psig=sigm/sqrt((r_int(j))^2+zi^2-2*r_int(j)*zi*cos(thetai));
        tmpr(j)=(r_int(j))^2*psig*tanh(psig^(11)-psig^5);
    end
    integ=zeros(1,length(r_int)-1);
    for k=1:length(integ)
        integ(k)=(tmpr(k)+tmpr(k+1))/2*(r_int(k+1)-r_int(k));
    end
    integrr=sum(integ);
end

