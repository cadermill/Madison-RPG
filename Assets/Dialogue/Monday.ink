-> start

=== start ===
// Roommate rushes out.
"Dude, how are you JUST NOW waking up? 
Didn't you say you had that one class in Mosse like... right now?
Whatever, I'm running late too. See ya!"

// What does the player click on?
-> END

// The question for the player to consider (not a choice in the Ink file):
// The player can investigate the door, desk, or phone.

=== door ===
Clicking leads to map
-> map

=== desk ===
// Screen switches to POV of you sitting at a desk with a laptop, your phone, and a notebook.
// Clickable items: laptop or notebook...
"You decide to study. You open Canvas...
Wouldn't hurt to get ahead on some readings right?"

...
30 min later...
Got one reading assignment done for next week!
//+1 to Completely Average Path
//+1 action variable

// What does the player do?
-> END

// The question for the player to consider:
// The player can Keep Studying, look at their phone, or examine the Printed Syllabus, or Leave.

=== phone ===
// Screen switches to POV of you holding your phone.
"You pick up your phone"
FLASH
"It's been 2 hours. You've spent them scrolling consuming reels that you don't even remember anymore."
//+1 variable to Burnt Out Path
//+1 action variable

// What does the player do?
-> END

// The question for the player to consider:
// The player can Keep scrolling, or Leave.

=== Keep_Studying ===
"Wow... at this rate, you'll be ahead on readings till midterms!"
1 hour later...
Alright, maybe not. I got two readings done.
Your motivation dips.
//+1 to burnt out path
//+1 action variable
-> Leave

=== Leave ===
// Screen returns to dorm room
-> dorm_room

=== dorm_room ===
// What does the player click on?
-> END

// The question for the player to consider:
// The player can look at the phone, desk, door, Trash Can, or Bucky Poster.

=== Keep_scrolling ===
// Another, more extreme FLASH, ears ringing, screen is white for longer.
"It's been another hour. Wait, what was I trying to do again? I should stop."
//+1 action variable
//+1 burnt out path

// What does the player do?
-> END

// The question for the player to consider:
// The player can KEEP SCROLLING, or Leave.

=== KEEP_SCROLLING ===
//+20 action variable
//+1 burnt out path
-> DAY_1_Over

=== DAY_1_Over ===
It's getting late...
I should get some rest now so I'm good to go for tomorrow!
-> Go_back_to_dorm

=== map ===
// Where does the player click?
-> END

// The question for the player to consider:
// The player can go to Mosse 1, Union South, Memorial Union, Science Hall, or College Library.

=== Memorial_Union ===
// What does the player click on?
-> END

// The question for the player to consider:
// The player can talk to a random NPC or go to the outside terrace.

=== Mosse ===
Alright... I made it!
Except.... wait, where's my class again?
Room 2340.....

// Which way does the player go?
+ Head Right
    -> Head_right
+ Head Left
    -> Head_left
+ Take Stairs
    -> Take_Stairs

// The question for the player to consider:
// The player can Head right, Head left, or Take Stairs.

=== Peets ===
Oooooo coffee!
// Screen changes to POV of Peet's.
// What does the player click on?
-> END

// The question for the player to consider:
// The player can talk to the barista, talk to the Peet's Manager, or take a cookie.

=== barista ===
"Hello, what can I get for ya."
// What does the player say?
+ Iced Vanilla Latte
    -> Iced_Vanilla_Latte
+ Cappuccino
    -> Cappuccino
+ Have any hot drinks?
    -> Have_any_hot_drinks
+ Large Cold Brew with 3 Shots of Espresso
    -> Large_Cold_Brew_with_3_Shots_of_Espresso

=== Peets_Manager ===
"Hello there! You look like a spirited young person! Perfect for joining our team at Peet's!
Whaddya say? Wanna be a barista? Starting salary is pretttty nice!"
// What does the player say?
+ Wait... what?
    -> what
+ Of course! I need a job
    -> I_need_a_job
+ What about the interview?
    -> interview

=== cookie ===
You reach for the cookie.
The barista gestures at you and opens their mouth as if to say something, but after a moment, they realized... they just don't care enough.
Taking advantage of this moment, you tear open the wrapping, and begin eating the cookie, oh so very slowly, locking eyes with the barista, determination unwavering.
Action Variable: -2
-> map

=== Iced_Vanilla_Latte ===
-> Coming_Right_Up

=== Have_any_hot_drinks ===
"Leave. I never want to see your face here again."
// What does the player say?
+ It was an honest question!
    -> It_was_an_honest_question
