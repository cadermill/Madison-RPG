-> start

//endings
VAR ending_perfect_student = 0
VAR ending_ghost = 0
VAR ending_burnt_out = 0
VAR ending_party = 0
VAR ending_barista = 0
VAR ending_average = 0

//friendship meters
VAR friendship_frat_bro = 0
VAR friendship_jo = 0 
VAR friendship_barista = 0 
VAR friendship_classmate = 0
VAR friendship_prof = 0
VAR friendship_roommate = 0 

//dictates when the day ends when it reaches a certain number 
//will test what feels balanced
VAR actions_taken = 0

//assignments for perfect student path
VAR reading_homework_done = false
VAR quiz_homework_done = false
VAR project_homework_done = false
VAR essay_homework_done = false
VAR presentation_homework_done = false


//checks if player has accepted barista job yet
VAR job_started = false



=== start ===

//Sound of a phone alarm going off

DAY 1 - MONDAY

#character_roommate_shocked #location_dorm_room
"Dude, how are you JUST NOW waking up?" 
#character_roommate_thinking
"Didn't you say you had that one class in Mosse like... right now?"
#character_roommate_neutral
"Whatever, I'm running late too. See ya!"

-> END

//LOCATION: DORM ROOM

// door -> map

== object_bucky_poster == 

 #location_dorm_room
Bucky is always watching. 

-> END

== object_bed ==

 #location_dorm_room
I probably shouldn't go back to sleep first thing in the morning...

-> END

//Desk POV Options:
//changes POV screen when clicks on desk

== dorm_desk_notebook == 

#location_desk_pov
It's kinda... unused. I should really start taking notes during lecture.

-> END

== laptop == 

#location_desk_pov
Let's see what's on Canvas for today... 
    // laptop opens and glows
        * Check Canvas
            Hmm... I have a reading due tomorrow... a quiz due on Wednesday... and a project due on Friday. 
                * *  Whateva. 
                    -> END
                * * Complete reading 
                    ~ ending_perfect_student++
                    ~ reading_homework_done = true
                    ~ actions_taken++
                    -> END
                * * Work on quiz 
                     ~ ending_perfect_student++
                     ~ quiz_homework_done = true
                     ~ actions_taken++
                     -> END
                * * Work on project 
                      ~ ending_perfect_student++
                      ~ project_homework_done = true
                      ~ actions_taken++
                      -> END
                
        * Close laptop 
        
-> END

        
== half_empty_iced_latte == 
   
   #location_desk_pov
    Oops. Guess I left this here from last week. I'll throw it away later. 
    + Take a sip. 
        You grab it and bring it to your mouth. There's a funky smell eminating from it. After taking a swig, your tummy gurgles. It leave a weird taste in your mouth. 
            ~ actions_taken++ 
            -> END
    + Ignore it. 

-> END 

== protein_bar_wrapper ==

#location_desk_pov
There's nothing quite like whey protein mixed with sugar alcohols to replace a minimally proceed balanced meal. Convenient! Guess I also forgot to throw this away too. 

-> END

== phone_doom_scrolling ==

//screen switches to POV of you holding your phone

#location_phone_pov
You open up Instagram Reels. Nothing wrong with a little distraction for a couple minutes, right? 

//Screen FLASHES, ears ring for a little bit 

~ ending_burnt_out++
~ actions_taken++

It's been 2 hours. You've spent them scrolling consuming reels that you don't even remember anymore.

+ Keep Scrolling 
// Another, more extreme FLASH, ears ringing, screen is white for longer. 
~ ending_burnt_out++
~ actions_taken++
"It's been another hour. Wait, what was I trying to do again?"
    + + KEEP SCROLLING
        //screen fades to black
        ~ ending_burnt_out++
        ~ actions_taken = 20
        Oh snap... the day's over. -> END
    + + That's enough. -> END

+ Put. The Phone. Down. 

-> END

//end POV desk dialogues
//END DORM SCENE

//MAP OPTIONS: 

//Dorm Room
//Memorial Union 
//Union South 
//Mosse
//College Library 
//Science Hall 
//Bascom Hill


