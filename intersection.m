function [XYZ,RMSE_X,RMSE_Y,RMSE_Z,delta_X,delta_Y] = intersection(f,EOP1,EOP2,xy1,xy2,t1,t2,XYZ_icp)
for i=1:size(xy1,1)
   T1 = T0_function(EOP1,f,xy1(i,:),t1(i));
   T2 = T0_function(EOP2,f,xy2(i,:),t2(i));
   
   P1 = pose(EOP1,t1(i));
   P2 = pose(EOP2,t2(i));
   T = [T1,-T2];
   B = P2-P1;
   
   lambda = T\B;
   XYZ1 = lambda(1,1).*T1+P1;
   XYZ2 = lambda(2,1).*T2+P2;
   XYZ(i,:) = (XYZ1+XYZ2)/2;
   
   X = XYZ_icp(:,1);
   Y = XYZ_icp(:,2);
   Z = XYZ_icp(:,3);
   delta_X(i) = XYZ(i,1)-X(i,1);
   delta_Y(i) = XYZ(i,2)-Y(i,1);
   delta_Z = XYZ(i,3)-Z(i,1);
   RMSE_X = sqrt(sum(delta_X(i).^2)/length(delta_X(i)));
   RMSE_Y = sqrt(sum(delta_Y(i).^2)/length(delta_Y(i)));
   RMSE_Z = sqrt(sum(delta_Z.^2)/length(delta_Z));
end

end