+ Mwahahahahaha
    -> Mwahahahahaha
+ Excuse me? Let me speak with your Peet's Manager
    -> Peets_Manager

=== Large_Cold_Brew_with_3_Shots_of_Espresso ===
"..."
"O-okay."
Variable: Action -15
You have a renewed sense of energy!
-> map

=== Cappuccino ===
-> Coming_Right_Up

=== Coming_Right_Up ===
Mmm!
You have a renewed sense of energy!
Action Variable: -5
-> map

=== It_was_an_honest_question ===
"No... no... I can't deal with this right now. Talk to the Peet's Manager."
-> Peets_Manager

=== Mwahahahahaha ===
The barista clenches their fist, which was holding a piping hot drink, causing it to spill all over their hand and leg. They scream in agony. You just ruined this person's day, and perhaps, their life.
Barista friendship meter: -5
...
Maybe you're no longer welcome to come back to Peet's. Ever.
-> map

=== I_need_a_job ===
Now that's that Peet's mentality!
-> Youre_hired

=== interview ===
Now that's that Peet's mentality!
-> Youre_hired

=== what ===
Now that's that Peet's mentality!
-> Youre_hired

=== Youre_hired ===
"Here's your hat and shirt! You start tomorrow!
And don't forget...
WHEN IT COMES TO COFFEE, WE KNOW WHAT WE’RE BREWING!"
+1 College Not For Me Path

// What does the player do?
-> END

// The question for the player to consider:
// The player can go to DAY 1 Over, or back to the map.

=== Head_right ===
...
+ Take Stairs
    -> Take_Stairs
+ Head Left
    -> Head_left

=== Head_left ===
This looks sort of familiar...
+ Head Right
    -> Head_right
+ Take Stairs
    -> Take_Stairs
+ Take Another Left
    -> Take_Another_Left

=== Take_Stairs ===
...
+ Head Right
    -> Head_right
+ Head Left
    -> Head_left

=== Take_Another_Left ===
I think this is the right way...
+ Go Right
    -> Go_Right
+ Take Stairs
    -> Take_Stairs

=== Go_Right ===
I must be close now!
+ Take Another Right
    -> Take_Another_Right
+ Take Stairs
    -> Take_Stairs
+ Head Left
    -> Head_left

=== Take_Another_Right ===
There it is! Room 2340... I hope I'm still on time...
-> Enter_Classroom

=== Enter_Classroom ===
// POV: Lecture hall
Looks like everyone is sitting on the end of each row. You try to squeeze your way to an open spot, which unfortunately involves putting your butt in people's faces.
The professor has already gotten started... you're late.
You sit right next to this guy, already scribbling away at a notebook. As you try to take your backpack off, you knock off his notebook from the tiny desk.
Classmate: "(whispering) Hey, watch it man!"
// What does the player do?
+ "Oh, sorry!" You pick up their notebook from the ground and hand it to them.
    -> Oh_sorry_You_pick_up_their_notebook_from_the_ground_and_hand_it_to_them
+ Stomp on their notebook with your foot, laughing maniacally.
    -> Stomp_on_their_notebook_with_your_foot_laughing_maniacally
+ Ignore them.
    -> Ignore_them
+ Slap away the pencil in their hand, knocking it to the ground
    -> Slap_away_the_pencil_in_their_hand_knocking_it_to_the_ground

=== random_NPC ===
"..."
You hear music blasting from their headphones. They look at you confused, and slightly irritated.
// What does the player do?
+ Wave at them
    -> Wave_at_them
+ Stare at them
    -> Stare_at_them
+ leave them alone
    -> leave_them_alone

=== outside_terrace ===
// What does the player click on?
-> END

// The question for the player to consider:
// The player can sit on a Memorial Union Terrace Chair or talk to the Cheese Club President.

=== Wave_at_them ===
The NPC takes off their headphones
"Yeah?"
// What does the player say?
+ What song are you listening to?
    -> What_song_are_you_listening_to
+ You look cute.
    -> You_look_cute
+ Got any grapes?
    -> Got_any_grapes

=== Stare_at_them ===
"..."
The stranger avoids eye contact with you.
They're ignoring you.
Maybe, instead of being a creep, you explore the rest of Memorial Union.
-> Memorial_Union

=== leave_them_alone ===
Why do you bother people minding their business?
Let's see what else there is at Memorial Union
-> Memorial_Union

=== You_look_cute ===
"AH! Um... what? Really?
Uh... well thank you! What's your name?"
// What does the player say?
+ I'm more of a mysterious brooding type.
    -> Im_more_of_a_mysterious_brooding_type
