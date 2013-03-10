class Title < Scene
  def initialize
    @bg_img = Image.load("images/opening.png")
  end
  
  def init(*args)

  end

  def play
    Scene.set_scene(:opening) if Input.keyPush?(K_RETURN)
    Window.draw(0, 0, @bg_img)
  end
end
