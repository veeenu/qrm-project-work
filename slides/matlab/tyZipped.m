h=25;w=46;I=cumsum([1,24;0,1;1,-1;0,1;1,-9;0,1;0,1;0,1;
0,1;0,1;0,1;0,1;0,1;0,1;1,-9;0,1;0,1;0,1;0,1;0,1;0,1;0,
1;0,1;0,1;1,-1;0,1;1,-1;0,1;2,-18;0,1;0,1;0,1;0,1;0,1;1
,-5;0,1;0,1;0,1;0,1;0,1;0,4;0,1;0,1;0,1;0,1;0,1;0,1;0,1
;0,1;0,1;1,-24;0,1;0,3;0,1;0,10;0,1;0,1;0,1;0,1;0,1;0,1
;0,1;0,1;0,1;1,-24;0,1;0,3;0,1;0,16;0,1;1,-22;0,1;0,3;0
,1;0,16;0,1;1,-22;0,1;0,3;0,1;0,16;0,1;1,-20;0,1;0,1;0,
1;0,1;0,1;0,1;0,1;0,1;0,1;0,10;0,1;1,-20;0,1;0,1;0,1;0,
1;0,1;0,1;0,1;0,1;0,1;0,4;0,1;0,1;0,1;0,1;0,1;1,-5;0,1;
0,1;0,1;0,1;0,1;2,-14;0,1;0,1;0,1;1,-3;0,1;0,1;0,1;0,8;
0,1;0,1;0,1;1,-16;0,1;0,5;0,1;0,6;0,1;0,1;0,1;1,-16;0,1
;0,5;0,1;0,4;0,1;0,5;0,1;1,-18;0,1;0,5;0,1;0,4;0,1;0,5;
0,1;1,-18;0,1;0,5;0,1;0,4;0,1;0,5;0,1;1,-16;0,1;0,1;0,1
;0,6;0,1;0,5;0,1;1,-16;0,1;0,1;0,1;0,6;0,1;0,1;0,1;0,1;
0,1;0,1;0,1;1,-7;0,1;0,1;0,1;0,1;0,1;0,1;0,1;2,-16;0,1;
0,1;0,1;0,1;0,1;1,-5;0,1;0,1;0,1;0,1;0,1;0,4;0,1;0,1;0,
1;0,1;0,1;0,1;0,1;1,-18;0,1;0,10;0,1;0,1;0,1;0,1;0,1;0,
1;0,1;1,-18;0,1;0,16;0,1;1,-18;0,1;0,16;0,1;1,-18;0,1;0
,16;0,1;1,-18;0,1;0,1;0,1;0,1;0,1;0,1;0,1;0,10;0,1;1,-1
8;0,1;0,1;0,1;0,1;0,1;0,1;0,1;0,4;0,1;0,1;0,1;0,1;0,1;1
,-5;0,1;0,1;0,1;0,1;0,1;2,-16;0,1;0,3;0,1;0,1;0,1;0,1;0
,1;1,-9;0,1;0,3;0,1;0,1;0,1;0,1;0,1;0,2;0,1;0,1;0,1;0,1
;0,1;0,1;0,1;0,1;0,1;1,-9;0,1;0,1;0,1;0,1;0,1;0,1;0,1;0
,1;0,1;1,-7;0,1;1,-1;0,1;1,-1;0,1;0,1;0,1;1,-3;0,1;0,1;
0,1;1,-5;0,1;0,5;0,1;1,-7;0,1;0,5;0,1]);J=zeros(w,h,1);
for(i=1:316);J(I(i,1),I(i,2))=.9;end;Z=zeros(w,h);J=max
(J,Z+0.1);P=@(x,y,tx,ty)([1-tx,tx]*J(x:x+1,y:y+1)*[1-ty
;ty]);L=@(x,y)P(floor(x),floor(y),x-floor(x),y-floor(y)
);D=@(x,y)L(min(w-1,max(1,x*w)),min(h-1,max(1,y*h)));M=
65536;v=zeros(M,2);for(i=1:M);p=-1;while(rand()>p);r=ra
nd(2,1);p=D(r(1),r(2));end;v(i,:)=r;end;scatter(v(:,1),
v(:,2),2,linspace(1,10,length(v)),'filled');