//locations that are still unavailable: 
//Library Mall
//Gordon's Lawn
//Frat House 

// MEMORIAL UNION START


=== Cheese_Club_President ===

#character_cheese_president_happy #location_memorial_union
"Hey hey HEY! Over here!"

#character_cheese_president_happy 
"You should join the Cheese Club! Yes, it's as great as it sounds!"

#character_cheese_president_shocked
"We have our first general meeting on Wednesday at the Science Hall! We'll also be at the org fair tomorrow at College Library! Brie there!!"

#character_cheese_president_thinking #thought_bubble
"...If we don't get new recruits, this club is COOKED..."

-> END

== Terrace_Chair == 

What an iconic chair. It's also such a beautiful day... 

Sit down, enjoy the peaceful outdoors and do nothing?

+ Relax
 
 ~ actions_taken++
 ~ ending_average++

//screen fades to black 

//fades back in to the scene 

Ahhh... the wonderful sounds of the waves crashing in the lake, the wind blowing in your face, and the chirps of birds fill the air. What a blessing to be able to attend this institution! 

-> END 

+ No

-> END

=== Jo ===

#character_jo_annoyed #location_memorial_union
"..."

You hear music blasting from her earbuds. She looks at you confused... and slightly irriated. 

* Wave at her 

~ actions_taken++ 

    She takes out one of her earbuds. You can hear Bad Bunny blasting from it. 
    
    #character_jo_confused
    "Yeah?"
    
    * * What song are you listening to? 
    
    #character_jo_happy
    "Wow, I've waited so long for someone to ask me this!" 
    
    #character_jo_confused
    "Wait, where's the camera?" 
    
    * * * No camera, just conversation!
    
    #character_jo_shocked
    "Oh! It's not every day someone has the audacity to just approach someone like that without the intention of farming some content." 
    
    ~ friendship_jo++
    
    #character_jo_neutral
    "I'm listening to 'BAILE INoLVIDABLE' by Bad Bunny. Have you ever listened to it? It fits perfectly with catching some rays outside on a hot day... you feel me?" 
    
    #character_jo_happy
    "Sometimes you gotta slow down from the busy college lifestyle and take a breath! Now if you'll excuse me... I gotta keep vibin' out before my class starts. Catch ya later!" 
    
    -> END
    
    
    * * * JUST ANSWER THE QUESTION!
    
    #character_jo_annoyed
    "Um... okay, you gotta calm down pal. It's not that deep."
    
    #character_jo_confused
    "Just for that, I'm going to leave you wondering, since you seem to care very deeply about my music taste."
    
    #character_jo_shocked #thought_bubble
    "Why do I keep attracting weirdos..." 
    
    You both stare at each other for a solid 3 seconds, before she puts her earbud back in and averts her attention to her phone. 
    
    -> END
    
    * * You look cute. 
    
    #character_jo_shocked
    "AH! Um... what? Really?"
    
    #character_jo_happy
    "Well... thank you! I'm flattered. What's your name?" 
    
    * * * I'm more of a mysterious brooding type. 
    
    #character_jo_happy
    "Pfffffft! You're ridiculous!"
    ~ friendship_jo++
    
     #character_jo_neutral
    "Okay, Mr. Mystery. Thanks for having the guts to approach me at least... I guess..."
    
    #character_jo_neutral
    "Maybe I'll see you around some other time."
    
    -> END
    
    * * * Forget names. What's your number?
    
    #character_jo_shocked
    "Whoa. Well... at least you didn't ask me for my snap like a little boy. I'll give you that."
    
    #character_jo_neutral
    "You're pretty cute for an audacious loser. MAYBE... just MAYBE... I'll give you my number if we somehow meet again..." 
    
    #character_jo_neutral
    "See ya."
    
    ~ friendship_jo++
    
    -> END
    
    * * You know, hearing damaage is increasingly becoming an issue plaguing our generation. 
    
    #character_jo_confused
    "Umm... thanks for your concern. Not really your problem though, is it?"
    
    #character_jo_neutral
    "Let's face it. Our entire generation is cooked. Might as well enjoy the short amount of time we have on this Earth then, right?"
    
    You both stare at each other for a solid 3 seconds, before she puts her earbud back in and averts her attention to her phone. 
    
    -> END


