-> day_start

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

== day_start ==

//Sound of a phone alarm going off

DAY 2 - TUESDAY
 
#character_roommate_neutral #location_dorm_room
Hey man! Ready to start the day? I heard that there's gonna be a student org fair today at Gordon's if you wanted to check it out with me later. 

#character_roommate_thinking  
I also think there's some greek life recruiting... thing... over at Library Mall too. 
#character_roommate_neutral 
I dunno. I gotta go so, I'll see ya later!

//FADE IN: 

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
            Hmm... I have a reading due today... a quiz due tomorrow... and a project due on Friday. 
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
//this was discussed to be a feature implemented where the player themselves would swipe on the phone 
//but for now it can just be narrative

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
        ~ actions_taken = 10
        Oh snap... the day's over. -> END
    + + That's enough. -> END

+ Put. The Phone. Down. 

-> END

//end POV desk dialogues
//end dorm 


//MAP OPTIONS: 

//Dorm Room
//Memorial Union 
//Union South 
//Gordon's Lawn 
//Mosse
//Library Mall 
//College Library 
//Science Hall 
//Bascom Hill


// MEMORIAL UNION START

== Terrace == 

It doesn't seem like there's anyone here at the moment... 

Sit down and enjoy the peaceful outdoors?

+ Relax
 
 ~ actions_taken++

//screen fades to black 

//fades back in to the scene 

Ahhh... the wonderful sounds of the waves crashing in the lake, the wind blowing in your face, and the chirps of birds fill the air. What a blessing to be able to attend this institution! 

-> END 

+ Leave

-> END 

//MEMORIAL UNION END 


// UNION SOUTH START

== Barista == 

{ job_started == true:

#character_barista_thinking #location_union_south
"...You sure you want to order from this side of the register? You could probably just make yourself something for free."

+ Of course! I love giving the Wisconsin Union money. 

#character_barista_neutral
    Oooookay. What can I get ya? 
    
     + + Cappuccino
     
        #character_barista_happy
        "Coming right up!"
        
        He serves it to you almost instantanously... 
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
        
     -> END
     
     + + What do you recommend? 
     
     #character_barista_sad
     Honestly? Nothing. I don't think we've passed our most recent health inspection. 
     #character_barista_thinking
     But... I dunno, otherwise I think a dirty chai would be pretty good? Did you want one?
     
     + + + Yes please!
     
     #character_barista_happy
      "Coming right up!"
        
        He serves it to you almost instantanously... 
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
     
     -> END
     
     + + + No... thanks...
     
     #character_barista_neutral
     
     "Alright... suit yer self." 
     
     -> END
     
     
     + + Your latest seasonal beverage. 
    
    #character_barista_thinking
    "Hmmmm... which one was that again?"
    
    #character_barista_shocked
    "Oh right! The protein-lavendar-boba-ube-topping-skinny-latte!"
    
     #character_barista_happy
    "Coming right up!"
        
        He serves it to you almost instantanously... 
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
    
    -> END

+ You're so right. 

#character_barista_happy
"Dude, it's one of the main perks of working here. In fact, why else would you choose this place if not for that?" 

#character_barista_shocked
"Hey... next time you clock in, would ya wanna try all of the new seasonal flavor pumps with me? On our down time... heh... obviously..." 

    + + OF COURSE!
    
  ~  friendship_barista++
    
    #character_barista_happy
    "Let's go!! You won't regret it dude! Trust me... once you start... you... you can't stop..." 
    
    -> END 
    
    
    + + Uh... I'll pass. 

#character_barista_sad
"Oh um... yeah, forget I asked. I'll just do that some other time... by myself..."

#character_barista_sad
[sob]

	-> END
	
- else: 


#character_barista_neutral
Hello, what can I get ya?
    
+ Cappuccino
     
        #character_barista_happy
        "Coming right up!"
        
        He serves it to you almost instantanously... 
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
        
     -> END
     
+ What do you recommend? 
     
     #character_barista_sad
     Honestly? Nothing. I don't think we've passed our most recent health inspection. 
     #character_barista_thinking
     But... I dunno, otherwise I think a dirty chai would be pretty good? Did you want one?
     
     + + Yes please!
     
     #character_barista_happy
      "Coming right up!"
        
        He serves it to you almost instantanously... 
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
     
     -> END
     
     + + No... thanks...
     
     #character_barista_neutral
     
     "Alright... suit yer self." 
     
     -> END
     
     
+ Your latest seasonal beverage. 
    
    #character_barista_thinking
    "Hmmmm... which one was that again?"
    
    #character_barista_shocked
    "Oh right! The protein-lavendar-boba-ube-topping-skinny-latte!"
    
     #character_barista_happy
    "Coming right up!"
        
        He serves it to you almost instantanously... 
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
    
    -> END


-> END


}

