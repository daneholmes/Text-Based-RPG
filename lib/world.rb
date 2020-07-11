require 'matrix'

module FQ
    def world_descriptions
    
        world_descriptions = [
        # World Column Y = 1
            [
                "You find yourself on the shores of a small, densely planted, tropical island. Perhaps this island could make an excellent hideout for smuggled goods?",    
                "You find yourself in a small but well equipt wooden boat. Around you, the sea stretches for miles. The sun shines down, and the waves are calm. Luckily, you are not afraid of the ocean's deepness because when you look over and down into the depths, all you can see is blackness. Once in a while, you see a great shape moving in the abyss of the dark blue ocean.",
                "You are sitting in a small wooden boat when suddenly the biggest turtle you have ever seen rises from the depths to swim next to your ship. You can tell it's ancient due to the many scars on the turtle's shell. After a while, it appears that the turtle is definitely following you.",
                "You find yourself in the midst of what must be 50 fishing boats. Men on each ship are working hard to hoist up heavy nets filled with tons of fish. They are so busy fishing that they ignore you in your little raft.",
                "You are sitting in your boat. There is no wind, and the ocean is completely flat. The only waves are the ones made by your paddles as you move across the glass ocean."
            ],
        # World Column Y = 2
            [
                "There is only the deep blue ocean for as far as the eye can see. Occasionally you see the splash of a fish as it jumps out of the water. Or, sometimes, the fins of dolphins as they play in the waves.",
                "You and your tiny boat are caught in the largest storm you have ever experienced. If you know anything about storms, you could safely call it a  hurricane. The enormous waves toss your boat like a toy. Lighting cracks in the sky and provides you with your only source of light. Suddenly water starts filling up your boat almost as fast as you can bail it out.",
                "You sit on a beach looking out as the waves gently fall on the sand, washing up shells and sticks. The sun is slowly sinking over the waves. There is a gentle breeze, and the stars are just starting to show.",
                "You are standing on a calm beach. Under your toes, you feel the finest, softest sand you have ever touched. It is pure white and almost sparkles in the noonday sunlight.",
                "You are in the center of the desert. But it is not a forsaken one. Around you, birds fly, snakes slither from rock to rock, and mice dive down into their tunnels to avoid the snakes. Everywhere the desert is full of life as the blooming cactuses and aloe plants scattered around suggest."
            ],
        # World Column Y = 3
            [
                "You are in a shallow part of the ocean. The sunlight appears to pierce the ocean's blueness nearly to the floor. Surrounding you are countless schools of small, colorful fish.",
                "You find yourself on a warm and inviting beach on the shore of a vast ocean. The sand is fine and white. Around you, colorful shells lay undisturbed in the sand. Seagulls fly overhead diving to catch fish and small crabs for lunch.",
                "You are standing in the middle of the plains. A small farm—long ago abonded—stands in front of you. The house is starting to fall, and all of the glass is broken. Where the fields once were, there is now grass and wildflowers. Mice scurry among the fallen daily objects on the floor.",
                "You are standing in among a field of very dry grass. Although the grass is a dull yellow color, it is still alive. Around you, there are the trunks of long-dead, and now bare trees. The owls that now live inside them fly around at night.",
                "You are standing in a typical grassland. The grass is yellow, green, and about knee-high. It is so windy that you are almost gusted away. The grass is whipping around wildly in the wind, and some of the trees have fallen over. All of the animals must be in their homes because you do not see any."
            ],
        # World Column Y = 4
            [
                "The ocean is serene here as you appear to be in a bay. There are schools of fish swimming under the gentle waves. Nearby are a few small fishing boats.",
                "You are at the shore of a bay. On the sand, crabs walk around, and turtles warm in the sun. Out towards the ocean, you see a fishing boat or two.",
                "You are standing in the middle of endless grass and small, puffy, purple flowers. Around you, bees fly from flower to flower. High in the nearby trees, there are dozens of hives. Luckily, none of the bees seem to notice you.",
                "You are standing in a small town. Around it is a sturdy wooden wall. Small shacks lie dotted randomly throughout the village. The huts are all old and made of crumbling plaster and stone. In the center of the town is a solid stone building with two floors. Horses are tied to a fence outside of it.",
                "A tornado is tearing the earth up about five miles away from you and throwing debris up into the sky. The clouds are dark and gray, letting no light, though. Lighting illuminates the clouds every couple of seconds."
            ],
        # World Column Y = 5
            [
                "You find yourself on a sandy ocean shore. Waves gently lap against the sand where palm trees grow, and the movement of wildlife is ceaseless. However, you see no people.",
                "You are standing in knee-high grass. Around you, the plains stretch out for miles. Flowers are blooming, and bugs jump, fly, and chirp seemingly looking through the grass for a home. Trees and the cool shade they provide is rare around here. Occasionally you see a herd of wild horses aimlessly roaming these grasslands.",
                "You are on top of a small hill overlooking other slightly shorter hills. They are overgrown with grass and flowers.",
                "You are standing in the middle of a fenced-in pasture. Around you, a few horses and cows stand eating and relaxing. Apple trees planted to form a shelterbelt on the outside of the fence are nearly ripe.",
                "You are standing at the edge of a ripe, golden, hayfield. The hay grows taller than you can see and so dense that you can only see for a few rows before all you can see is yellow slowly moving in the wind."
            ]
        ]
        
    end
end

def room
    puts FQ::world_descriptions[$x][$y]
    while true
        prompt; next_move = gets.chomp
        if next_move == "help"
            help; prompt; next_move = gets.chomp
        end
        if next_move == "look"
            room()
        elsif next_move == "north" && $y >= 1
            $y = $y - 1
            room()
        elsif next_move == "north" && $y == 0
            puts "It is impossible to move further north!".light_yellow
        
        elsif next_move == "south" && $y <= 3
            $y = $y + 1
            room()
        elsif next_move == "south" && $y == 4
            puts "It is impossible to move further south!".light_yellow
        
        elsif next_move == "east" && $x <= 3
            $x = $x + 1
            room()
        elsif next_move == "east" && $x == 4
            puts "It is impossible to move further east!".light_yellow
        
        elsif next_move == "west" && $x >= 1
            $x = $x - 1
            room()
        elsif next_move == "west" && $x == 0
            puts "It is impossible to move further west!".light_yellow
        
        elsif next_move == "quit"
            Process.exit
        elsif next_move == "clear"
            puts `clear`
            room()
        else
            puts "Sorry, that is not an option."
        end
    end
end