* Stare at her 

You keep staring at her. She side eyes you for a split second, then starts avoiding eye contact completely with you. 

~ friendship_jo--

She's ignoring you now. Why are you such a creep?

-> END


* Leave her alone


-> END


//MEMORIAL UNION END

//UNION SOUTH START

=== Barista ===

#character_barista_neutral #location_union_south 
"Hello, what can I get for ya."

+ Iced Vanilla Latte
    
    #character_barista_happy
    "Coming right up!"
    
    The barista hands you your coffee instantly. You take a sip... He watches you... almost a little TOO eagerly. 
    
    Mmm! You have a renewed sense of energy!
    ~ actions_taken--
    
    #character_barista_happy
    "Hope you like it! I made it with... lots of... love..."
    
    -> END
    
+ Cappuccino
    
    #character_barista_happy
    "Coming right up!"
    
    The barista hands you your coffee instantly. You take a sip... He watches you... almost a little TOO eagerly. 
    
    Mmm! You have a renewed sense of energy!
    ~ actions_taken--
    
    #character_barista_happy
    "Hope you like it! I made it with... lots of... love..."
    
    -> END
    
+ Have any hot drinks?

    #character_barista_confused
    "Are you kidding? You've GOT to be kidding."
    
    #character_barista_annoyed
    "Leave. I never want to see your face here again."
    
     + + It was an honest question! 
     
     #character_barista_sad
     "No... I don't believe you..."
     
     #character_barista_confused
    "I can't... I can't deal with this right now. Talk to my manager about this hot drink matter."
     
     -> peets_manager
     
     + + Mwahahahahahahah
     
     ~ friendship_barista--
     
     The barista clenches their fist, which was holding a piping hot drink, causing it to spill all over their hand and leg. They scream in agony. You just ruined this person's day, and perhaps, their life. 
     
     -> END
     
     
     + + Excuse me? Let me speak with your manager. 
     
      #character_barista_annoyed
     "Oh. Please do. Be my GUEST."
     
      -> peets_manager
      
      
+ Large Cold Brew with 3 Shots of Espresso

#character_barista_shocked
"..."

#character_barista_confused
"O-okay. Coming right up."

The barista hands you your coffee instantly. You take a sip... 

~ actions_taken--
~ actions_taken--
~ actions_taken--

You feel your heart stop for about 5 seconds straight. Your chest clenches. A sharp pain pierces your abdomen. You can't breathe.

The barista stares at you in horror. You lose your sense of hearing, but you can make out the words coming from the barista's mouth... 

"What have I done?" he says, falling to his knees. 

But then, the moment passes and you take another sip. You're totally aware. Maybe too aware. But you're full of energy. So! Much! Energy. 

The barista gets back up on his feet after quickly realizing you've revived. 

Just another day at Peet's.

    -> END

=== peets_manager ===

#character_manager_happy
"Hello there! You look like a spirited young person! Perfect for joining our team at Peet's!

#character_manager_neutral
Whaddya say? Wanna be a barista? Starting salary is pretttty nice!"

* Wait... what? 

#character_manager_happy
"Now that's that Peet's mentality! You're hired!"

#character_manager_neutral
"Here's your hat and shirt! You can start your shifts whenever by talking to me!"

#character_manager_thinking
"And don't forget..."

#character_manager_happy
"WHEN IT COMES TO COFFEE, WE KNOW WHAT WE'RE BREWING!"

~ ending_barista++
~ actions_taken++
~ job_started = true

-> END

* Of course! I really need a job. 

#character_manager_happy
"Now that's that Peet's mentality! You're hired!"

#character_manager_neutral
"Here's your hat and shirt! You can start your shifts whenever by talking to me!"

#character_manager_thinking
"And don't forget..."

#character_manager_happy
"WHEN IT COMES TO COFFEE, WE KNOW WHAT WE'RE BREWING!"

~ ending_barista++
~ actions_taken++
~ job_started = true

-> END

* What about the interview? 

#character_manager_happy
"Now that's that Peet's mentality! You're hired!"

