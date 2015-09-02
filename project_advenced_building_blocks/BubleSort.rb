# only fixnum
def bubble_sort array
    size = array.length
    tmp = 0;
    swapped = 1
    while swapped != 0
        swapped = 0
        for i in 1...size
            if array[i-1] > array[i]
                tmp = array[i]
                array[i] = array[i-1]
                array[i-1] = tmp
                swapped = i
            end
        end
        size = swapped
    end
    p array
end
#You can put to this method array of strings and Fixnum
def bubble_sort_by array
    size = array.length
    tmp = 0;
    swapped = 1
    flag = 0
    while swapped != 0
        swapped = 0
        for i in 1...size
            if ((array[i].class == String) && (array[i-1].class == String))
                if yield(array[i-1], array[i]) > 0
                    tmp = array[i]
                    array[i] = array[i-1]
                    array[i-1] = tmp
                    swapped = i
                end
                flag =1
            else
                if array[i-1] > array[i]
                    tmp = array[i]
                    array[i] = array[i-1]
                    array[i-1] = tmp
                    swapped = i
                end   
                flag = 2
            end
        end
        size = swapped
    end
    p array
    p flag
end
bubble_sort([4,3,78,2,0,2])
bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length - right.length
end
bubble_sort_by([4,3,78,2,0,2]) do |left,right|
    left.length - right.length
end