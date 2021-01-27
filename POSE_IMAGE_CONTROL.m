clc,clear all,close all;

cam = CentralCamera('default');
cam_1= CentralCamera('default');
P = mkgrid( 2, 0.5, 'pose', SE3(0,0,3) );
pd = bsxfun(@plus, 200*[-1 -1 1 1; -1 1 1 -1], cam.pp')
T_C =SE3(0,0,-2);
p = cam.plot(P, 'pose', T_C);
p_2 = cam_1.plot(pd, 'pose', T_C);
e = pd - p;
J = cam.visjac_p( p, 1 )
lambda=1;
v = lambda * pinv(J) * e(:)
  ibvs = IBVS(cam, 'pose0', T_C, 'pstar', pd);
  ibvs.run();
  figure(3)
 ibvs.plot_p();
 figure(4)
 ibvs.plot_vel();
 figure(5)
 ibvs.plot_camera();
 slcamera()
