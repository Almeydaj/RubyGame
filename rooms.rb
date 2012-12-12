class Rooms
  attr_reader :r_id, :description, :adjacent

  def initialize(params = {})       
        @r_id = params[:id] || 0
        @description = params[:desc] || "No description found"
        @adjacent = Hash.new
        params[:adj_rooms].each do |ar|
          self.add_adj(ar[:dir], ar[:id])
        end
  end

  def add_adj(direction, id)
    @adjacent[direction] = id
  end

  def add_description(description)
    @description = description
  end

  def show_adjacent
    puts @adjacent
  end

end

describe Rooms do

  before (:each)do
    @room1 = {:id         => 1, 
              :desc       => "Room 1", 
              :adj_rooms  => [{:dir => :west, :id => 4},
                              {:dir => :north, :id => 5}]
              }
  end

  it "knows its initial room" do
    
    @r = Rooms.new(@room1)
    @r.r_id.should eq 1
  end

  it "has a description" do
    @r = Rooms.new(@room1)
    #@r.add_description("You're in a room...")
    @r.description.empty?.should eq false
  end

  it "adds adjacent rooms" do
    @r = Rooms.new(@room1)    
    @r.add_adj("east", 2)
    @r.add_adj("down", 3)
    @r.adjacent.empty?.should eq false
    @r.adjacent.count.should eq 4
  end

# it "" do
#  end

end