-> END

== peets_manager == 

{ job_started == true:

#character_manager_happy #location_union_south
"You ready to get to work?!"

+ YES!!

#character_manager_happy
"That's what I like to hear!" 
~ actions_taken++
~ ending_barista++

//commence coffee minigame. 
//when timer runs out... 

//"Did you want to work another shift?"
//if yes, add another to actions taken variable and barista path variable 

-> END

+ Not really 

#character_manager_angry
"...Well, let me know when you want to make some money for once!"

-> END

- else: 

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

}



== breakfast_sandwich == 

You're eyeing up that breakfast sammie... it looks delicious, and... oops...! Somehow, it's found its way into your hand... the barista stares at you... and now... somehow that sandwich made its way into your mouth... How did that happen? The barista is shakes their head at you as you inhale the sandwich, but who cares? 

    Absolutely scrumptious. 
    
    
-> END

== cash_register == 

#character_barista_angry
"Nope! Don't even THINK about it. Only I have access to the register... my sweet..."

-> END

// UNION SOUTH END

// GORDON'S LAWN START

== cheese_club_president == 

#character_cheese_president_happy
"Hey hey HEY! Over here! Have you ever heard of the UW Cheese Club? Yes, we're as great as it sounds!" 

#character_cheese_president_thinking
"There's sooo many things we do! "We go on cheese curd crawls around Madison, eat lots of cheesy snacks... talk about how much we love cheese... 

#character_cheese_president_shocked
Not that we don't get on top of cheesy business too! The Vice President and I even went to a World Championship Cheese Content last week!

#character_cheese_president_happy
I KNOW you're intrigued! You should DEFINITELY come to our first meeting tomorrow at College Library! We'll have a variety of cheese snacks!! 

#character_cheese_president_sad #thought_bubble
We need as many people to come to this event... we spent WAY TOO MUCH MONEY on all this cheese...

#character_cheese_president_happy
See ya tomorrow alright?! Don't forget about it! Brie there!


-> END 

== roommate_gordons == 

#character_roommate_happy #location_gordons
"Hey! You made it! Any of these clubs sound interesting to you?"

#character_roommate_thinking
"Low key... cheese club is kinda calling my name... like... free cheese? How could any Wisconsinite say no to that?!" 
#character_roommate_shocked
"But there's also Animation Club... Club Water Polo... Sports Business... Robotics... Larping... Fashion... Smash Bros... there's WAY too much to choose from!" 
#character_roommate_sad
"If only they didn't all meet on Wednesdays at 7PM..." 

-> END 


== cheese_club_trifold == 

#location_gordons
This trifold looks like it's been used and reused for a few years now. They have a complex cheese family diagram, along with pictures of them at a cheese curd crawl... whatever that means. 

-> END 

== spike_ball_setup == 

#location_gordons
Ah yes, the classic Gordon's Lawn collegiate sport. Spike Ball. 


-> END 


// GORDON'S LAWN END 

// MOSSE START

