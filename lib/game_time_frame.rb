# To change this template, choose Tools | Templates
# and open the template in the editor.


class GameTimeFrame < GameWindowFrame

  # 初期化処理
  def init

    @FONT_SIZE = 20
    @time_string = "Time:"
    @TIME_60S_MS = 60000 
  end

  # 更新
  def update

    Window.draw(@x, @y, @image)
  	font = Font.new(@FONT_SIZE, "", {:weight=>true})

  	
  	ms = (@TIME_60S_MS - @director.now_time) % 1000
    min = (@TIME_60S_MS - @director.now_time) / 1000 / 60
    sec = (@TIME_60S_MS - @director.now_time) / 1000 % 60
  	day = Time.gm(2001, 5, 20, 23, min, sec, ms * 1000)
  	day_string = day.strftime("%M:%S:%02L")
  	#Window.drawFont(@x + @width / 2 - font.getWidth(day_string) / 2, @y + 40, day_string, font)
    Window.drawFont(@x + 20, @y + @height / 2 - @FONT_SIZE / 2, @time_string, font, {:color=> [0, 0, 0]})
    Window.drawFont(@x + 100, @y + @height / 2 - @FONT_SIZE / 2, day_string, font, {:color=> [0, 0, 0]})
  end
end