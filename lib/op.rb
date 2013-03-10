# coding: UTF-8

class Op
  attr_accessor :op_x, :op_y, :op_img, :view_port

  def initialize
    @scroll_speed = -0.8  # マップのスクロールスピード
    @op_img = Image.load("images/op.png")
    @op_x = 0
    @op_y = 0
    update_view_port

    
  end

  def update_view_port
    if @op_img.height - @op_y >= Window.height
      @view_port = @op_img.slice(@op_x, @op_y, Window.width, Window.height)
      @view_port_rest = nil
    else
      @view_port = @op_img.slice(@op_x, @op_y, Window.width, @op_img.height - @op_y)
      @view_port_rest = @op_img.slice(@op_x, 0, Window.width, Window.height - (@op_img.height - @op_y))
    end

    # 次のフレーム描画時に、現在のview_portオブジェクトを破棄する指定
    # ※ これが無いと比較的大きめの画像オブジェクトがGCされるまで毎秒60回生成され続け、
    #    パフォーマンスを圧迫する
    @view_port.delayed_dispose
    @view_port_rest.delayed_dispose if @view_port_rest
  end

  def scroll
    @op_y -= @scroll_speed
    @op_y = @op_img.height - @scroll_speed if @op_y < 0
    update_view_port
  end

  def draw
    Window.draw(0, 0, @view_port)
    if @view_port_rest
      Window.draw(0, @view_port.height, @view_port_rest)
    end
  end

 end
