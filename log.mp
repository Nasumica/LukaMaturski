input TEX;

color gridmm; gridmm=5/8[blue, white];
color gridcm; gridcm=3/8[blue, white];

beginfig(1);
numeric b; b = 2.7182818;
numeric ux, uy;
ux=uy=1cm;

pickup pencircle scaled 0.2pt;
for i = -20 upto 30:
	%if (i mod 10) <> 0: draw (0, i/10*uy) -- (10ux, i/10*uy) withcolor gridmm fi;
endfor;
for i = 1 upto 100:
	%if (i mod 10) <> 0: draw (i/10*ux, -2uy)--(i/10*ux, 3uy) withcolor gridmm fi;
endfor;

for i = -2 upto 3:
	if i <> 0: draw (0, i*uy) -- (10ux, i*uy) withcolor gridcm fi;
endfor;
for i = 1 upto 10:
	draw (i*ux, -2uy)--(i*ux, 3uy) withcolor gridcm;
endfor;

pickup pencircle scaled 0.4pt;
drawarrow (0, 0) -- (10ux+5mm, 0);
drawarrow (0, -2uy)--(0, 3uy+5mm); 

pickup pencircle scaled 0.3mm;
draw (0.135ux, mlog(0.135)*uy/256) {0.135ux, uy}
for ix=2 upto 102:
	.. (ix*ux/10, mlog(ix/10)*uy/256) {ix * ux,10uy}
endfor
withcolor red;

for i = 0 upto 10:
	label.bot(TEX("$\mathstrut" & decimal i & "$"), (i*ux,-2uy));
endfor;
for i = -2 upto 3:
	label.lft(TEX("$" & decimal i & "$"), (0,i*uy));
endfor;

pickup pencircle scaled 0.4pt;
numeric u, v;
u = b*ux; v = mlog(b)*uy/256;
draw (u,0) -- (u,v) dashed evenly;
dotlabel("", (u,v));
dotlabel.bot(btex $\mathstrut b$ etex, (u,0));

numeric u, v;
u = b*b*ux; v = mlog(b*b)*uy/256;
draw (u,0) -- (u,v) dashed evenly;
dotlabel("", (u,v));
dotlabel.bot(btex $\mathstrut b^2$ etex, (u,0));

numeric u, v;
u = ux/b; v = -mlog(b)*uy/256;
draw (u,0) -- (u,v) dashed evenly;
dotlabel("", (u,v));
dotlabel.top(btex $\displaystyle{1\over b}$ etex, (u,0));

dotlabel("", (1ux,0));
label.rt(btex $x$ etex, (10ux+5mm, 0));
label.top(btex $y$ etex, (0, 3uy+5mm));

endfig;

beginfig(2);
numeric p; p=2.5;
numeric q; q=0.5;

numeric u; u=1cm;
numeric o; o=5mm;
z0=(p*p-q*q, 2*p*q) * u; 
z1 = (x0+o, 0);
z2 = (0, y0+o);

pickup pencircle scaled 0.4pt;
drawarrow (-2mm, 0) -- z1;
drawarrow (0, -2mm) -- z2; 

draw z0 -- (x0,0) dashed evenly;
draw z0 -- (0,y0) dashed evenly;

pickup pencircle scaled 0.3mm;
drawarrow origin -- z0  withcolor red;

z4 = (p,q) * u;
z5 = (x4,0) rotated angle z0;

pickup pencircle scaled 0.4pt;
drawarrow 3/4(x4,0){up}..3/4z5{z0 rotated 90};

label.rt(btex $\Re$ etex, (x0+0.5u, 0));
label.top(btex $\Im$ etex, (0, y0+0.5u));
label.ulft(btex $\rho$ etex, 0.5z0);
label(btex $\theta$ etex, 1/2z4);


label.urt(btex $z$ etex, z0);
label.llft(btex $0$ etex, origin);
dotlabel.bot(btex $x$ etex, (x0,0));
dotlabel.lft(btex $y$ etex, (0,y0));

endfig;

end.