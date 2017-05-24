class Zombie
@@horde = []
@@plague_level = 10
@@max_speed = 5
@@max_strength = 8
@@default_speed = 1
@@default_strength = 3

  def initialize(speed, strength)
    if speed > @@max_speed
        speed = @@default_speed
    else
      @speed = speed
    end
    if strength > @@max_strength
      strength = @@default_strength
    else
      @strength = strength
    end
  end

  def self.all
    @@horde
  end

  def self.spawn
    Random.rand(@@plague_level + 1).times do
      new_zombie = Zombie.new(Random.rand(1..5), Random.rand(3..8))
      @@horde << new_zombie
    end
  end

  def self.increase_plague_level
    @@plague_level += Random.rand(2)
  end

  def self.some_die_off
    Random.rand(10).times do
    @@horde.delete_at(rand(@@horde.length))
    end
    @@horde
  end

  def self.new_day
    Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plague_level
  end

  def encounter
    puts "You encounter a Zombie!"
    if outrun_zombie?
      puts "You manage to escape unscathed with you abysmal speed stat."
    else
      if survive_attack?
        zombie = Zombie.new(@@default_speed, @@default_strength)
        puts "You survived the attack by turning into a zombie. Congratulations."
      else
        puts "You have been slain by the zombie! How unmanly."
      end
    end
  end

  def outrun_zombie?
    your_speed = Random.rand(@@max_speed)
    if your_speed > @speed
      true
    else
      false
    end
  end

  def survive_attack?
    your_strength = Random.rand(@@max_strength)
    if your_strength > @strength
      true
    else
      false
    end
  end
end
Zombie.spawn
Zombie.new_day
puts Zombie.all.inspect

zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]

zombie1.encounter
zombie2.encounter