== mosse_first_action ==

//only available if player goes to class first thing in the morning
#location_mosse
Alright... made it to Mosse. 

Except.... wait, where's my class again? Room 2340..... 

//I don't think there will be any dialogue here, but should still switch scenes depending on which arrow the player clicks on in order to traverse the halls and get to the correct room

//this then leads to class scene, which is not accessible if player does not go to mosse first

-> END

== mosse_Tuesday_class == 

#location_mosse
You enter the classroom, and this time, the professor hasn't gotten started yet! You're on time! It's a Christmas miracle! 

~ ending_perfect_student++
~ actions_taken++

#character_prof_neutral
"Alright everyone, let's get started!"


#character_classmate_thinking #location_mosse
"Hey... pssst..."

* What's up?

    #character_classmate_shocked
    "So... um... do you have a pencil I could borrow? I lost mine... somehow..." 
    
    * * Sure thing!
    
    You hand her your only pencil left. Guess you're not taking notes today either. 
    #would this result in some sort of disadvantage for the minigame? not sure how to implement that tho 
    
    ~ friendship_classmate++
    
    #character_classmate_happy
    "Awesome, thanks so much! You're the best. I'll give this back after class of course."
    
     #character_classmate_neutral
    "Okay, let's lock in now..."
    
    #character_prof_neutral
    "Alright, don't forget, we will be having an in-class quiz this Friday, so make sure you don't miss class..." 
    
    #character_prof_happy
    "Today we'll be going over the history of science! Yes, hold back your cheers! We need to focus!"
    
    //insert Tuesday trivia minigame, a higher score leads to another point for perfect student ending?
    
    -> END 
    
    * * Ask somebody else, I don't want your cooties. 
    
    #character_classmate_annoyed
    "???"
    
   #character_classmate_annoyed
    "What kind of incel are you, dawg?"
    
     #character_classmate_neutral
    "Forget I even spoke to you..."
    
    ~ friendship_classmate--
    
    #character_prof_neutral
    "Alright, don't forget, we will be having an in-class quiz this Friday, so make sure you don't miss class..." 
    
    #character_prof_happy
    "Today we'll be going over the history of science! Yes, hold back your cheers! We need to focus!"
    
    //insert Tuesday trivia minigame, a higher score leads to another point for perfect student ending?
    
    -> END

* [ignore her]

#character_classmate_shocked
"PSSSST.... PSSSSST!! HEY... "

She slightly waves at you trying to get your attention, to no avail. She eventually gives up and averts her attention to the professor. Except she keeps side eyeing you. 

  #character_prof_neutral
    "Alright, don't forget, we will be having an in-class quiz this Friday, so make sure you don't miss class..." 
    
    #character_prof_happy
    "Today we'll be going over the history of science! Yes, hold back your cheers! We need to focus!"
    
    //insert Tuesday trivia minigame, a higher score leads to another point for perfect student ending?

-> END
* GUUURL, I am TRYING to LISTEN to the PROFESSOR!

~ friendship_classmate--

The whole lecture hall turns to face you. The professor chooses to ignore you. He has a slight smirk on his face.  

#character_classmate_shocked
"[whispering] Dude! What the hell are you doing?! You tryna get kicked out?!"

#character_prof_neutral
    "Ooookeeedokeee, moving on..." 

 #character_prof_neutral
    "Don't forget, we will be having an in-class quiz this Friday, so make sure you don't miss class..." 
    
    #character_prof_happy
    "Today we'll be going over the history of science! Yes, hold back your cheers! We need to focus!"
    
    //insert Tuesday trivia minigame, a higher score leads to another point for perfect student ending?


-> END 


== mosse_after_class_classmate == 

