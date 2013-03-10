# encoding: utf-8

class Ending < Scene
  attr_reader :closed

  def initialize
    @bg_img = Image.load("images/ending.png")
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

	if Input.keyPush?(K_SPACE)
		require 'Win32API'

		shellexecute = Win32API.new('shell32.dll','ShellExecuteA',%w(p p p p p i),'i')
		shellexecute.call(0, 'open', 'https://twitter.com/intent/tweet?text=%e3%82%aa%e3%83%88%e3%82%b3%e3%83%80%e3%82%b1%e3%81%ae%e9%80%86%e8%a5%b2%20%e3%80%9c%e5%8d%b1%e6%a9%9f%e4%b8%80%e9%ab%aa%ef%bc%81%ef%bc%81%e3%83%88%e3%82%ad%e3%83%b2%e3%82%92%e6%95%91%e3%81%88%e3%80%9c%20%e3%82%b2%e3%83%bc%e3%83%a0%e3%82%b9%e3%82%b3%e3%82%a2%3a'+@score.to_s+';', 0, 0, 1)
	end
    Window.draw(0, 0, @bg_img)
    font = Font.new(100, "", {:weight=>true})
    Window.drawFont(120, 100, "スコアは", font, {:color=> [0, 0, 0]})
    Window.drawFont(270 - font.getWidth(@score.to_s) / 2, 200, @score.to_s, font, {:color=> [0, 0, 0]})
  end
end
