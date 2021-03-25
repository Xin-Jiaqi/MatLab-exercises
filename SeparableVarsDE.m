function varargout=SeparableVarsDE(F,G,x,y,varargin)
Iy=int(F,x);
Ix=int(G,y);
syms C real
I=Iy-Ix-C;
if nargin == 4
    varargout{1}=[char(I),'=0'];
elseif nargin == 5
    cond=varargin{:};
    k1=strfind(cond,'(');
    k2=strfind(cond,')');
    k3=strfind(cond,'=');
    x0=sym(cond(k1(1)+1:k2(1)-1));
    y0=sym(cond(k3+1:end));
    C1=solve(subs(I,{x,y},{x0,y0}),C);
    varargout{1}=[char(subs(I,C,C1)),'=0'];
else
    error('Illegal input arguments.')
end