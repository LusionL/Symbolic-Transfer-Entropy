
function p=getp2(a,b,c,x,y,n)
 
    nn=0;
    for i=1:n-1
        if(x(i)==a&&x(i+1)==b&&y(i)==c)
            nn=nn+1;
        end
    end
    
            
    p=nn/(n-1);