{ 

- friendship_classmate >= 0:


#character_classmate_neutral #location_mosse
"Hey..." 

+ Whatdya think about class today?

#character_classmate_thinking
"It... was alright... history of science is... an extensive subject..."

#character_classmate_sad
"I was trying not to fall asleep."

-> END

+ Want to study together? 

#character_classmate_thinking
"I mean... I guess we DO have that quiz on Friday..."

#character_classmate_sad
"But I'm dead tired today dawg. I need a nap... Maybe tomorrow?"

-> END

+ Where's the professor? 
#character_classmate_thinking
"I think he left early. Something about needing to catch the game. I'm gonna go home soon too. I'm real tired." 

-> END


- else: 

She's ignoring you.

-> END


}


// MOSSE END


//LIBRARY MALL START

== Frat_Bro == 

#character_frat_bro__neutral #location_library_mall
"Hey! You think you're Pi Lambda Phi material?"

* ...Are you talking to me? 
    #character_frat_bro_shocked
    "Who else would I be talking to dude! I think you've got what it takes!" 
    #character_frat_bro_thinking
    "Sure you're a little goofy looking, but you still have plenty of material to work with. We just gotta make a couple tweaks here and there..."
    #character_frat_bro_happy
    "Soon enough you'll be a Pi Lam bro through and through!"
    #character_frat_bro_neutral
    "If you want to meet some of the bros and see the house, stop by during our rush event tomorrow night. 
     #character_frat_bro_happy
    "We're having a bonfire and some burgers... nothing crazy..." 
    
     ~ friendship_frat_bro++
      ~ending_party++
      ~ actions_taken++
    
//add variable to affect the rest of the days: invited_frat_house = true 
// frat house will now be an option to visit tomorrow (Wednesday)
-> END


* HECK YEAH I AM! 
    #character_frat_bro_neutral #location_library_mall
    "Alright, I like that energy! You keep that up, and just maybe, the rest of the Pi Lam brothers will too."
     #character_frat_bro_thinking
    "I already see it now... you look like someone who will lead courageously not just for four years, but for a lifetime."
    #character_frat_bro_happy
    "Soon enough you'll be a Pi Lam bro through and through!"
    #character_frat_bro_neutral
    "If you want to meet some of the bros and see the house, stop by during our rush event tomorrow night. 
     #character_frat_bro_happy
    "We're having a bonfire and some burgers... nothing crazy..." 

    ~ friendship_frat_bro++
    ~ending_party++
    ~ actions_taken++
    
//add variable to affect the rest of the days: invited_frat_house = true 
// frat house will now be an option to visit tomorrow (Wednesday)

-> END


* Uh... no. 
   ~ friendship_frat_bro--
   #character_frat_bro_annoyed #location_library_mall
   "Psh. Clearly. Get outta here with that BS dude. Maybe Triangle will take you."
 -> END

==Frat_Bro_Click_2==

//if the player clicks on him again after the first interaction 
//if else statement

{ friendship_frat_bro > 0: 
#character_frat_bro_neutral #location_library_mall
+\	{&"Maybe I'll see ya around."|"Feel free to bring a friend tomorrow if you want."|"Take care man."} -> END

- else:
#character_frat_bro_annoyed #location_library_mall
+\	{&"What do you want?"|"..."|"Talk to some other frats if you're so desperate."}

-> END

}

== Jo == 

