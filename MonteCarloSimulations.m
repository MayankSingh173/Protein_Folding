
%Original protein conformation
b=[2 1 12 13;
   3 4 11 14;
   6 5 10 15;
   7 8 9 16];

c=zeros(40);%making canvas of 40x40,and putting our orginal protein to it

c(20:23,20:23)=b;

E1=9;%Initial interaction Energy of original protein(fully folded state) 

%showing protein conformation
for b=1:16
    [X(b),Y(b)]=find(c==b);
end
plot(X,Y,'o-')

xlim([0,40]);
ylim([0,40]);

iter=10000;%No. of Moves

for y=1:iter
a=c;%copying of original canvas and doing all the moves in new canvas

random=randi(16);% generating random no. between 1-16

if(random==1)% End Move condition for 1st residue
    [i1,j1]=find(a==1);
    [i2,j2]=find(a==2);
    if(i1==i2)
         if(a(i2-1,j2)==0 && a(i2+1,j2)==0)
             g=[i2-1,i2+1];
             h=randi([1,2]);
             k=g(h);
             if(k==i2-1)
                 a(i2-1,j2)=a(i1,j1);
                 a(i1,j1)=0;
             else
                 a(i2+1,j2)=a(i1,j1);
                 a(i1,j1)=0;
             end
                 
         elseif(a(i2-1,j2)==0)
            a(i2-1,j2)=a(i1,j1);
            a(i1,j1)=0;
           
         elseif (a(i2+1,j2)==0)
                 a(i2+1,j2)=a(i1,j1);
                 a(i1,j1)=0;
         else
             a(i1,j1)=a(i1,j1);
         end
    else
          if(a(i2,j2-1)==0)
             a(i2,j2-1)=a(i1,j1);
             a(i1,j1)=0;
         elseif (a(i2,j2+1)==0)
                 a(i2,j2+1)=a(i1,j1);
                 a(i1,j1)=0;
         else
             a(i1,j1)=a(i1,j1);
          end
    end 
elseif(random==16)%End Move condition for 16 residue
    [i1,j1]=find(a==16);
    [i2,j2]=find(a==15);
    if(i1==i2)
         if(a(i2-1,j2)==0 && a(i2+1,j2)==0)
             g=[i2-1,i2+1];
             h=randi([1,2]);
             k=g(h);
             if(k==i2-1)
                 a(i2-1,j2)=a(i1,j1);
                 a(i1,j1)=0;
             else
                 a(i2+1,j2)=a(i1,j1);
                 a(i1,j1)=0;
             end    
         elseif(a(i2-1,j2)==0)
            a(i2-1,j2)=a(i1,j1);
            a(i1,j1)=0;
         elseif (a(i2+1,j2)==0)
                 a(i2+1,j2)=a(i1,j1);
                 a(i1,j1)=0;
         else
             a(i1,j1)=a(i1,j1);
         end
    else
          if(a(i2,j2-1)==0)
             a(i2,j2-1)=a(i1,j1);
             a(i1,j1)=0;
         elseif (a(i2,j2+1)==0)
                 a(i2,j2+1)=a(i1,j1);
                 a(i1,j1)=0;
         else
             a(i1,j1)=a(i1,j1);
          end
    end   
else%Crank shaft moves
   [i,j]=find(a==random);
   [i1,j1]=find(a==(random+1));
   [i2,j2]=find(a==(random-1));
   if((i1==i) && (j2==j))
       if((j1==j+1) && (i2==i+1))
           if(a(i+1,j+1)==0)
            a(i+1,j+1)=a(i,j);
            a(i,j)=0;
           else
           end
              a(i,j)=a(i,j); 
       elseif((j1==j-1) && (i2==i+1))
           if(a(i+1,j-1)==0)
             a(i+1,j-1)=a(i,j);
             a(i,j)=0;
           else
             a(i,j)=a(i,j);
           end
       elseif((j1==j+1) && (i2==i-1))
           if(a(i-1,j+1)==0)
             a(i-1,j+1)=a(i,j);
             a(i,j)=0;
           else
             a(i,j)=a(i,j);
           end
       elseif((j1==j-1) && (i2==i-1))
          if(a(i-1,j-1)==0)
            a(i-1,j-1)=a(i,j);
            a(i,j)=0;
          else
            a(i,j)=a(i,j);
          end
       else
           a(i,j)=a(i,j);
       end
   elseif(i2==i && j1==j)
       if((j2==j+1) && (i1==i+1))
           if(a(i+1,j+1)==0)
            a(i+1,j+1)=a(i,j);
            a(i,j)=0;
           else
            a(i,j)=a(i,j);
           end
       elseif((j2==j-1) && (i1==i+1))
           if(a(i+1,j-1)==0)
             a(i+1,j-1)=a(i,j);
             a(i,j)=0;
           else
             a(i,j)=a(i,j);
           end
       elseif((j2==j+1) && (i1==i-1))
           if(a(i-1,j+1)==0)
             a(i-1,j+1)=a(i,j);
             a(i,j)=0;
           else
             a(i,j)=a(i,j);
           end
       elseif((j2==j-1) && (i1==i-1))
          if(a(i-1,j-1)==0)
           a(i-1,j-1)=a(i,j);
           a(i,j)=0;
           else
             a(i,j)=a(i,j);
           end
       else
           a(i,j)=a(i,j);
       end
       
   else
       a(i,j)=a(i,j);
   end  
end

%Calculating all the Interaction energies of after doing a move
[a1,b1]=find(a==1);
[a2,b2]=find(a==12);
[a3,b3]=find(a==4);
[a4,b4]=find(a==11);
[a5,b5]=find(a==3);
[a6,b6]=find(a==6);
[a7,b7]=find(a==5);
[a8,b8]=find(a==10);
[a9,b9]=find(a==8);
[a10,b10]=find(a==15);
[a11,b11]=find(a==9);
[a12,b12]=find(a==16);
[a13,b13]=find(a==14);

%Sum total of all the interaction energies
E2=1/(((a2-a1).^2+(b2-b1).^2).^0.5)+1/(((a3-a1).^2+(b3-b1).^2).^0.5)+1/(((a4-a3).^2+(b4-b3).^2).^0.5)+1/(((a6-a5).^2+(b6-b5).^2).^0.5)+1/(((a8-a7).^2+(b8-b7).^2).^0.5)+1/(((a9-a7).^2+(b9-b7).^2).^0.5)+1/(((a10-a8).^2+(b10-b8).^2).^0.5)+1/(((a12-a11).^2+(b12-b11).^2).^0.5)+1/(((a13-a4).^2+(b13-b4).^2).^0.5);
power=-(E2-E1);

%Boltzmann weight
Bwt=exp(power);

%Conditions of new conformation acceptance
%If Boltzmann weight is greater than 1 then new move is accepted
%if not accepted then generate a random no. and compare it with Boltzmann
%weight
if(Bwt>1)
    c=a;
else
    c=rand(1);
    if(Bwt>c)
        c=a;
    end
end

%Showing new accepted move
for b=1:16
    [X(b),Y(b)]=find(c==b);
end
plot(X,Y,'o-')

xlim([0,40]);
ylim([0,40]);

drawnow
end
