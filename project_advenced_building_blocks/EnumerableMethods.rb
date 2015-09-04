module Enumerable
  def my_each
    return enum_for(:my_each) unless block_given?

    # version 1
    i = 0
    while i < length
      yield self[i]
      i += 1
    end

    # version 2
    # 0.upto(length - 1) { |i| yield self[i] }

    self
  end
  
  def my_each_with_index
        
        return enum_for(:my_each_with_index) unless block_given?
        i = 0
        self.my_each do |x| 
            yield x, i 
            i+=1
        end
        self
  end
  
  def my_select
      return enum_for(:my_select) unless block_given?
      arr = []
      self.my_each do |x|
        if yield x
          arr << x
        end
      end
      return arr
  end


  def my_all?
        
    validation = true
    self.my_each do |x|
        if yield(x)
            validation = true
        else
            return validation = false
        end
    end
       return validation
  end
  
  def my_any?
        validation = false
        for i in self
            validation = yield i unless validation
        end
        validation
  end
  
  def my_none?
      validation = false
      for i in self
        validation = yield i if !validation 
      end
      !validation
  end

  def my_count
      quantity = 0
      for i in self
        if !block_given?
            quantity += 1
        elsif yield i
            quantity += 1
        end
      end
      quantity
   end
   #10, #13, #14
   def my_map(block = nil)
     arr = []
     flag = 0
     self.my_each do |i|
        if block_given? && block
          arr << (yield block.call(i))
          flag = 1
        elsif (block)
          arr << block.call(i)
          flag = 2
        elsif block_given?
          arr << yield(i)
          flag = 3
        end
        
      end
      return arr, flag
   end
   
   def my_inject(initial = nil)
     if block_given?
       if initial.nil?
          total = self[0]
          
          self.my_each {|x| total = yield(total,x)}
       else
          total = initial
          self.my_each {|x| total = yield(total,x)}
       end
     end
     total
   end
def multiply_els
    self.my_inject{|product, n| product * n}
  end
end
