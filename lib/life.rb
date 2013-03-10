# encoding: utf-8

class Life

  def initialize(life_image, dead_image)

  	@life_image = life_image
  	@dead_image = dead_image
  	@life_flag = true
  end

  def get_image

  	if @life_flag
      return @life_image
    else
      return @dead_image
    end
  end
  
  def dead
  	@life_flag = false
  end

  def recovery
  	@life_flag = true
  end

end
