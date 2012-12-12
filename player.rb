class Player
	attr_reader :room_id
	def initialize 	
		@room_id = 5
	end
	
	def move(direction)
    case direction
		when :n
			@room_id -= 3
    
    when :s
      @room_id += 3

    when :w
      @room_id -= 1

    when :e
      @room_id += 1
    end

	end

	def jump
		return true
	end

  def use(obj)
    if obj == :pull
      return false
    end

    if obj == :push
      return true
    end
  end

  def add(item)
    @inventory = []
    @inventory << item
    return @inventory.count
  end

end

describe Player do

  before(:each) do
    @p = Player.new
  end
	
	it "knows what room it's in" do
    @p.room_id.should eq 5
	end

	it "moves north" do
		@p.move(:n)
		@p.room_id.should eq 2
	end
	
	it "moves south" do
		@p.move(:s)
		@p.room_id.should eq 8
  end

  it "moves west" do
		@p.move(:w)
		@p.room_id.should eq 4
  end

  it "moves east" do
		@p.move(:e)
		@p.room_id.should eq 6
  end

  it "jumps" do
		@p.jump.should eq true 
	end

  it "pulls" do
    @p.use(:pull).should eq false
  end

  it "pushes" do
    @p.use(:push).should eq true
  end

  it "picks up" do
    @p.add(:item).should eq 1
  end
	
end
