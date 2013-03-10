# encoding: utf-8

class GameComboFrame < GameWindowFrame

  # 初期化処理
  def init

  	@FONT_SIZE = 20
    @combo_string = "Combo:"
  end

  # 更新
  def update
    
    Window.draw(@x, @y, @image)
    font = Font.new(@FONT_SIZE, "", {:weight=>true})
    Window.drawFont(@x + 20, @y + @height / 2 - @FONT_SIZE / 2, @combo_string, font, {:color=> [0, 0, 0]})
  	Window.drawFont(@x + 20 + 100, @y + @height / 2 - @FONT_SIZE / 2, @director.combo.to_s, font, {:color=> [0, 0, 0]})
  
  end
end