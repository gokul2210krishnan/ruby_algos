a = [1,2,3,5,6,7,8]

def insert(arr,item,pos)
    tmp = arr[pos]
    arr[pos] = item
    arr.replace(arr[0..pos] + [tmp] + arr[pos+1..-1])
end
# print "#{a}\n"
p a
insert(a,4,3)
p a