{ 

- friendship_jo > 0:
#character_jo_neutral #location_library_mall
"Oh! Hey. Didn't think I'd run into you again." 

* Are you thinking of joining a sorority?

#character_jo #emotion_shocked
"Me? Oh no. At least, I don't think so. I'm kinda just curious."

#character_jo_thinking
"Also... It doesn't hurt to... make connections... if you know what I mean."

    * * Do you think I should join a frat?
    
    #character_jo_confused
    "Why you asking me? No offense, but I barely know you. Do what you wanna do man."
    
     * * * Whatcha doing after this?
     
       ~ friendship_jo++
       
       #character_jo_thinking
       "Um... I'm not sure. I'm pretty tired, actually. I'll probably head home soon and relax before we gotta do this college thing all over again tomorrow."
       
       
       #character_jo_neutral
       "So... see ya buddy. Maybe I'll catch ya later." 
     
    
     -> END
     
     
     * * * See ya.
     
     -> END


-> END
    
    * * Which frat or sorority seems the coolest?
    
    #character_jo_thinking
    "Psssh. They all seem equally pretentious to me. 
    
        * * * Whatcha doing after this?
     
       ~ friendship_jo++
       
       #character_jo _thinking
       "Um... I'm not sure. I'm pretty tired, actually. I'll probably head home soon and relax before we gotta do this college thing all over again tomorrow."
       
       
       #character_jo #emotion_neutral
       "So... see ya buddy. Maybe I'll catch ya later." 
     
    
     -> END
     
     
         * * * See ya.
     
     -> END


-> END


* So... can I have your number now?

    #character_jo_happy
    "Pffft! BRUH. You're so ridiculous!"
    
    #character_jo_neutral
    "You've got dedication, I'll give you that, but it's gonna take a little more than that to get my digits."
    
    #character_jo_sad
    "I mean, come on, not even a cheesy pickup line? I know you men think it's a numbers game but STILL!"
    
        * * Sorry, I didn't mean to upset you. 
        
            #character_jo_shocked
            "Oh! Um... apology accepted. Maybe you aren't just another douche." 
            
            #character_jo_neutral
            "For now, why don't we just focus on being friends?"
            
            #character_jo_thinking
            "I'm probably gonna head home right now. I'll see ya around bud."
            
            ~ friendship_jo++
        
            ~ friendship_jo++
        
        -> END
        
        * * You women are so dramatic.
        
            #character_jo_angry
            "Um... EXCUSE ME?"
            #character_jo_angry
            "Get lost loser. I regret wasting my saliva talking to a creep such as yourself."
            #character_jo_sad #thought_bubble
            "Ugh... what did I expect coming to this wannabe-frat-bro convention..."
            
            ~ friendship_jo--
            ~ friendship_jo--
            ~ friendship_jo--
        
        
        -> END

-> END

* What's going on here?

#character_jo_neutral
"I believe it's like an org fair but soley for greek life. You know... your frat bros and sorority girlies."

#character_jo_shocked
"Would you ever want to join a frat?" 

    * * Sounds like fun. 
    
    #character_jo_neutral
    "Oh I'm sure it is. I'm sure it is..."
    
    #character_jo_neutral
    "If you're seriously interested, probably wouldn't hurt to talk to those guys over there."
    
    -> END
    
    * * Not my thing. 
    
    #character_jo_neutral
    "Yeah, I don't think it would be for me either. I've heard some... THINGS about this crowd."
    
    -> END

-> END

- friendship_jo == 0:
#character_jo_neutral
"...Hey."

* What's going on here?

#character_jo_neutral
"I believe it's like an org fair but soley for greek life. You know... your frat bros and sorority girlies."

#character_jo_shocked
"Would you ever want to join a frat?" 

    * * Sounds like fun. 
    
    #character_jo_neutral
    "Oh I'm sure it is. I'm sure it is..."
    
    #character_jo_neutral
    "If you're seriously interested, probably wouldn't hurt to talk to those guys over there."
    
        -> END
    
    * * Not my thing. 
    
    #character_jo_neutral
    "Yeah, I don't think it would be for me either. I've heard some... THINGS about this crowd."
    
        -> END

    -> END

* What's your name?

    #character_jo #emotion_neutral
    "Umm... I'm Jo. Why?"
    
        * * Can't a man just introduce himself?
        
        #character_jo_neutral
        "Of course he can. I guess I'm just not used to guys just doing that anymore."
        #character_jo_thinking
        "WELL... it's very nice to meet you... maybe I'll see ya around. 
        
          * * * Whatcha doing after this?
     
       ~ friendship_jo++
       
       #character_jo_thinking
       "Um... I'm not sure. I'm pretty tired, actually. I'll probably head home soon and relax before we gotta do this college thing all over again tomorrow."
       
       
       #character_jo_neutral
       "So... see ya buddy. Maybe I'll catch ya later." 
     
    
            -> END
     
     
          * * * See ya.
     
                 -> END
        
        
        * * [just stare at her]
        
        #character_jo_angry
        "...What the heck?!"
        
        #narration_bubble
        Jo stares back at you, until eventually getting creeped out and slowly backs away. 
        
        ~ friendship_jo--
        
        -> END



- else:
#character_jo #emotion_annoyed
"Oh. It's you." 

-> END

}

