# Killer facts about triangles AWW YEAH
class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @side1_sq = @side1**2
    @side2_sq = @side2**2
    @side3_sq = @side3**2
  end

  def equilateral?
    side1 == side2 && side2 == side3
  end

  def isosceles?
    [side1, side2, side3].uniq.length == 2
  end

  def scalene?
    equilateral? || isosceles? ? false : true
  end

  def recite_facts
    print_triangle_type
    print_angles
  end

  def print_triangle_type
    puts 'This triangle is equilateral!' if equilateral?
    puts 'This triangle is isosceles! Also, that word
        is hard to type.' if isosceles?
    puts 'This triangle is scalene and mathematically boring.' if scalene?
  end

  def print_angles
    angles = calculate_angles
    puts 'The angles of this triangle are ' + angles.join(',')
    puts 'This triangle is also a right triangle!' if angles.include? 90
    puts ''
  end

  def calculate_angles
    angles = %w(a b c)

    result = []

    angles.each do |angle|
      result << radians_to_degrees(sides_to_radians(angle))
    end
    result
  end

  def sides_to_radians(angle)
    case angle
      when 'a' then Math.acos(angle_a_cosine)
      when 'b' then Math.acos(angle_b_cosine)
      when 'c' then Math.acos(angle_c_cosine)
      else 'Invalid'
    end
  end

  def angle_a_cosine
    (@side2_sq + @side3_sq - @side1_sq) / (2.0 * @side2 * @side3)
  end

  def angle_b_cosine
    (@side1_sq + @side3_sq - @side2_sq) / (2.0 * @side1 * @side3)
  end

  def angle_c_cosine
    (@side1_sq + @side2_sq - @side3_sq) / (2.0 * @side1 * @side2)
  end

  def radians_to_degrees(rads)
    (rads * 180 / Math::PI).round
  end
end

triangles =[
    [5, 5, 5],
    [5, 12, 13],
    [1, 2, 1],
]

triangles.each do |sides|
  tri = Triangle.new(*sides)
  tri.recite_facts
end