+ Forget names. What's your number?
    -> Forget_names_Whats_your_number

=== What_song_are_you_listening_to ===
"Wow, I've waited so long for someone to ask me this!
Wait, where's the camera?"
// What does the player say?
+ No camera, just conversation
    -> No_camera_just_conversation
+ ANSWER THE QUESTION!
    -> ANSWER_THE_QUESTION

=== No_camera_just_conversation ===
"Oh! Um...
I actually have to get to class so..."
But they just keep scrolling on their phone after ignoring you.
-> Memorial_Union

=== ANSWER_THE_QUESTION ===
"Umm... nah... I'm good..."
You both stare at each other for a solid 3 seconds before they go back on their phone.
-> Memorial_Union

=== Go_back_to_dorm ===
// Roommate checks in:
// Dynamic dialogue based on choices:
// “Oh wow, you went to class? Who are you?”
// “Nothing to write home about today huh?”
// “You sure hit the books today bud...”
// “You applied for a job already?? Ambitious… or desperate.”
// “You found Science Hall?? Yeah no, I’m not going there.”
// “So… same plan tomorrow?”
// What does the player say?
//+ I'll be better
//+ I'll do whatever
+ I need sleep
"Alright... good night, see ya tomorrow!"
-> END

=== Oh_sorry_You_pick_up_their_notebook_from_the_ground_and_hand_it_to_them ===
Classmate: "Oh! Don't worry about it. Thanks."
They give you a smile and go back to scribbling in their notebook.
Friendship variable: +1
-> I_should_start_paying_attention_to_lecture

=== Stomp_on_their_notebook_with_your_foot_laughing_maniacally ===
You disrupt the lecture, causing all the students and professor to stop and stare at you.
Classmate: "(whispering) What the HELL? What is WRONG with you?"
You watch as they pick up their supplies from off the ground. You keep laughing.
Classmate friendship variable: -10
Professor: "Excuse me, could you do me a favor and stop acting like a lunatic? You are disrupting valuable learning time. Or would you rather be escorted out?
Professor friendship variable: -10
// What does the player do?
+ Keep laughing
    -> Keep_laughing
+ I should start paying attention to lecture.
    -> I_should_start_paying_attention_to_lecture

=== Ignore_them ===
Classmate: "(muttering) Jerk."
You watch as they pick up their supplies from off the ground.
Friendship variable: -1
-> I_should_start_paying_attention_to_lecture

=== Slap_away_the_pencil_in_their_hand_knocking_it_to_the_ground ===
Classmate: "What the HELL? What is WRONG with you?"
You watch as they pick up their supplies from off the ground.
Friendship variable: -2
-> I_should_start_paying_attention_to_lecture

=== I_should_start_paying_attention_to_lecture ===
// The professor already has a ton of info on the projector! Gotta jot this stuff down in case it's on the exam!
// (Lecture minigame? Insert here.)
// Result:
// +1 Completely Average Path OR +1 Perfect Student Path
Class is over!
// Screen switches to classroom with students leaving, the professor is seen standing by the front of the room, and the classmate NPC is sitting in their seat still.
// Who does the player click on?
-> END

// The question for the player to consider:
// The player can click on the Professor, the Classmate, or other items like the Bucky poster, Cheese club poster, or Hole in the wall.

=== Professor ===
// If friendship level is <1
Professor:
"Hey! What's up?"
// What does the player say?
+ Just wanted to say hi.
    -> Just_wanted_to_say_hi
+ That was a great class!
    -> That_was_a_great_class
+ What will be on the exam?
    -> What_will_be_on_the_exam

=== Classmate ===
// If friendship level <1: They're ignoring you.
// If friendship level >=1:
They take out their earbud.
"Um, hi."
// What does the player say?
+ What you doing after class?
    -> What_you_doing_after_class
+ Sorry about earlier.
    -> Sorry_about_earlier
+ Want to work on the homework together?
    -> Want_to_work_on_the_homework_together

=== Keep_laughing ===
+1 burnout path
Your maniacal laughter grows stronger, echoing throughout the lecture hall. Your classmates stare at you in awe. Some pull out their phones and start recording.
Professor: "Leave. Immediately."
-> map

=== Just_wanted_to_say_hi ===
Friendship level: +2
"Well hi right back at ya! I'm looking forward to seeing you next class!"
-> map

=== That_was_a_great_class ===
Friendship level: +1
Prof,
"Heh, saying that won't get you any better of a grade you know!
But I'm glad you thought so. Let me know if you ever have any questions."
-> map

