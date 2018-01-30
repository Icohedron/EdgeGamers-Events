from lib.container import Container
from lib.coords import Coords
from lib.general import output_cmd_list


class FlooNetwork(Container):
    """
    Stores the general commands used by the Floo Network for every event.

    The cmd methods are required for all events to properly function.
    """

    valid_options = {
        "pvp": ("true", "false"),  # FLpvp 0, 1
        "saturation": ("true", "false"),  # FLsat 0, 1
        "gamemode": ("adventure", "survival", "spectator"),  # FLgam 1, 2, 3
        "weather": ("clear", "rain", "storm"),  # FLwea 0, 1, 2
    }
    
    def __init__(self, event, **options):
        if not isinstance(event, Event):
            raise TypeError("The ID must be an Event type")
        self.event = event
        self.id = self.event.id
        self.options = {}

        for option, value in options.items():
            self.add_option(option, value)

    def add_option(self, option, option_value):
        if option not in FlooNetwork.valid_options:
            raise SyntaxError("Invalid option name '{option}' for the floo network".format(option=option))

        if option_value not in FlooNetwork.valid_options[option]:
            raise SyntaxError("Invalid option value for option '{option}' for the floo network: '{op_value}'".format(
                    option=option, op_value=option_value))

        self.options[option] = option_value

    def cmd_init(self):
        """
        Sets up the commands for the floo network
        """
        cmd_list = []

        set_stand_str = "@e[type=_armor_stand,FlooNetwork] {0} = {1}"

        # setting up the teleport id
        cmd_list.append(set_stand_str.format("FLtp", self.id))

        # setting up pvp options, defaults to false
        if "pvp" not in self.options or self.options["pvp"] == "false":
            cmd_list.append(set_stand_str.format("FLpvp", "0"))
        else:
            cmd_list.append(set_stand_str.format("FLpvp", "1"))

        # setting up the saturation options, defaults to true
        if "pvp" not in self.options or self.options["pvp"] == "true":
            cmd_list.append(set_stand_str.format("FLsat", "1"))
        else:
            cmd_list.append(set_stand_str.format("FLsat", "0"))

        # setting up gamemode, defaults to adventure
        if "gamemode" not in self.options or self.options["gamemode"] == "adventure":
            cmd_list.append(set_stand_str.format("FLsat", "1"))
        elif self.options["gamemode"] == "survival":
            cmd_list.append(set_stand_str.format("FLsat", "2"))
        else:
            cmd_list.append(set_stand_str.format("FLsat", "3"))

        # setting up weather, defaults to clear
        if "weather" not in self.options or self.options["weather"] == "clear":
            cmd_list.append(set_stand_str.format("FLwea", "0"))
        elif self.options["weather"] == "rain":
            cmd_list.append(set_stand_str.format("FLwea", "1"))
        else:
            cmd_list.append(set_stand_str.format("FLwea", "2"))

        # 
        cmd_list.append("@e[type=armor_stand,FlooNetwork,FLgam>=1] FLgac = 1")

        return output_cmd_list(cmd_list)

    def cmd_main(self, SA):
        """
        Used in the main loop to set everyone's floo network id value
        for spawning and teleportation
        """
        cmd_list = []
        cmd_list.append("@a[{SA}] FLid + 0").format(SA)
        cmd_list.append("@a[{SA},FLid=..-{id_calc}] FLid = {id}".format(SA, self.id+1, self.id))
        cmd_list.append("@a[{SA}] FLid=-{id_calc}.. FLid = {id}".format(SA, self.id-1, self.id))

    def cmd_term(self):
        """
        Resets all options for the floo network
        """
        cmd_list = []
        set_stand_str = "@e[type=_armor_stand,FlooNetwork] {0} = {1}"

        # Resets all options
        cmd_list.append(set_stand_str.format("FLtp", "0"))
        cmd_list.append(set_stand_str.format("FLpvp", "0"))
        cmd_list.append(set_stand_str.format("FLsat", "1"))
        cmd_list.append(set_stand_str.format("FLgam", "1"))
        cmd_list.append(set_stand_str.format("FLwea", "0"))

        # Sets the same game to 0
        cmd_list.append("@e[type=armor_stand,FlooNetwork,FLgam={0}] FLgam = 0".format(self.id))


class Event:
    id = 1
    members = []

    def __init__(self, name, color, coords, shortcut, id_start=None):
        """
        Args:
            name (str): Name that can be split up with ";" for different colors ("Royal; ;Rumble")
            color (str): Color given for the event name, can be set as a list of colors using ";" ("green;white;blue")
            coords(general.Coords): Teleport coordinates for the event
            shortcut (str): A lowercase shortcut given for the name
            id_start (int): An optional value to set the current event ID for distinguishing between different types of events
        """

        # Creates a unique integer ID value for each event class
        if id_start is None:
            Event.id = id_start

        self.id = Event.id
        Event.id += 1

        self.name = name.split(";")
        self.full_name = name.replace(";", "")
        self.colors = color.split(";")
        self.coords = coords
        self.shortcut = shortcut.split(";")
        self.display_coords = self.coords["xyz"]
        self.display_coords = str(self.coords)

        # checks whether the length of the color after splitting
        # is the length of the name after splitting
        if len(self.name) != len(self.colors):
            raise SyntaxError("Event {name} does not have the same number of color and name arguments".format(name=self.full_name))

        # Adds each event to the members list
        Event.members.append(self)


