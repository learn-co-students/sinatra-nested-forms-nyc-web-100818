class Ship
  def self.form_attributes
    %w(name type booty)
  end

  # RUBY IS CRAZY - send whaaa
  self.form_attributes.each{|attribute| self.send(:attr_accessor, attribute) }

  @@all = []

  def initialize(params)
    self.class.form_attributes.each do |attribute| 
      self.send("#{attribute}=", params[attribute])
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all = []
  end
end