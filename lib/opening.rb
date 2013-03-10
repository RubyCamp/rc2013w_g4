# coding: UTF-8

class Opening < Scene
  def initialize
        @op_control = Director.new
        @bg_img = Image.load("images/opening.png")

  end

  def init(*args)

  end
 
  def play
  	Window.draw(0, 0, @bg_img)
    @op_control.play
    Scene.set_scene(:game) if Input.keyPush?(K_RETURN)
    
  end


end