# encoding: utf-8

class Gameover < Scene

  def initialize
    @bg_img = Image.load("images/tokiojo_gameover.png")
  end

  def init(*args)
    @score = args[0]
  end

  def play

  	if Input.keyPush?(K_RETURN)
  		Scene.delete_scene(:game)
  		game = Game.new
		  Scene.add_scene(:game, game)

	    Scene.set_scene(:game)
	end

    Window.draw(0, 0, @bg_img)
  end

end