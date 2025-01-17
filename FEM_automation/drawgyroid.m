function p=drawgyroid(v,sizeofdata,nofv,nofgyroid,data0,data01)
% 绘图函数
% v采用函数createv输出值。
% sizeofdatta采用函数createdata输出值。
% nofv,nofgyroid含义与createv，createdata中的保持一致。
% 输出gyroid结构图像，x,y,z三轴等距，默认视角[1,1,1]。
minxyz=min(data0);
maxxyz=max(data0);
yspace=linspace(minxyz(1)-(nofv-1)/2*(nofgyroid/nofv),maxxyz(1)+(nofv-1)/2*(nofgyroid/nofv),sizeofdata(1)*nofv);
xspace=linspace(minxyz(2)-(nofv-1)/2*(nofgyroid/nofv),maxxyz(2)+(nofv-1)/2*(nofgyroid/nofv),sizeofdata(2)*nofv);
zspace=linspace(minxyz(3)-(nofv-1)/2*(nofgyroid/nofv),maxxyz(3)+(nofv-1)/2*(nofgyroid/nofv),sizeofdata(3)*nofv);
[x,y,z]=meshgrid(xspace,yspace,zspace);
o = sin(2*pi/nofgyroid*(x)).*cos(2*pi/nofgyroid*y) + sin(2*pi/nofgyroid*y).*cos(2*pi/nofgyroid*z) + sin(2*pi/nofgyroid*z).*cos(2*pi/nofgyroid*(x));

xleft= (y==(minxyz(1)-(nofv-1)/2*(nofgyroid/nofv))) ;
o(xleft) =0.9;
xright= (y==(maxxyz(1)+(nofv-1)/2*(nofgyroid/nofv))) ;
o(xright) =0.9;
yleft= (x==(minxyz(2)-(nofv-1)/2*(nofgyroid/nofv))) ;
o(yleft) =0.9;
yright= (x==(maxxyz(2)+(nofv-1)/2*(nofgyroid/nofv))) ;
o(yright) =0.9;
zleft= (z==(minxyz(3)-(nofv-1)/2*(nofgyroid/nofv)) );
o(zleft) =0.9;
zright= (z==(maxxyz(3)+(nofv-1)/2*(nofgyroid/nofv))) ;
o(zright) =0.9;

%o=o+permute(v,[2 1 3]);
o=o+v;

% o=permute(o,[2 1 3]);
p = isosurface(x,y,z,o,0.9);                     
% patch(p,'facecolor','y','edgecolor','none')
% camlight
% axis equal
% view([0,0,1]); 
% xlabel('x/mm')
% ylabel('y/mm')
% zlabel('z/mm')
end