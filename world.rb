require './rooms.rb'

class World
    
    attr_reader :player_room_id

    def initialize
      location1 = {:id         => 1, 
              :desc       => "Room 1", 
              :adj_rooms  => [{:dir => :west, :id => 4},
                              {:dir => :north, :id => 5}]
              }
      room = Rooms.new(location1)
      room.show_adjacent
    end

    def move_player(room_id)
      @player_room_id = room_id
    end

    def move_is_valid?(from, to)
      if from == 1      
        case to
        when 2
          return true
        when 3
          return true
        else 
          return false
        end
      end
    end

    def create_room(desc, adj)
      new_id = @Room.size() + 1
      @Room[new_id] = Rooms.new [{:id=>new,
                                  :desc=>desc,
                                  :adj=>adj}]            
    end

end

describe World do

  before (:each)do
    @world = World.new
  end

  it "moves player" do
      @world.move_player(1).should eq 1
  end      

  it "checks if move is valid" do
      @world.move_is_valid?(1,2).should eq true
  end

  it "creates rooms" do
      @world.create_room("you are in a room",  [2,3])
  end



end

