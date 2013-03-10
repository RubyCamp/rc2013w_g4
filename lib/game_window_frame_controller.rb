# To change this template, choose Tools | Templates
# and open the template in the editor.

class GameWindowFrameController

  def initialize(director)

    @director = director


    @game_frames = Array.new

    # 各フレームを初期化後配列に追加
    @main_frames = Array.new
    @main_frames << GameMainFrame.new(0, 0, 600, 600, "./images/tokiojo_1_of_3.png", [255, 0, 0], @director)
    @main_frames << GameMainFrame.new(0, 0, 600, 600, "./images/tokiojo_2_of_3.png", [255, 0, 0], @director)
    @main_frames << GameMainFrame.new(0, 0, 600, 600, "./images/tokiojo.png", [255, 0, 0], @director)

    @game_frames << @main_frames[@director.heart - 1]
    @game_frames << GameTimeFrame.new(600, 0, 200, 50, "./images/green.png", [255, 0, 255], @director)
    @game_frames << GameScoreFrame.new(600, 50, 200, 50, "./images/green.png", [0, 255, 0], @director)
    @game_frames << GameComboFrame.new(600, 100, 200, 50, "./images/green.png", [255, 255, 0], @director)
    @game_frames << GameHeartFrame.new(600, 150, 200, 50, "./images/green.png", [0, 0, 255], @director)
    @game_frames << GameOtherFrame.new(600, 200, 200, 400, "./images/rule.png", [255, 255, 0], @director)
  end
  

  def update

    self.update_main_frame
    @game_frames.each { |game_frame| game_frame.update  }
  end

  def update_main_frame

    @game_frames[0] = @main_frames[@director.heart - 1]
  end
end
