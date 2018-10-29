class Pirate
  def self.form_attributes
    %w(name weight height)
  end

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

end