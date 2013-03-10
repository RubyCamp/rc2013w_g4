# To change this template, choose Tools | Templates
# and open the template in the editor.

class GameMainFrame < GameWindowFrame

  # 初期化処理
  def init

  end

  # 更新
  def update
    
    Window.draw(@x, @y, @image)
  end
end