#character_manager_neutral
"Here's your hat and shirt! You can start your shifts whenever by talking to me!"

#character_manager_thinking
"And don't forget..."

#character_manager_happy
"WHEN IT COMES TO COFFEE, WE KNOW WHAT WE'RE BREWING!"

~ ending_barista++
~ actions_taken++
~ job_started = true

-> END


=== cookie ===
You reach for the cookie.

The barista gestures at you and opens their mouth as if to say something, but after a moment, they realized... they just don't care enough.

Taking advantage of this moment, you tear open the wrapping, and begin eating the cookie, oh so very slowly, locking eyes with the barista, determination unwavering.

~actions_taken--

-> END

== cash_register == 

#character_barista_angry
"Nope! Don't even THINK about it. Only I have access to the register... my sweet..."

-> END

// UNION SOUTH END

// MOSSE START

=== mosse_first_action ===

//only available if player goes to class first thing in the morning
#location_mosse
Alright... I made it!

Except.... wait, where's my class again? Room 2340.....

//I don't think there will be any dialogue here, but should still switch scenes depending on which arrow the player clicks on in order to traverse the halls and get to the correct room

//this then leads to class scene, which is not accessible if player does not go to mosse first

-> END

=== mosse_Monday_class ===

#location_mosse
Looks like everyone is sitting on the end of each row. You try to squeeze your way to an open spot, which unfortunately involves putting your butt in people's faces.

The professor has already gotten started... you're late.

You sit right next to this girl, already scribbling away at a notebook. As you try to take your backpack off, you knock off her notebook from the tiny desk.

#character_classmate_annoyed
"[whispering] Hey, watch it man!"

* "Oh, sorry!" You pick up their notebook from the ground and hand it to them.

#character_classmate_neutral
"Oh! Don't worry about it. Thanks."

~ friendship_classmate++
~ ending_perfect_student++

They give you a smile and go back to scribbling in their notebook.

    #character_prof_neutral
    "Alright, don't forget, we will be having an in-class quiz this Friday, so make sure you don't miss class..." 
    
    #character_prof_happy
    "Today we'll be going over basic algebra principles! I know, you've been waiting your whole college career for this exact moment!"
    
    //insert Monday trivia minigame, a higher score leads to another point for perfect student ending?
    
    -> END
    
* Stomp on their notebook with your foot, laughing maniacally.
     
You disrupt the lecture, causing all the students and professor to stop and stare at you. 

#character_classmate_annoyed
"[whispering] What the HELL? What is WRONG with you?"

You watch as they pick up their supplies from off the ground. You keep laughing. 

~friendship_classmate--
~friendship_classmate--
~friendship_classmate--

#character_prof_annoyed
"Excuse me, could you do me a favor and stop acting like a lunatic? You are disrupting valuable learning time. Or would you rather be escorted out?"

    * * Keep laughing 
    
    ~ friendship_prof--
    ~ ending_burnt_out++
    
    Your maniacal laughter grows stronger, echoing throughout the lecture hall. Your classmates stare at you in awe. Some pull out their phones and start recording.
    
    #character_prof_annoyed
    "Leave. Immediately." 
    
    //Screen returns to map 
    
    -> END
    
    * * "I'm sorry. I'll stop."

     #character_prof_sad
     "Ugh... thank you..." 
     
    #character_prof_neutral
    "Alright, don't forget, we will be having an in-class quiz this Friday, so make sure you don't miss class..." 
    
    #character_prof_happy
    "Today we'll be going over basic algebra principles! I know, you've been waiting your whole college career for this exact moment!"
    
    //insert Monday trivia minigame, a higher score leads to another point for perfect student ending?
     
     -> END
     
     
* Ignore them.
    
    #character_classmate_annoyed
    "[muttering] Psh. Jerk. 
    
    ~ friendship_classmate--
    
     #character_prof_neutral
    "Alright, don't forget, we will be having an in-class quiz this Friday, so make sure you don't miss class..." 
    
    #character_prof_happy
    "Today we'll be going over basic algebra principles! I know, you've been waiting your whole college career for this exact moment!"
    
    //insert Monday trivia minigame, a higher score leads to another point for perfect student ending?
    
     -> END


