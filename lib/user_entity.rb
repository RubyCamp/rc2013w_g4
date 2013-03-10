# To change this template, choose Tools | Templates
# and open the template in the editor.

class UserEntity

  attr_accessor :score, :hart, :now_time, :combo_length
  def initialize(score, heart, now_time, combo_length)

    @score = score
    @heart = heart
    @DEFAULT_HAERT = heart
    @now_time = now_time
    @combo_length = combo_length
  end

  # ハートの値を回復します
  def heart_recovery

    if @DEFAULT_HAERT <= @heart
      return
    end

    @heart += 1
  end

  # ハートを１つ減少させます
  def heart_dead

    if @heart <= 0

      return
    end

    @heart -= 1
  end

end