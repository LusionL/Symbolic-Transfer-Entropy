function p=getp3(a,b,x,y,n)
 
    nn=0;
    for i=1:n
        if(x(i)==a&&y(i)==b)
            nn=nn+1;
        end
    end
    
            
    p=nn/(n-1);