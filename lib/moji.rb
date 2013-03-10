# coding: utf-8
require "dxruby"

class Moji < Sprite
	def initialize(str,moji,director)
		@moji = moji
		@kachi_sound = Sound.new("./sound/bom.wav")
		@kachi_sound.setVolume(190)
		@aa_sound = Sound.new("./sound/aa.wav")
		@bakudan_image1 = Image.load("./images/bakudan.png")
		@bakudan_now = @bakudan_image1
		@finish_flag = false
		@clear_flag = false
		@director = director
		@bom_count = 0
		@die_flag = false
		@height = 40
		@count = 0
		@font = Font.new(40)
		@words = Array.new
		str.split("").each do |ch|
			@words.push([ch,@font,true,0])
		end
		@width = @bakudan_now.width*0.65*str.length
		@x,@y = (Window.width-200) * 0.5 - @width*0.5,(-2)*@height
		@text = str
		@BASE_MOJI_POINT = 100

	end	
	attr_accessor :text,:words,:count,:die_flag,:bom_count,:finish_flag,:clear_flag
	def ok
		p "HIT!!"
		current[2] = false
		@count+=1
		@kachi_sound.play
		@director.moji_count += 1
		self.update_score
	end
	def ng
		p "NO!!"
		@director.otokodakes.add_item(1)
		@director.combo = 0
		@aa_sound.play
	end
	def clear
		#@die_flag = true
		#@finish_flag = true
		@director.c_flag = true if @director.stage == 2
		@count = 0
		@director.combo += 1
		@clear_flag = true
	end
	def current
		@words[@count]
	end
	def check(ch)
		@clear_flag = false
		return if ch.nil?
		if(ch == current[0])
			ok
			clear if @count == @text.length
		else
			ng
		end
		p "#{ch}  #{current[0]}"
	end
	def out
		@director.heart -= 1
		p @director.heart
		@die_flag = true
		@director.combo = 0
	end
	def update
		if(!@die_flag)
			if(@y >= Window.height - @height)
				out
			else
				@y += 1
				i = 0
				@words.each do |word|
					if word[3] != 15
						if word[2]
							Window.draw(@x+i,@y,@bakudan_now)
							Window.drawFont(@x+i+@bakudan_now.width*0.2,@y+@bakudan_now.height*0.4,word[0],word[1])
						else
							Window.draw(@x+i,@y,@director.bom[word[3]])
							word[3]+=1 if word[3] != 15
						end
					end
					i += @bakudan_now.width*0.65
				end
				@finish_flag = true if @words[@text.length-1][3] == 15
				img = Image.new(@font.getWidth(@moji),40,[255,255,255])
				#Window.drawScale((Window.width-200)*0.5-Font.new(40).getWidth(@moji)*1,@y+@bakudan_now.height*0.5,@img,Font.new(40).getWidth(@moji)*0.01,0.6)
				Window.draw((Window.width-200)*0.5-@font.getWidth(@moji)*0.5,@y+@bakudan_now.height,img)

				#p (Window.width - 200)*0.5 - Font.new(40).getWidth(@moji)*0.5
				Window.drawFont((Window.width-200)*0.5 - Font.new(40).getWidth(@moji)*0.5,@y+@bakudan_now.height,@moji,Font.new(40),:color=>[0,0,0])
				#p (Window.width - 200)*0.5 - Font.new(40).getWidth(@moji)*0.5
			end
		else
			i = 0
			Window.drawScale(@x,@y,@director.bom[@bom_count],1.5,1.5)
			@words.each do |word|
				Window.draw(@x+i,@y,@director.bom[word[3]]) if word[3] < 15
				word[3]+=1
				i += @bakudan_now.width*0.65
			end
			@finish_flag = true if @words[@text.length-1][3] == 15
		end
	end

	def update_score

		# １文字打(100) * コンボ数 * ハート残り * 文字数
		@director.score += @BASE_MOJI_POINT * get_combo_value * @director.heart * @director.moji_count
	end

	def get_combo_value

		if @director.combo < 5
			return 1
		elsif @director.combo < 10
			return 2
		elsif @director.combo < 14
			return 3
		elsif @director.combo < 19
			return 4
		else
			return 5
		end
	end
end
