%% LIMPIAR LAS VARIABLES DEL SISTEMA
clc,clear all,close all;

%% Distancia Focal
f=0.015;

%% Centro de la Imagen
uo=640;
vo=512;

%% Tamano del pixel
p=10e-6;

%% Generacion de la matriz intrinseca de la camara

Cc=[f,0,0;0,f,0;0,0,1]*[1,0,0,0;0,1,0,0;0,0,1,0];
Cp=[1/p,0,uo;0,1/p,vo;0,0,1];

C=Cp*Cc;

%% Verificacion con el toolbox de vison
cam1 = CentralCamera('focal', 0.015, 'pixel', 10e-6,'resolution', [1280 1024], 'centre', [640 512], 'name', 'mycamera');
Intric=cam1.C;

%% Definicion del punto a representar en la camara
P = [0.3, 0.4, 3.0,1]';

%% Definicion de la tranformacion desde el origen al sistema de referencia de la camara
T=transl(-0.0,0,0)*troty(pi/12);

%% TRASLADAR EL OBJETO CAMARA A LA UBICACION ESTABLECIDA
cam1.T=T;
%% Poryectar el punto en la camara con el toolbox
cam1.project(P)

%% Proyectar el punto usando el modelo
proyeccion=(C*inv(T)*P);
proyeccion=proyeccion/proyeccion(3)

figure(1)
cam1.plot_camera();
hold on;
grid on;
plot3(P(1),P(2),P(3),'*r');
cam1.plot(P)

%% DEFINCION DE NUEVOS PUNTOS  A PROYECTAR
P = mkgrid(3, 0.2, 'pose', SE3(0, 0, 1.0)) 
P=[P;1*ones(1,length(P))]
%% GRFICOS DE LOS NUEVOS PUNTOS EN EL SSISTEM AGENERAL DE COORDENADAS
figure(1)
cam1.plot_camera();
hold on;
grid on;
plot3(P(1,:),P(2,:),P(3,:),'*r');

%% Proyeccion de los puntos 
cam1.project(P)

%% Proyectar el punto usando el modelo
proyeccion=(C*inv(T)*P);

cam1.plot(P(1:3,:))
proyeccion=proyeccion/proyeccion(3)