// Screen switches to classroom with students leaving, the professor is seen standing by the front of the room, and the classmate NPC is sitting in their seat still.

//only unlocks after class has ended. 

=== Professor ===

{ friendship_prof >= 0:

#character_prof_neutral #location_mosse
"Hey! What's up?"


* Just wanted to say hi.

~friendship_prof++

#character_prof-happy
"Well hi right back at ya! I look forward to seeing you next class!"

~ actions_taken++
    -> END
    
* That was a great class!

~friendship_prof++

#character_prof_happy
"Heh, saying that won't get you any better of a grade you know!"

#character_prof_neutral
But I'm glad you thought so. Let me know if you ever have any questions."

~ actions_taken++
    -> END
    
* What will be on the exam?

#character_prof_thinking
"Right... well... to be honest with you..."

#character_prof_sad
"I don't know. I haven't made the exam yet."

#character_prof_neutral
"Just take good notes and you'll be fine alright?"

~ actions_taken++
    -> END
    
- else:

#character_prof_confused
"I'm busy right now."

-> END 


}
=== Classmate ===
// If friendship level <1: They're ignoring you.
// If friendship level >=1:

{ friendship_classmate >= 0:

They take out their earbud.

#character_classmate_neutral #location_mosse
"Um, hi."

* What you doing after class?

#character_classmate_shocked
"Oh! Um... I was just going to go to College Library to study a bit. Sometimes I go after class."

{ friendship_classmate > 0:

#character_classmate_neutral
Maybe I'll see you there?"

}

    -> END
    
* Sorry about earlier.

#character_classmate_confused
"Oh! Don't worry about it. I'm sorry if I seemed mean."

~ friendship_classmate++
~ actions_taken++

    -> END
    
* Want to work on the homework together?

#character_classmate_shocked
"Um... we don't have any homework... do we? Lemme check."

#character_classmate_neutral
We don't have homework, you scared me! But... whenever we DO get homework... sure!" 

~ friendship_classmate++
~ actions_taken++

    -> END
    
- else:

#character_classmate_annoyed
She's ignoring you. 
~ actions_taken++

-> END

}
    

=== Mosse_missed_class ==

I definitely missed class...

//player can still wander the halls but no one is there. 

-> END

// MOSSE END

// COLLEGE LIBRARY START

=== roommate_college_library ===

#character_roommate_neutral #location_college library
"Oh hey. Wanna study with me? I've got a midterm coming up."

* Sure!

You take a seat at his table and take your laptop out of your bag. 

#character_roommate_neutral 
"Awesome. I gotta lock in so I won't be talking much."

He puts on his headphones. 

    * * Lock in with him 
    
    You take out your headphones and put them on too. You open your laptop and immediately reach a flow state most Badgers could only dream of. 
    
     //SCREEN FADES OUT
    
    
     //SCREEN FADES BACK IN
    
    It's been 2 hours of straight grinding. Didn't even need the Pomodoro Method, you're just that guy. 
    
    #character_roommate_happy
    "Alright, I think I'm starting to mentally check out. But that was a pretty good study sesh, yeah?"
    
     #character_roommate_neutral
    "Let's study together sometime again!"
    
    ~ ending_perfect_student++
    ~ friendship_roommate++ 
    ~ actions_taken++
     ~ actions_taken++
    
    -> END
    
    * * Distract him
    
    You ask him where he wants to go eat after this. 

    He pulls off his headphones.
    
    #character_roommate_sad
    "Don't get me thinking about food right now man, you're gonna make me hungry."
        * * * "You're right, let's lock in." 
    
    You take out your headphones and put them on too. You open your laptop and immediately reach a flow state most Badgers could only dream of. 
    
     //SCREEN FADES OUT
    
    
     //SCREEN FADES BACK IN
    
    It's been 2 hours of straight grinding. Didn't even need the Pomodoro Method, you're just that guy. 
    
    #character_roommate_happy
    "Alright, I think I'm starting to mentally check out. But that was a pretty good study sesh, yeah?"
    
     #character_roommate_neutral
    "Let's study together sometime again!"
    
    ~ ending_perfect_student++
    ~ friendship_roommate++ 
    ~ actions_taken++
     ~ actions_taken++

        -> END
        
        * * * Keep distracting him 
        
        He puts his headphones back on, but you keep staring at him. You eventually pull out your phone, and open up reels, laughing loudly. 
        
        You show him the reel that has you cracking up, and he starts cracking up too. 
        
        //FADE OUT
        
        //FADE BACK IN 
        
         #character_roommate_sad
         "Dude... it's been 45 minutes already?! I haven't locked in at ALL." 
         
        #character_roommate_shocked
         "[sigh] Stop distracting me man! I REALLY need to FOCUS! We can watch these later tonight." 
         
        * * * * But have you seen this video?
        
         #character_roommate_annoyed
         "No. Not now dude. Leave me alone if you don't want to study right now."
         
         ~ friendship_roommate--
         ~ actions_taken++
         ~ actions_taken++
        
        -> END
        
        * * * * I can't focus. 
        
        #character_roommate_annoyed
        "Well... I CAN. You can hang out here but just don't distract me anymore, okay? 
        
        #character_roommate_sad #thought_bubble
        If I don't get a good grade on this midterm I'm screwed..."
        
         ~ actions_taken++
         ~ actions_taken++
        
        -> END 


