lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "emoji"
require "shargilo"
require "pry"

class Radiko
  def initialize(ideo)
    @index = Emoji::Index.new
    @signo = initialize_from_emoji(ideo)
    @signo = initialize_from_text(ideo) unless @signo
    unless @signo
      raise "Ne troveblas #{ideo}"
    end
    @bazo = @signo["name-eo"]
    @konstruita_vorto = @bazo
  end

  def o
    @konstruita_vorto = "#{@bazo}o" unless @konstruita_vorto.chars.last == "o"
    self
  end

  def a
    @konstruita_vorto = "#{@bazo}a" unless @konstruita_vorto.chars.last == "a"
  end

  def e
    @konstruita_vorto = "#{@bazo}e" unless @konstruita_vorto.chars.last == "e"
  end

  def i
    @konstruita_vorto = "#{@bazo}i" unless @konstruita_vorto.chars.last == "i"
  end

  def j
    @konstruita_vorto = "#{@bazo}oj" unless @konstruita_vorto.chars.last == "j"
  end

  def to_s
    "#{@konstruita_vorto}"
  end

  def valid?
    @bazo != nil
  end

  private

  def initialize_from_text(text)
    @index.find_by_name(text)
  end

  def initialize_from_emoji(emoji)
    @index.find_by_moji(emoji)
  end
end

pry.binding
