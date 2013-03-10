# encoding: utf-8

# 邪魔アイテムクラス
class Otokodake < Sprite

  # [window_width]
  #   Windowの横幅
  # [indow_height]
  #   Windowの縦幅
  # [filename]
  #   ファイル名
  def initialize(window_width, window_height, filename,scale_x,scale_y)

    @DEFAULT_IMG_WIDTH = 60;
    @DEFAULT_IMG_HEIGHT = 60;

    # 引数のファイル名から画像オブジェクトを生成
    enemy_img = Image.load(filename, nil, nil, rand(@DEFAULT_IMG_WIDTH), rand(@DEFAULT_IMG_HEIGHT))
    enemy_img.setColorKey([0, 0, 0])
    self.scale_x = scale_x
    self.scale_y = scale_y
    # 上位のクラスのコンストラクタを呼び出し
    super(rand(window_width-200 - enemy_img.width), rand(window_height - enemy_img.height), enemy_img)
  end

  def update
    self.x += @dir_x
    self.y += @dir_y
    unless (0 .. (Window.width-200 - self.image.width)).include?(self.x)
      @dir_x = -@dir_x
    end

    unless (0 .. (Window.height - self.image.height)).include?(self.y)
      @dir_y = -@dir_y
    end
  end

  def set_direction
    @dir_x = [1, -1, 2, -2].shuffle.first
    @dir_y = [1, -1, 2, -2].shuffle.first
  end

  def hit(obj)
    set_direction
  end
end
