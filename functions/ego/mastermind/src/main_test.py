from lib.floo_network import MASTERMIND, FlooEvent
from lib.const_ints import CONST_INTS
from lib.scoreboard import OBJECTIVES, TEAMS
from lib.coords import Coords
from lib.vector import Vector3
from lib.consts import *
from room import Room


event = MASTERMIND
floo_event = FlooEvent(MASTERMIND)
initials = "MM"
select_all = event.select_all


# activating the structure blocks to save the rooms
activate_struct_save = Coords("107 4 82 96 4 82")

# filling the doors
fill_doors_north = Coords("49 8 37 105 6 37")
fill_doors_south = Coords("49 8 46 105 6 46")

# fills the buttons
fill_buttons_north = Coords("46 6 26 101 6 34")
fill_buttons_south = Coords("53 6 57 108 6 49")

# activates the structure blocks underneath the map to reset the rooms
activate_struct_reset = Coords("45 2 60 109 2 23")



room_size_north = Vector3(7, 5, 12)
room_size_south = Vector3(-7, 5, -12)

def relative(*coords):
    return Coords(*map(lambda x: "~" + str(x), coords))

def rotate_180(coords):
    coords = round(coords.vec.xz.rotate(180, radians=False))

dist_to_ans_north = relative(-5, 5, -12)
dist_to_ans_south = relative(5, 5, 12)

north_room = Coords("53 4 36")
south_room = Coords("46 4 47")

select_hallway = Coords("46 5 38 108 10 45").selector()

# difference of blocks between each room (+ 1)
room_difference = 11

# total number of rooms
total_rooms = 12

# block type that we are supposed to place our guess on
place_on = "minecraft:glass"

# how many blocks are between each guess (+ 1)
guess_difference = 2

# how many blocks are between the guessing bar and the stone button (+ 1)
guess_button_difference = 2


# each individual block that is avaliable
blocks = ["wool 14", "wool 5", "wool 9", "wool 2", "wool 6", "wool 1"]

# each block display name with their team name
blocks_disp = [("red", "MMred"), ("lime", "MMlime"), ("cyan", "MMcyan"), ("magenta", "MMmagenta"), ("pink", "MMpink"), ("orange", "MMorange")]

# total number of possible choices
blocks_total = len(blocks)

# number of guesses
total_guesses = 5

# number of blocks per guesses
blocks_per_guess = 4


rooms = {}

for num in range(1, (total_rooms // 2) + 1):
    position = (north_room.vec + Coords((num - 1) * room_difference, 0, 0).vec)
    selection = Coords(*position, *(position + room_size_south))
    room = Room(num, selection)
    rooms[num] = room

for num in range((total_rooms // 2) + 1, total_rooms + 1):
    position = south_room.vec + Coords(((num - 1) - total_rooms // 2) * room_difference, 0, 0).vec
    selection = Coords(*position, *(position + room_size_north))
    room = Room(num, selection)
    rooms[num] = room

# for room in map(str, rooms.values()):
#     print(room)


OBJECTIVES.new_str("""
    . _ .

    # Used on players to store their player state
    # Used on the Room Stand to calculate what to display on the EC board
    pl _ Player List

    # Used on items to change their entity data so they are proper placable wool
    # Used on players to temporarily set themselves to be used for validating the guess
    # Used on the Room Stand = 1 to temporarily see if their guess is in the proper order
    # Also used on the Room Stand = 2 to show that a guess has been successfully validated
    # Used on the White and Red clouds to count how many white/red there are in a guess
    # Used on the Repeating clouds to count the number of unique blocks in their guess
    cl _ Calculations
    st _ State

    # used on the host to see what is going on
    ec _ EC scoreboard

    # used on players and on the Room Stands
    # to specify what room id they are in
    rn _ Room Number

    # used on the Room Stand to store what guess is expected
    gn _ Guess Number

    # used on the Room Stand to store what guess has
    # been inputted by the player
    ign _ Guess Number Input

    # used on Guess clouds to store what block id was guessed at that area
    bi _ Block ID

    # Used on the Guess clouds and the Correct stands to
    # store what block id is correct at their position
    # Used on the Room Stand to show that the correct answer has been reached
    ca _ Correct Answer


    ra _ Repeated Answer
    na _ No Answer

    # rs _ Room Select
    # pa _ Predicted Answer
    # sd _ Sign Display
    # gc _ Guess Check
    # gl _ Guess Calc
    # it _ Item
    # op _ Options
    # rg _ Right Guess
    
""", initials=initials, display=event.full_name)

OBJECTIVES[initials].setdisplay("sidebar")
OBJECTIVES["MMec"].setdisplay("sidebar.team.white")

CONST_INTS.add_consts(-1)
    
TEAMS.new_str("""
    red
    color red
    
    lime
    color green
    
    cyan
    color dark_aqua
    
    magenta
    color dark_purple
    
    pink
    color light_purple
    
    orange
    color gold
    
    white Host Team
        color white

""", initials=initials, display=event.full_name)
