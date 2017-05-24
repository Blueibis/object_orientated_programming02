class Vampire
@@vampires = []
attr_accessor :drank_blood_today, :in_coffin
attr_reader :name, :age
  def initialize(name, age)
    @name = name
    @age = age
    @drank_blood_today = true
    @in_coffin = true
  end

  def self.create(name, age)
    new_vampire = Vampire.new(name, age)
    @@vampires << new_vampire
    new_vampire
  end

  def self.coven
    @@vampires
  end

  def go_home
    @in_coffin = true if @in_coffin == false
    end

  def drink_blood
    @drank_blood_today = true if @drank_blood_today == false
  end

  def self.sunset
    puts "The Sun sets"
    @@vampires.each do |vampire|
      vampire.drank_blood_today = false
      vampire.in_coffin = false
    end
  end

  def self.sunrise
    puts "A new day dawns"
    @@vampires.each do |vampire|
      if vampire.drank_blood_today == false && vampire.in_coffin == false
        @@vampires.delete(vampire)
        puts "#{vampire.name} did not survive the night. They lived #{vampire.age} years"
      else
        puts "#{vampire.name} returns in bloody health"
      end
    end
  end

end

mary = Vampire.create("Countess Mary Blodd", 675)
marcus = Vampire.create("Scion Marcus Aurelius", 1203)
frederic = Vampire.create("Youngling Frederic", 42)
puts Vampire.coven.inspect
Vampire.sunset
marcus.drink_blood
mary.go_home
puts marcus.inspect
puts mary.inspect
puts frederic.inspect
Vampire.sunrise
puts Vampire.coven.inspect
