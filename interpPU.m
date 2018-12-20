%program by Poteryaeva Valentina
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function PU1 = interpPU(r_tmp, re, PU)
    if r_tmp ~= re(end)
        k = find(re(1:end-1)<=r_tmp & re(2:end)>r_tmp);
        PU1 = PU(k)+ (r_tmp-re(k))/(re(k+1)-re(k))*(PU(k+1)-PU(k));
    else
        PU1 = PU(end);
    end
end
   
