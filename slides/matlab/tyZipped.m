clear;clc;h=25;w=46;I=[1,24;2,24;3,24;4,24;5,24;6,24;9,24;10,24;3
9,24;40,24;1,23;2,23;3,23;4,23;5,23;6,23;9,23;10,23;39,23;40,23;3
,22;4,22;9,22;10,22;11,22;12,22;13,22;14,22;21,22;22,22;23,22;24,
22;25,22;26,22;29,22;30,22;31,22;32,22;33,22;34,22;39,22;40,22;45
,22;46,22;3,21;4,21;9,21;10,21;11,21;12,21;13,21;14,21;21,21;22,2
1;23,21;24,21;25,21;26,21;29,21;30,21;31,21;32,21;33,21;34,21;39,
21;40,21;45,21;46,21;3,20;4,20;9,20;10,20;15,20;16,20;19,20;20,20
;25,20;26,20;29,20;30,20;35,20;36,20;39,20;40,20;43,20;44,20;3,19
;4,19;9,19;10,19;15,19;16,19;19,19;20,19;25,19;26,19;29,19;30,19;
35,19;36,19;39,19;40,19;43,19;44,19;3,18;4,18;9,18;10,18;15,18;16
,18;19,18;20,18;25,18;26,18;29,18;30,18;35,18;36,18;39,18;40,18;4
1,18;42,18;43,18;44,18;3,17;4,17;9,17;10,17;15,17;16,17;19,17;20,
17;25,17;26,17;29,17;30,17;35,17;36,17;39,17;40,17;41,17;42,17;43
,17;44,17;3,16;4,16;9,16;10,16;15,16;16,16;21,16;22,16;23,16;24,1
6;25,16;26,16;29,16;30,16;35,16;36,16;39,16;40,16;45,16;46,16;3,1
5;4,15;9,15;10,15;15,15;16,15;21,15;22,15;23,15;24,15;25,15;26,15
;29,15;30,15;35,15;36,15;39,15;40,15;45,15;46,15;38,13;39,13;38,1
2;39,12;8,11;9,11;14,11;15,11;20,11;21,11;22,11;23,11;28,11;29,11
;34,11;35,11;38,11;39,11;8,10;9,10;14,10;15,10;20,10;21,10;22,10;
23,10;28,10;29,10;34,10;35,10;38,10;39,10;8,9;9,9;14,9;15,9;18,9;
19,9;24,9;25,9;28,9;29,9;34,9;35,9;38,9;39,9;8,8;9,8;14,8;15,8;18
,8;19,8;24,8;25,8;28,8;29,8;34,8;35,8;38,8;39,8;8,7;9,7;14,7;15,7
;18,7;19,7;24,7;25,7;28,7;29,7;34,7;35,7;8,6;9,6;14,6;15,6;18,6;1
9,6;24,6;25,6;28,6;29,6;34,6;35,6;10,5;11,5;12,5;13,5;14,5;15,5;2
0,5;21,5;22,5;23,5;30,5;31,5;32,5;33,5;34,5;35,5;38,5;39,5;10,4;1
1,4;12,4;13,4;14,4;15,4;20,4;21,4;22,4;23,4;30,4;31,4;32,4;33,4;3
4,4;35,4;38,4;39,4;14,3;15,3;14,2;15,2;10,1;11,1;12,1;13,1;10,0;1
1,0;12,0;13,0];J=zeros(w,h,1);for(i=1:316);J(I(i,1),I(i,2)+1)=1;e
nd;Z=zeros(w,h);J=min(max(J,Z+0.1),Z+0.9);DP=@(x,y,tx,ty)([1-tx,t
x]*J(x:x+1,y:y+1)*[1-ty;ty]);DL=@(x,y)DP(floor(x),floor(y),x-floo
r(x),y-floor(y));D=@(x,y)DL(min(w-1,max(1,x*w)),min(h-1,max(1,y*h
)));M=65536;vv=zeros(M,2);for(i=1:M);p=-1;while(rand()>p);rr=rand
(2,1);p=D(rr(1),rr(2));end;vv(i,:)=rr;end;set(gcf,'units','pixels
','position',[0,0,640,480]);scatter(vv(:,1),vv(:,2),2,linspace(1,
10,length(vv)),'filled');