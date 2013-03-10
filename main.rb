require 'dxruby'

require_relative 'lib/scene'
require_relative 'lib/title'
require_relative 'lib/game'
require_relative 'lib/ending'
require_relative 'lib/map'
require_relative 'lib/moji'
require_relative 'lib/otokodake'
require_relative 'lib/otokodake_control'
require_relative 'lib/game_window_frame'
require_relative 'lib/game_main_frame'
require_relative 'lib/game_time_frame'
require_relative 'lib/game_score_frame'
require_relative 'lib/game_heart_frame'
require_relative 'lib/game_other_frame'
require_relative 'lib/game_combo_frame'
require_relative 'lib/game_window_frame_controller'
require_relative 'lib/op_control'
require_relative 'lib/op'
require_relative 'lib/opening'
require_relative 'lib/life'
require_relative 'lib/timer'
require_relative 'lib/gameover'

Window.width = 800
Window.height = 600

game = Game.new
opening = Opening.new
title  = Title.new
ending = Ending.new
gameover = Gameover.new

Scene.add_scene(:title,  title)
Scene.add_scene(:opening, opening)
Scene.add_scene(:game,   game)
Scene.add_scene(:ending, ending)
Scene.add_scene(:gameover, gameover)

Scene.set_scene(:title)

Window.loop do
  break if Input.keyPush?(K_ESCAPE) || ending.closed
  Scene.play
end
