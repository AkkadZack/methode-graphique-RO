Function [max1]=Maxb(b[n])
    max1=0;
for i=1:n
    if max1<b(i)
        max1=b(i);
    end
end