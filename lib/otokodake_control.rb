# To change this template, choose Tools | Templates
# and open the template in the editor.
# encoding: utf-8
#
# 邪魔アイテムコントロールクラス
class OtokodakeControl

  attr_reader :objects

  # [size]
  #   サイズ
  # 初期サイズを指定して邪魔アイテムを生成
  def initialize(size, filename,scale_x,scale_y)
    
    @imagef = filename   
    @scalex = scale_x
    @scaley = scale_y
    @objects = []

    size.times do
      enemy = Otokodake.new(Window.width, Window.height, @imagef,scale_x,scale_y)
      enemy.set_direction
      @objects << enemy
    end
  end

  # [size]
  #   サイズ
  # 邪魔アイテム追加
  def add_item(size)

    size.times do
      enemy = Otokodake.new(Window.width, Window.height, @imagef,@scalex,@scaley)
      enemy.set_direction
      @objects.push(enemy)
    end
  end

  # [size]
  #   サイズ
  # 邪魔アイテム削除
  def delete_item(size)

    size.times do
      objects.shift
    end
  end
end
