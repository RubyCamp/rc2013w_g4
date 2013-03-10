# coding: UTF-8

class Director
  def initialize
        @op = Op.new
  end

  def play
    @op.scroll
    @op.draw
  end
end
