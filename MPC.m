clc;
clear;
close all;

load('Data.mat');
GCPs(:,1) = [1:size(Ground_Point,1)];
GCPs(:,2:4) = Ground_Point;
% labels = num2str(all_GCP(:,1));
% figure;plot(all_GCP(:,2),all_GCP(:,3),'^');
% text(all_GCP(:,2),all_GCP(:,3),labels)

selected_GCP = [25,1,12,11,34,21,7,13,30,18,27,22,35,26,31];
selected_ICP = [2,3,4,5,6,8,9,10,16,17,20,23,24,29,32,33,15,14,19,28];
% selected_GCP = [25,1,12,11,34,21,7,13,30,18,27,22,35,26,31,10,4];
% selected_ICP = [2,3,5,6,8,9,16,17,20,23,24,29,32,33,15,14,19,28];
% selected_GCP = [25,1,12,11,34,21,7,13,30,18,27,22,35,26,31,10,4,6,5,29];
% selected_ICP = [2,3,8,9,16,17,20,23,24,32,33,15,14,19,28];
% selected_GCP = [4,5,6,7,8,11,12,13,14,16,17,22,23,24,26,27,28,30,31,33];
% selected_ICP = [1,2,3,9,10,15,18,19,20,21,25,29,32,34,35];

point_L = [Image_Point_Left,Ground_Point];
PTS1_L = point_L(selected_GCP,:);
PTS2_L = point_L(selected_ICP,:);

point_R = [Image_Point_Right,Ground_Point];
PTS1_R = point_R(selected_GCP,:);
PTS2_R = point_R(selected_ICP,:);

% str = [1 1 0 1 1 0 1 1 0 1 0 0 1 0 0 1 0 0];
str = [1 1 1 0 0 0 1 1 0 1 1 0 1 1 0 1 1 0];

Sx = Detector_Size;
Nr = Number_of_Rows;
f = Principal_Distance;

[EOP_L,accuracy_L,dr_L,dc_L] = resection(str,f,PTS1_L,PTS2_L);
[EOP_R,accuracy_R,dr_R,dc_R] = resection(str,f,PTS1_R,PTS2_R);
subplot(1,2,1)
quiver(PTS2_L(:,1),PTS2_L(:,2),dr_L,dc_L)
hold on
plot(PTS2_L(:,1),PTS2_L(:,2),'ob')
hold on
plot(PTS1_L(:,1),PTS1_L(:,2),'^r')
title('Residual vector for left image')
subplot(1,2,2)
quiver(PTS2_R(:,1),PTS2_R(:,2),dr_R,dc_R)
hold on
plot(PTS2_R(:,1),PTS2_R(:,2),'ob')
hold on
plot(PTS1_R(:,1),PTS1_R(:,2),'^r')
title('Residual vector for right image')

%% Intersection
r_L = PTS2_L(:,2);
t_L = r_L;
c_L = PTS2_L(:,1);
x_L = (r_L-(Nr/2)).*Sx;
y_L = (c_L-(Nr/2)).*Sx;
xy_L = [x_L,y_L];

r_R = PTS2_R(:,2);
t_R = r_R;
c_R = PTS2_R(:,1);
x_R = (r_R-(Nr/2)).*Sx;
y_R = (c_R-(Nr/2)).*Sx;
xy_R = [x_R,y_R];

XYZ_icp = Ground_Point(selected_ICP,:);
XYZ_gcp = Ground_Point(selected_GCP,:);
[XYZ,RMSE_X,RMSE_Y,RMSE_Z,delta_X,delta_Y] = intersection(f,EOP_R,EOP_L,xy_R,xy_L,t_R,t_L,XYZ_icp);
figure
quiver(XYZ_icp(:,1),XYZ_icp(:,2),delta_X(:),delta_Y(:))
hold on
plot(XYZ_icp(:,1),XYZ_icp(:,2),'ob')
hold on
plot(XYZ_gcp(:,1),XYZ_gcp(:,2),'^r')
title('Residual vector for ground points')