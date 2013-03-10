# To change this template, choose Tools | Templates
# and open the template in the editor.

class GameWindowFrame
  def initialize(x, y, width, height, filename, color, director)

    @x = x
    @y = y
    @width = width
    @height = height
    @filename = filename
    @color = color
    @director = director

    if filename == nil

      @image = Image.new(@width, @height, @color)
    else

      @image = Image.load(filename)
      end

    init
  end

  # 下位クラスでオーバーライド
  def init

  end

  # 下位クラスでオーバーライド
  def update

  end
end
