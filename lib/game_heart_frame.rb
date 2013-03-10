# To change this template, choose Tools | Templates
# and open the template in the editor.


class GameHeartFrame < GameWindowFrame

  # 初期化処理
  def init

    @life_image = Image.load("./images/life_hyottoko.png")
  	@dead_image = Image.new( @life_image.width, @life_image.height, color=[0,0,0,0] )
  	
  	@lifes = Array.new
  	3.times do

  	  @lifes << Life.new(@life_image, @dead_image)
  	end
  end

  # 更新
  def update
    
    Window.draw(@x, @y, @image)

    @lifes.each_with_index do |life, index|
    	if @director.heart <= index
		    life.dead
		  else
		    life.recovery
		  end
		  Window.draw(@x + 200 / 6 + 200 / 3 * index - life.get_image.width / 2, 
        @y + @height / 2 - life.get_image.height / 2, life.get_image)
    end
  end
end