== Jo_Click_2 ==

{ friendship_jo >= 0: 
#character_frat_bro_neutral #location_library_mall
+\	{&"See ya later."|"I gotta go home."} -> END

- else:
#character_frat_bro_annoyed #location_library_mall
+\	{&"Leave me alone."|"..."} -> END

}

-> END

== Pi_Lam_Trifold == 

#location_library_mall
It's a purple trifold that looks like it's definitely been reused over the years.

-> END


//LIBRARY MALL END

//COLLEGE LIBRARY START

== PC == 

#location_college_library
Should I do some studying while I'm here? 

+ Yes

#location_college PC_pov
Let's see what's on Canvas for today... 
    // laptop opens and glows
        * * Check Canvas
            Hmm... I have an essay due today... a quiz due tomorrow... and a presentation due on Friday. 
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




//COLLEGE LIBRARY END


//SCIENCE HALL START

== Ghosthunter == 

#character_ghost_hunter_shocked #location_science_hall
"Hey... did you come here because of the post-it-note yesterday too?!"

#character_ghost_hunter_angry
"There's no doubt about it... there's spirits here... GHOSTS...
I don't know if they're evil entities or a pure spirits... trapped to wander this God-forsaken campus for all of eternity..." 

#character_ghost_hunter_neutral
"Either way, I HAVE to see. I skipped class today for this. That means I'm now obliged to skip class EVERY day. There's no going back."

#character_ghost_hunter_thinking
"I'm making some preparations... I've got my tools here... if you're interested, meet me at Bascom Hill tomorrow night. I'll be here during the day tomorrow preparing, but there's this... voice..."

#character_ghost_hunter_thinking
"It's telling me to go to Bascom Hill tomorrow... I can only hear the voice when I'm at Science Hall. Can you hear the voice too....?"

~ ending_ghost++
~ actions_taken++

-> END

== Infrared_Camera == 
#location_science_hall
An infrared-capable camera...captures photos and videos in total darkness, revealing details hidden by regular light.

-> END

== EMF_Reader == 
#location_science_hall
If the theory that ghosts are made of energy holds true, then an electromagnetic field gauge is an essential tool...

-> END

== Ghosthunters_Notebook == 
#location_science_hall
It's closed, but looks well-used. Maybe I can take a peek tomorrow when he's not here...

-> END

== Post_It_Note_Click_1 == 

#location_science_hall
There's something scribbled here... 

All according to plan... you shall be sacrficied.... together......

-> END

//note changes when player checks it again

== Post_It_Note_Click_2 == 

#location_science_hall
There's something scribbled here... 

"What is a 'Canvas Assignment' and why are you afraid of it? 

-> END

//SCIENCE HALL END


//BASCOM HILL START

== Bucky_Banner_Bascom_Hall == 

Seeing Bucky's face look down upon everyone, standing on the one and only Bascom Hill gasping for breath... it's a great day to be a Badger.

-> END

== Pink_Lawn_Flamingo == 

It seems someone left this hear from Fill the Hill... 

-> END

//BASCOM HILL END

== Tuesday_Over_Dialogue == 

It's getting late... maybe I should head home and rest up now. 

//FADE TO BLACK 
//Day End jingle

-> END





