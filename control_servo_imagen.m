%% Resetear los valores 

clc,clear all,close all;

%% Generar el objeto de la camara
cam = CentralCamera('focal', 0.015);

%% Defincion del objeto con respecto al sistema de referencia general
P = [0.3, 0.4, 3.0,1]';
Pc= [-0.5,0,0,1]';
%% Proyectar al objeto en el frame de la camara aun no en pixeles
cam.project(P)

%% Proyectar el objeto con una trasnlacion de la camara
cam.project(P, 'pose', SE3(-0.5, 0, 0)*SE3.Ry(0.9) )

T=transl(-0.5,0,0)*troty(0.9);
R=troty(0.9);
K=cam.K
C=[1,0,0,0;0,1,0,0;0,0,1,0;];

proyeccion=(K*C*inv(T)*P);
proyeccion_2=(K*C*inv(R)*(P-Pc));
proyeccion=proyeccion/proyeccion(3)
proyeccion_2=proyeccion_2/proyeccion_2(3)

cam1 = CentralCamera('focal', 0.015, 'pixel', 10e-6,'resolution', [1280 1024], 'centre', [640 512], 'name', 'mycamera')
Intric=cam1.C
cam1.project(P)
% cam.K
% cam.C
% P = mkgrid(3, 0.2, 'pose', SE3(0, 0, 1.0));
% P(:,1:4)
% cam.project(P)
% cam.plot(P)
% Tcam = SE3(-1,0,0.5)*SE3.Ry(0.9);
% cam.plot(P, 'pose', Tcam)
% p = cam.plot(P, 'pose', Tcam)
% cube = mkcube(0.2, 'pose', SE3(0, 0, 1) );
% cam.plot(cube);
% [X,Y,Z] = mkcube(0.2, 'pose', SE3(0, 0, 1), 'edge');
% cam.mesh(X, Y, Z)
% Tcam = SE3(-1,0,0.5)*SE3.Ry(0.8);
% cam.mesh(X, Y, Z, 'pose', Tcam);