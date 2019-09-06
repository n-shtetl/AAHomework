class Stack
    def initialize
        @array = []
    end

    def push(el)
        @array << el
    end

    def pop
        @array = @array[0...-1]
    end

    def peek
        @array[-1]
    end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end
end

class Map
    attr_accessor :size, :map, :altered
    def initialize
        @map = []
        @altered = false
    end

    def size
        @size = @map.length
    end

    def set(key, val)
        @altered = false
        if @map.empty?
            @map << [key,val]
        end
        (0...@size).each do |i|
            if @map[i][0] == key
                @map[i][1] = value
                @altered = true
            end
        end
        if !@altered
            @map << [key, val]
        end
    end
end