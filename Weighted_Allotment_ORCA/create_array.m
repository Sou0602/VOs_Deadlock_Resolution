function list = create_array(n,arr,i)
list = [];
if i == n+1
    list = arr;
    return list
end

    
arr(i) = 0 ;
create_array(n,arr,i+1);

arr(i) = 1 ;
create_array(n,arr,i+1);

end

