

function p=getp1(a,b,x,n)
 
    nn=0;
    for i=1:n-1
        if(x(i)==a&&x(i+1)==b)
            nn=nn+1;
        end
    end
    
            
    p=nn/(n-1);