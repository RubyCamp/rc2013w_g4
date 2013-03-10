# To change this template, choose Tools | Templates
# and open the template in the editor.

class GameScoreFrame < GameWindowFrame

  # 初期化処理
  def init

  	@FONT_SIZE = 20
    @score_string = "Score:"
  end

  # 更新
  def update
    
    Window.draw(@x, @y, @image)
    font = Font.new(@FONT_SIZE, "", {:weight=>true})
    Window.drawFont(@x + 20, @y + @height / 2 - @FONT_SIZE / 2, @score_string, font, {:color=> [0, 0, 0]})
  	Window.drawFont(@x + 20 + @width / 2 - font.getWidth(@director.score.to_s) / 2, @y + @height / 2 - @FONT_SIZE / 2, @director.score.to_s, font, {:color=> [0, 0, 0]})
  end
end