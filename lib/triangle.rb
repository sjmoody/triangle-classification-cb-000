class Triangle
  attr_accessor :side1, :side2, :side3, :kind

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if @side3 < 0 || (@side1 + @side2 <= @side3) || (@side2 + @side3 <= @side1) || (@side1 + @side3 <= @side2) || (@side1 <= 0 || @side2 <= 0 || @side3 <= 0)
      raise TriangleError
    else

    # if (@side1 + @side2 < @side3) || (@side2 + @side3 < @side1) || (@side1 + @side3 < @side1) || (@side1 <= 0 || @side2 <= 0 || @side3 <= 0)
    #   begin
    #     raise TriangleError
    #   rescue TriangleError => error
    #     puts error.message
    #   end
    # else
      if @side1 == @side2 && @side2 == @side3
        @kind = :equilateral
      elsif (@side1 == @side2 && @side2 != @side3) || (@side2 == @side3 && @side1 != @side3) || (@side1 == @side3 && @side2 != @side3)
        @kind = :isosceles
      elsif (@side1 != @side2 && @side1 != @side3 && @side2 != @side3)
        @kind = :scalene
      end
    end
  end
end

class TriangleError < StandardError
  def message
    "this triangle is not valid.  The sum of the lengths of any two sides of a triangle always exceeds the length of the third side. This is a principle known as the triangle inequality."
  end
end
