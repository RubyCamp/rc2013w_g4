class Scene
  @@scenes = {}
  @@current_scene_name = nil

  def self.add_scene(name, obj)
    @@scenes[name.to_sym] = obj
  end

  def self.set_scene(scene_name, *args)
    @@current_scene_name = scene_name.to_sym

    @@scenes[@@current_scene_name].init(args.join(","))
  end

  def init(*args)

  end

  def self.play
    @@scenes[@@current_scene_name].play
  end
  def self.delete_scene(scene_name)
    @@scenes.delete(scene_name.to_sym)
  end
end
