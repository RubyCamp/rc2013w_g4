class Game < Scene
attr_accessor :bom, :c_flag, :stage, :heart, :otokodakes, :combo, :now_time, :score, :moji_count
  def initialize

    @now_time = 0
    @TIME_60S_MS = 60000 
    @timer_start_flag = false
    # @timer.schedule(1)
    # @timer.start
    @bom = Image.loadToArray("./images/bom.png",5,3)
    @c5_sound = Sound.new("./sound/5.wav")
    @c10_sound = Sound.new("./sound/10.wav")
    @c15_sound = Sound.new("./sound/15.wav")
    @c20_sound = Sound.new("./sound/20.wav")
    @yoshi_sound = Sound.new("./sound/yoshi.wav")
    @key_map = {}    # key-char Hash
    @c_flag = false  # clear flag
    @tmp = ""          # char tmp for Repeat
    @otokodakes = OtokodakeControl.new(10, "./images/kurahashi_dake.png",1,1)
    @nozakadakes = OtokodakeControl.new(0,"./images/nozaka_dake.png",0.7,0.7)
    
    @stage = 0
    @heart = 3
    @combo = 0
    @score = 0
    @moji_count = 0
    #key-char Hash generate
    ("A".."Z").each{|k| @key_map[Object.const_get("K_#{k}")] = k}
    @mojis = Array.new
    odai = Array.new
    @odai = parse_data("./data/stage01.txt")
    @game_controller = GameWindowFrameController.new(self)
    @timer = Timer.new(Time.now)

  end

  def init(*args)

  end

  def play
    @now_time = @timer.get_base_to_now_time

    if Input.keyPush?(K_SPACE) || @now_time >= @TIME_60S_MS
      Scene.set_scene(:ending, @score) 
      return
    end

    if heart == 0 || Input.keyPush?(K_RETURN)
      Scene.set_scene(:gameover, @score) 
      return
    end
    
    self.timer_start if !@timer_start_flag
    
    add_moji if (@now_time/1000).modulo(5) == 0 && (@now_time/1000) != @pre_time
    @pre_time = @now_time/1000
    # self.timer_start if !@timer_start_flag 
    @game_controller.update
    inp = input_key
    if !@mojis.empty?
      @mojis[0].check(inp)
      @mojis.each do |moji|
         combo_check if moji.clear_flag
   	 moji.update
      end
      #@mojis.delete_at(@stage) if @mojis[@stage].finish_flag
      @mojis.shift if @mojis[0].finish_flag 
    end
    Window.drawFont(100,200,"CLEAR!",Font.new(40)) if @c_flag
    Sprite.update(@otokodakes.objects)
    Sprite.check(@otokodakes.objects)
    Sprite.draw(@otokodakes.objects)
    Sprite.update(@nozakadakes.objects)
    Sprite.check(@nozakadakes.objects)
    Sprite.draw(@nozakadakes.objects)
  end
  def  combo_check
    case @combo
    when 5
	s = @c5_sound
	@nozakadakes.add_item(1)
    when 10
	s = @c10_sound
	@nozakadakes.add_item(1)
    when 15
	s = @c15_sound
	@nozakadakes.add_item(1)
    when 20
	s = @c20_sound
	@nozakadakes.add_item(1)
    else
	s = @yoshi_sound
    end
    s.play  
  end
  def add_moji
    odai = @odai.shift
    @mojis.push(Moji.new(odai[0],odai[1],self))
  end
  def input_key
	inp = @key_map[Input.keys[0]]
	if @tmp != inp
		#@str.concat inp if !inp.nil?
		@tmp = inp
		return inp.downcase if !inp.nil?
	end
  end

  def del?
	Input.keyPush?(K_BACKSPACE)
  end	
  
  def parse_data(filename)
    mojis = Array.new
    moji = Array.new
    f = open(filename)
    f.each do |line|
      moji.push(line.split(",")[0])
      moji.push(line.split(",")[1])
      mojis.push(moji.clone)
      moji.clear
    end 
    mojis   
  end

  def timer_start

    @timer = Timer.new(Time.now)
    @timer_start_flag = true
  end
end