=== What_will_be_on_the_exam ===
Prof:
"Right... well... to be honest with you...
I don't know. I haven't made the exam yet.
Just take good notes and you'll be fine alright?"
-> map

=== What_you_doing_after_class ===
"Oh! Um... I was just going to go to College Library to study a bit. I usually go after class. Maybe I'll see you there?"
Friendship meter: +1
-> map

=== Sorry_about_earlier ===
"Oh! Don't worry about it. I'm sorry if I seemed mean."
Friendship meter: +1
-> map

=== Want_to_work_on_the_homework_together ===
"Um... we don't have any homework... do we?
Lemme check.
We don't have homework, you scared me! But... whenever we DO get homework... sure!"
Friendship meter +1
-> map

=== Im_more_of_a_mysterious_brooding_type ===
Pffftt...! You're ridiculous.
Alright, well maybe I'll see ya around
-> Memorial_Union

=== Forget_names_Whats_your_number ===
Oh wow. Well, at least you didn't ask me for my snap. I'll give you that.
I'm Jo. You're pretty cute for an audacious loser. Maybe I'll give you my number if we met again...
Friendship meter +1
-> Memorial_Union

=== Got_any_grapes ===
Heh. Waddle away.
You waddle away.
But you know some day, somehow, you'll be back.
-> Memorial_Union

=== Memorial_Union_Terrace_Chair ===
What an iconic chair. It's also such a beautiful day...
// What does the player do?
+ sit on the chair and do nothing
    -> sit_on_the_chair_and_do_nothing
+ Memorial Union
    -> Memorial_Union

=== Cheese_Club_President ===
"hey hey HEY! Over here!
You should join the Cheese Club! Yes, it's as great as it sounds! We have our first general meeting on Wednesday at the Science Hall! We'll also be at the org fair tomorrow at College Library! Brie there!!
....(thought) if we don't get new recruits this club is COOKED..."
-> outside_terrace

=== sit_on_the_chair_and_do_nothing ===
//+2 action variable
//+1 Average Student Path
Relaxing!
-> Memorial_Union

=== Science_Hall ===
No music, just a hollow wind sound.
"No one's around..."
// Clickable area:
// Classroom door: "...It's locked. But you hear a strange noise coming from the other side of the room."
// What does the player click on?
-> END

// The question for the player to consider:
// The player can go to the Elevator or the Stairs.

=== College_Library ===
// Clickable items:
Roommate: "Oh hey. Wanna study with me? I got a midterm coming up."
// Empty table: "Did you wish to study?"
// Book: "I should really get back into reading for leisure."
// Bucky poster: "Bucky is watching."
// What does the player do?
-> END

// The question for the player to consider:
// The player can say Sure or No thanks to the roommate, or Yes or Nope to studying at the empty table.

=== Elevator ===
You enter the creeky elevator.
You see a note by the elevator buttons...
YOU ARE NOT ALONE
THE SPIRITS ROAM THIS LAND
MEET ME HERE TOMORROW IF YOU WANT TO JOIN MY QUEST IN UNLEASHING THEM
+1 Ghosthunter path
-> Science_Hall

=== Stairs ===
// notes****
// for now science hall is mainly empty (with the exception of the note in the elevator) and the player can walk around but there is nothing to do, just eerie silence and liminal spaces
-> Science_Hall

=== Sure ===
Awesome, sit down, man. I gotta lock in so I won't be talking much.
//+1 friendship meter
He pulls on his headphones.
// Will you study?
+ Yes
    -> Yes_Study
+ Distract him
    -> Distract_him

=== No_thanks ===
// Return to College Library or map
-> END

// The question for the player to consider:
// The player can return to College Library or go back to the map.

=== Yes_Study ===
// Screen switches to POV at library desk view
// Studying minigame? Maybe something WarioWare like...
// phone is a clickable item
// if performed successfully, +2 perfect student path, otherwise +1 average student path
// Can try again, but will add to +1 burnt out path and +1 action variable
// (Minigame result placeholder)
+2 perfect student path
-> END

=== Nope ===
// Return to College Library or map
-> END

// The question for the player to consider:
// The player can return to College Library or go back to the map.

=== Distract_him ===
You ask him where he wants to go eat after this.
He pulls off his headphones.
"Don't get me thinking about food right now man, you're gonna make me hungry."
// Will you study?
+ Yes
    -> Yes_Study
+ Keep distracting him
    -> Keep_distracting_him

=== Keep_distracting_him ===
Roommate: "Bruh"
**unfinished, will update later
-> map