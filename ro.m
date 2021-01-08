%% saisie des parametres%%
n=input('le nombre de contraintes =');
 
for i=1:n
    
    a(i,1)=input('entrez le coef de x    ');
    a(i,2)=input('entrez le coef de y    ') ;
    ineg(i)=input('le type d inegalite <,> ou =     ','s');
    b(i)=input ('entrer la deuxieme cote d inegalite   ');
end
  disp(['donnez les coefficient de la fonction objectif'])
  x1=input('entrez le coef de x  ');
  x2=input('entrez le coef de y  ');
  disp(['sagit il d un probleme de minimisation ou de maximisation'])
  optim=input('si Max entrez 1 si Min entrez 0   ');
      %% definir l'intervalle de variation de x pour plus de lisibilite de graphe%%
max1=0; 
for i=1:n
    if max1<b(i)
        max1=b(i);
    end
end
x=linspace(-20,2*max1);

  % le plot de la fonction objectif % 
  hold on
plot(x,(-(x1/x2)*x),'g')    
xlabel('x');
ylabel('y');
title ('représentation graphique de la methode graphique');

     %% representation des droites des contraintes%%
     max=1 ; min=1;
for i=1:n
    b1=b(i);
    a2=a(i,2);
    a1=a(i,1);
    if a2~=0
    y2=(b1/a2)-(a1/a2)*x;
    plot(x,y2,'b','linewidth',1)
    
    else
        y2=0
        plot(b1/a1,y2,'b','linewidth',1)
    end
end
axis([-20 2*max1 -20 100]);
for x2=-20:5*max1
for i=1:n
    
        a1=a(i,1)/a(i,2);
        y=-a1*x2+b(i)/a(i,2);
        b2=-(1/a1)*x2+y;
        if min>y
            min=y;
        end
        if max<y
            max=y;
        end
end
end
 
 
for x2=-20:5*max1
for i=1:n
    if a(i,1)~=0 && a(i,2)~=0
        a1=a(i,1)/a(i,2);
        y=-a1*x2+b(i)/a(i,2);
        b2=-(1/a1)*x2+y;
        
        
       
        if ineg(i)=='<'
            x1=x2:5*max1;
            y1=(1/a1)*x1+b2;
            plot(x1,y1,'m')
        end
        if ineg(i)=='>'
            x1=-20:x2;
            y1=(1/a1)*x1+b2
            
    
            plot(x1,y1,'m')
            
        end
    end
end
end
for i=1:n
    if(a(i,1)==0)
        if ineg(i)=='<'
            for x2=-20:5*max1
               
                y=b(i)/a(i,2):10*max1;
                plot(x2,y,'m*')
            end
        end
        if ineg(i)=='>'
             for x2=-20:5*max1
                
                y=min:b(i)/a(i,2);
                plot(x2,y,'m*')
             end
        end
    end
    if(a(i,2)==0)
        if ineg(i)=='<'
            for y=-20:max
                
                x2=b(i)/a(i,1):5*max1;
                plot (x2,y,'m*')
            end
        end
        if ineg(i)=='>'
             for y=-20:max
                
                x2=-20:b(i)/a(i,1);
                plot (x2,y,'m*')
             end
        end
    end
end
 


