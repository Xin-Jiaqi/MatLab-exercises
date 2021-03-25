g = 'squareg';
b = 'squareb1';
c = 1;a = 0;f = 0;d = 1;
[p,e,t]=initmesh(g);
u0 = zeros(size(p,2),1);
ix = find(sqrt(p(1,:).^2+p(2,:).^2)<0.4);
u0(ix)=1;
nframe = 20;
tlist = linspace(0,0.1,nframe);
u1=parabolic(u0,tlist,b,p,e,t,c,c,f,c);
for j = 1:nframe
pdesurf(p,t,u1(:,j));
mv(j)=getframe;
end
movie(mv,10);