# Races
ICE_RACE = Event("Ice race", "aqua", Coords("49 36 -45 -90 2 6 2 7 34"), "ir")
SLOW_RACE = Event("Slow Race", "gray", Coords("75 7 -80 90 0"), "sr")
NETHER_RACE = Event("Nether Race", "red", Coords("73 7 -102 90 0"), "nr")
EVIL_RACE = Event("Evil Race", "gray", Coords("23 7 -133 -90 0"), "evilr")
DIAMOND_RACE = Event("Diamond Race", "aqua", Coords("218 18 -37 -90 0"), "dr")
EMERALD_RACE = Event("Emerald Race", "green", Coords("276 17 -96 90 0"), "er")
QUARTZ_RACE = Event("Quartz Race", "white", Coords("229 8 -157 -90 0"), "qr")
V1_8_RACE = Event("1.8 Race", "gold", Coords("242 26 -222 -90 0"), "18r")
EPIC_RACE = Event("Epic Race", "gold", Coords("424 12 -122 -90 0"), "epicr")
SALT_RACE = Event("Salt Race", "gray", Coords("467 8 -33 -90 0"), "saltr")
DEATH_RUN = Event("Death Run", "red", Coords("31 20 -240 -45 0"), "deathr")
DIRT_RACE = Event("Dirt Race", "gray", Coords("23 15 -189.0 -90 0"), "dirtr")
MYCELIUM_RACE = Event("Mycelium Race", "dark_purple", Coords("445 68 -669.0 -90 0"), "mr")
FROSTBURN_RUN = Event("Frostburn Run", "aqua", Coords("517 11 -827 90 0"), "fbr")
EVERCHANGING_RACE = Event("EverChanging Race", "yellow", Coords("460 3 -331 -90 0"), "ecr")

# Minigames
VIRUS_1 = Event("Virus 1", "yellow", Coords("-85 45 -241 -45 0"), "v1;virus1", id_start=100)
VIRUS_2 = Event("Virus 2", "yellow", Coords("-77 56 -85 -45 0"), "v2;virus2")
PVP_OLD_CTF = Event("PVP: Old CTF", "red", Coords("-268 49 -39 -90 0"), "pvp1;oldctf")
CAPTURE_THE_FLAG = Event("Capture; the ;flag", "red;white;blue", Coords("558 107 159.0 90 0"), "ctf")
THE_PIT_3 = Event("The Pit 3", "green", Coords("-105 25 200 -135 0"), "tp;tpl3")
SAND_TOMB = Event("Sand Tomb", "yellow", Coords("-250 25 18 -90 0"), "st")
ANVIL_DROP = Event("Anvil Drop", "green", Coords("-16 5 87 90 0"), "ad")
DEATH_PIT = Event("Death Pit", "red", Coords("-187 24 96 -90 0"), "dp")
RABBIT_BALL = Event("Rabbit; ;Ball", "red;white;blue", Coords("214 27 334 -90 0"), "rb")
MASTERMIND = Event("Mastermind", "gold", Coords("77 5 41 0 -15"), "mm")
PICTIONARY = Event("P;i;c;t;i;o;n;a;r;y", "light_purple;red;gold;yellow;green;dark_green;blue;dark_aqua;aqua;white", Coords("161 4 180 90 0"), "pc")
ROYAL_RUMBLE = Event("Royal; ;Rumble", "blue;white;dark_green", Coords("-103 19 482 -180 0"), "rr")
RABBIT_BALL = Event("Rabbit; ;Ball", "red;white;blue", Coords("224 24 334 -90 0"), "rb")

# Other
FLAWN = Event("Spawn", "dark_red", Coords("397 17 61 90 0"), "spawn", id_start=200)
FLAWNPOINT_SYSTEM = Event("Spawnpoint System", "yellow", Coords("348 4 114 -90 0"), "cmd")
TEAMFLEAK_TOKEN = Event("Teamspeak Token", "dark_aqua", Coords("549 20 42"), "tstoken")
MINIGAME_HUB = Event("The Minigame Hub", "green", Coords("329 24.065 171 90 0"), "mghub")
PVP_HUB = Event("The PVP hub", "light_purple", Coords("385 15 159 180 0"), "pvphub")
MASTERMIND_HUB = Event("The Mastermind Hub", "gold", Coords("329 24.065 154 90 0"), "mmhub")
RACE_HUB = Event("The Race Hub", "dark_aqua", Coords("329 24.076 137 90 0"), "racehub")