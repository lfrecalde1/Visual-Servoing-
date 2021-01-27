%% Resetear los valores 

clc,clear all,close all;

%% Generar el objeto de la camara
cam = CentralCamera('focal', 0.015);

%% Defincion del objeto con respecto al sistema de referencia general
P = [0.3, 0.4, 3.0]';

%% Proyectar al objeto en el frame de la camara aun no en pixeles
cam.project(P)

%% Proyectar el objeto con una trasnlacion de la camara
cam.project(P, 'pose', SE3(-0.5, 0, 0) )


% cam = CentralCamera('focal', 0.015, 'pixel', 10e-6,'resolution', [1280 1024], 'centre', [640 512], 'name', 'mycamera')
% cam.project(P)
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