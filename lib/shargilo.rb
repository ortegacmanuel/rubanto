class Object
  def method_missing(name, *args, &block)
    str_name = name.to_s
    super unless %w[kor ❤].include? str_name

    object = Radiko.new(str_name)
    object
  end
end