* No thanks

#character_roommate_neutral
"Alright, I'll see you back at the dorm later!"

-> END

=== classmate_college_library ===

She's jamming out to her tunes while also locked in, scribbling away at her notebook and typing on her laptop like a keyboard warrior. 

She doesn't even notice you...

-> END

=== book ===

//placed on table

I should really get back into reading for leisure.

-> END

== PC == 

#location_college_library
Should I do some studying while I'm here? 

+ Yes

#location_college PC_pov
Let's see what's on Canvas for today... 
    // laptop opens and glows
        * * Check Canvas
            Hmm... I have an essay due Tuesday... a quiz due Wednesday... and a presentation due on Friday. 
                * * *  Whateva. 
                    -> END
                * * * Complete quiz
                    ~ ending_perfect_student++
                    ~ quiz_homework_done = true
                    ~ actions_taken++
                    -> END
                * * * Work on essay
                     ~ ending_perfect_student++
                     ~ essay_homework_done = true
                     ~ actions_taken++
                     -> END
                * * * Work on project 
                      ~ ending_perfect_student++
                      ~ presentation_homework_done = true
                      ~ actions_taken++
                      -> END
                
        * * Close laptop 
        
          -> END
        
+ Nah...

-> END

== object_bucky_poster_library == 

 #location_college_library
Bucky is always watching. 

-> END

==Library_Front_Desk_Student==

They're asleep on the job... must've had the 12AM-6AM shift too...

-> END

// COLLEGE LIBRARY END

// SCIENCE HALL START

=== science_hall ===
//No music, just a hollow wind sound and sporatic sounds of footsteps
// for now science hall is mainly empty (with the exception of the note in the elevator) and the player can walk around the space, but there is nothing to do, just eerie silence and liminal spaces

#location_science_hall
"No one's around..."

-> END

=== Classroom_Door ===

...It's locked. But you hear a strange noise coming from the other side of the room.

-> END

=== Elevator ===

You enter the creeky elevator.

You see a note by the elevator buttons...

YOU ARE NOT ALONE
THE SPIRITS ROAM THIS LAND
MEET ME HERE TOMORROW IF YOU WANT TO JOIN MY QUEST IN UNLEASHING THEM

~ ending_ghost++

-> END

// SCIENCE HALL END

//BASCOM HILL START

== Bucky_Banner_Bascom_Hall == 

Seeing Bucky's face look down upon everyone, standing on the one and only Bascom Hill gasping for breath... it's a great day to be a Badger.

-> END

== Pink_Lawn_Flamingo == 

It seems someone left this here from Fill the Hill... 

-> END

//BASCOM HILL END

== Monday_Over_Dialogue == 

It's getting late... maybe I should head home and rest up now. 





//FADE TO BLACK 
//Day End jingle

-> END


