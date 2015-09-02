class Stock
    
    def self.stock_picker(arr)
        possible = Array.new
        best = [0,0,0,0,0]
        arr.each_with_index do |x,i|
            arr.each_with_index do |y,j|
                if ((y-x > 0) && (i < j))
                   possible << [x,i,y,j,y-x] 
                end
            end
        end
        possible.each do |x|
            possible.each do |y|
                if ((x[4] > y[4]) && (x[4] > best[4]))
                    best = x
                end
            end
        end
        if best[4] == 0
            p "You lose money"
        elsif
        p "Buy #{best[1]} sell #{best[3]}"
        end
    end
end
Stock.stock_picker([17,3,6,9,15,8,6,1,10])
