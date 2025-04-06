prologues := 3;
outputtemplate := "%j%c.mps";

vardef inv(expr x) =
	(x, 1/x){1, -x*x}
enddef;

beginfig(3);

numeric u; u=1cm;

path fun;

numeric b, e, v; b=3; e = 60; v = 2.7182818284590452353602874713527;

fun = inv(b/10) scaled u
for i = b+1 upto e:
	.. inv(i/10) scaled u
endfor;

path xax, yax;
xax = (-2mm,0) -- (e/10*u + 5mm,0);
yax = (0,-2mm) -- (0, u/(b/10)+5mm);

path one; one = (u,0) -- (u, u);
path val; val = (v*u,0) -- (v*u,u);


%draw one;
%draw val;

path integral; integral = buildcycle(xax, val, fun, one);

fill integral withcolor 8/10[red, white];

z0=center integral;

pickup pencircle scaled 0.4pt;
draw (u,0)--(u,u) withcolor red;
draw (u*v,0) -- (u*v, u/v) withcolor red;
drawarrow xax;
drawarrow yax;

pickup pencircle scaled 0.3mm;
draw fun withcolor red;

label.bot(btex $\ln x$ etex, z0);

dotlabel.lft(btex $\mathstrut 1$ etex, (0,u));
dotlabel.bot(btex $\mathstrut 1$ etex, (u,0));
%dotlabel.bot(btex $\mathstrut 2$ etex, (2u,0));
%dotlabel.bot(btex $\mathstrut 3$ etex, (3u,0));
dotlabel.bot(btex $\mathstrut x$ etex, (u*v,0));
label.rt(btex $\displaystyle{y={1\over x}}$ etex, (b/10 * u+3mm, u/b * 10));

label.rt(btex $x$ etex, (e/10*u + 5mm,0));
label.top(btex $y$ etex, (0, u/(b/10)+5mm));


endfig;

end.