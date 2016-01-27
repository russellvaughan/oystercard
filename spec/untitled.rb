class Name
  attr_reader :name
  def initialize (name)
    @name = name
  end
end

name1 = Name.new "Reiss"

p name1.name