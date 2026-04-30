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
VAR friendship_president = 0

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

//checks if player has officially joined frat
VAR joined_frat = true


== start ==

#sound_phone_alarm

DAWN OF THE FINAL DAY - FRIDAY
 
#character_roommate_happy
"It's Friday! Yippee!!" 

#character_roommate_thinking
"I love Fridays because I have absolutely NO classes! So today I'm just gonna chillax here."

#character_roommate_shocked
"Although, not for the WHOLE day..! I heard about a party happening later tonight! You should come with!"

#character_roommate_neutral
"...Oh! Also, hope it's alright, but I brought a friend over!"


  { ending_ghost >= 2: 
        
        After your roommate diverts his attention elsewhere, you hear a whisper in your ear...
        
        "You can't escape..."
        
        Who said that?
        
        }


//FADE IN: 

-> END

//LOCATION: DORM ROOM

// door -> map

== object_bucky_poster == 

Bucky is always watching. 

-> END

== object_bed ==

I probably shouldn't go back to sleep first thing in the morning...

-> END

== dorm_roommate == 

#character_roommate_happy
"Did I fail my midterm yesterday? Well it sure did feel like it!" 

#character_roommate_thinking
"But I won't know for sure until I get my grade back, so maybe there's still hope!"

#character_roommate_happy
"Either way, I'm going to celebrate getting it over with by just rotting in my room all day long!" 

#character_roommate_neutral
"Sometimes, it's good to take some time to just rot!" 

#character_roommate_confused
"Keyword... sometimes..." 

-> END 


== dorm_classmate == 

{ 

- friendship_classmate >= 4:

#character_classmate_happy
"Oh hey! I didn't know you lived here! What's up dawg!"

#character_classmate_thinking 
"I have a class with your roommate, and he invited me over to play some video games this morning! What were the odds?"

* "Can I join you guys?"

#character_classmate_happy #sound_friendship_up
"I don't see why not!" 
~ friendship_classmate++
~ friendship_classmate++

#character_roommate_happy
"Heck yeah dude! This is gonna be great!"

Your roommate hands you a video game controller and the three of you sit on the ground to play some video games... 

For... QUITE a while...

//screen fades to black 

//screen fades back in 

You guys have been gaming for 4 hours. 

#character_classmate_confused
"Well... this has been really fun! But I should probably start heading out now..." 

#character_roommate_happy
"Thanks for stopping by to hang out today! It was fun! Will I be seeing you at the party later today mayhaps?"

#character_classmate_happy
"Oh yeah! I'll be there! See you soon!" 

//Classmate character should leave the scene

#character_classmate_happy
"Man, this has been a great stay-at-home day!" 

~ actions_taken++ 
~ actions_taken++ 
~ actions_taken++ 
~ actions_taken++ 
~ actions_taken++ 


-> END

* "What about class?"

#character_classmate_thinking
"Oh yeah... I thought about it and I decided to skip today!"

#character_classmate_neutral
"This is the first day I'm even skipping... but I think it's worth it!"

#character_classmate_happy
"I've got an A in the class and I desserve a break!"

#character_classmate_confused
"Um... but YOU should still TOTALLY go! Can't miss those vital quiz points!"

~ actions_taken++ 

-> END
    
* "I don't want you here. LEAVE."

#character_classmate_annoyed #sound_friendship_down
"Um.... what? For your information, I'm a GUEST here pal. But fine! I'll leave!!!"
~ friendship_classmate--
~ friendship_classmate--
~ friendship_classmate--

#character_roommate_shocked
"Wait Morelia! Don't leave! My roommate is just being a douche for some reason..."

#character_roommate_annoyed
[whispering] "I want her to stay, okay? Don't mess this up for me man..."

#character_classmate_annoyed
"Whatever. I thought we were cool, but I guess not... so I'll just do my best to ignore you and you can do the same with me, yeah?"

~ actions_taken++ 
-> END

- friendship_classmate == 0:

#character_classmate_neutral
"...Hello."

* "Whatcha doin'?"

#character_classmate_confused
"Um... you know... just hanging around..."

#character_classmate_thinking
"Wait... Haven't I seen you before? Where do I know you from..."

#character_classmate_thinking
"Are you in Prof. Speedwagen's class?"

* * "Yes!"

#character_classmate_happy
"I knew it!" 

#character_classmate_thinking
"I'm skipping today. I don't feel bad since I've gotten basically 100s on everything so far. I deserve a break!"

#character_classmate_annoyed
"It's a pretty broad class not gonna lie..."

#character_classmate_neutral #sound_friendship_up
"Maybe I'll see you at next week's class!"
~ friendship_classmate++
~ actions_taken++

-> END

* * "Yes, but I always skip."

#character_classmate_shocked
"What? No dude... you gotta go!"

#character_classmate_thinking
"Our Prof. literally gives us a quiz every day! You're missing out on mad points dude!"

#character_classmate_neutral #sound_friendship_up
"...But not gonna lie, I'm skipping today too... but only cause I have such a good grade in the class! I earned it!"
~ friendship_classmate++
~ actions_taken++

-> END 

* * "WHO?"

#character_classmate_neutral
"Okay, Snoop Dogg, must've mistaken you for someone else. My bad."
~ actions_taken++
-> END

- else: 

#character_classmate_annoyed
"Oh. It's you."

#character_classmate_annoyed
"Don't ruin my day alright? I just want to hang out with my ACTUAL friend, and we can stay out of each other's way."
~ actions_taken++
-> END

}


-> END



//Desk POV Options:
//changes POV screen when clicks on desk

== dorm_desk_notebook == 

It's kinda... unused. I should really start taking notes during lecture.

-> END

== laptop == 

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
   
    Oops. Guess I left this here from last week. I'll throw it away later. 
    + Take a sip. 
    #sound_energy_down
        You grab it and bring it to your mouth. There's a funky smell eminating from it. After taking a swig, your tummy gurgles. It leave a weird taste in your mouth. 
            ~ actions_taken++ 
            ~ actions_taken++
            -> END
    + Ignore it. 

-> END 

== protein_bar_wrapper ==

There's nothing quite like whey protein mixed with sugar alcohols to replace an actually balanced meal. Convenient! Guess I also forgot to throw this away too.

-> END

== phone_doom_scrolling ==

You open up Instagram Reels. Nothing wrong with a little distraction for a couple minutes, right? 

#minigame_phone_scrolling

~ ending_burnt_out++
~ actions_taken++

//Screen FLASHES, ears ring for a little bit 
//not sure when this should be initiated, or should this dialogue just be cut completely?

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
        Oh snap... the day's over. -> day_over
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
//Frat House
//College Library 
//Science Hall 
//Bascom Hill
//Library Mall


// MEMORIAL UNION START

== Terrace_Chair == 

Sit down and enjoy the peaceful outdoors?

+ Relax
 
 ~ actions_taken++

//screen fades to black 

//fades back in to the scene 

Ahhh... the wonderful sounds of the waves crashing in the lake, the wind blowing in your face, and the chirps of birds fill the air. What a blessing to be able to attend this institution! 

-> END 

+ Leave

-> END 
 

== brat ==

It seems someone left over a perfectly good brat here! It's got all the fixins...

+ Take a bite

You take a big, juicy bite of the glizzy. The savory taste infultrates your tastebuds, and suddenly, life is worth living again. 
However, even more suddenly, a growing pain festers in the bottom of your stomach. How long had it been sitting out here? 

I need to go to the bathroom... quick....

#sound_energy_down
~ actions_taken++
~ actions_taken++

-> END

+ Ew

-> END

//MEMORIAL UNION END 


// UNION SOUTH START

== Barista == 

{ job_started == true:

#character_barista_thinking 
"...You sure you want to order from this side of the register? You could probably just make yourself something for free."

+ Of course! I love giving the Wisconsin Union money. 

#character_barista_neutral
    Oooookay. What can I get ya? 
    
     + + Espresso martini on the rocks
     
        #character_barista_confused
        "Um... I don't think... we have that... here..."
        
    
     #character_barista_happy
        "But... between you and me... I can hook you up... with my handy dandy flask! I never leave home without it!"
            
             He serves it to you almost instantanously... 
            
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
        
        { ending_ghost >= 1: 
        
        Wait... You see something scribbled on the cup... 
        
        "WE SEE YOU"
        
        That's... new.
        
        }
        
        -> END
        
        
     + + What do you recommend? 
     
     #character_barista_sad
     Honestly? Nothing. I don't think we've passed our most recent health inspection. 
     #character_barista_thinking
     But... I dunno, otherwise I think a glass of water would be pretty good? You look dehydrated. Did you want one?
     
     + + + Yes please!
     
     #character_barista_happy
      "Coming right up!"
        
        He serves it to you almost instantanously... 
        Refreshing! You feel a renewed sense of energy! 
        ~ actions_taken--
        
          { ending_ghost >= 1: 
        
        Wait... You see something scribbled on the cup... 
        
        "WE SEE YOU"
        
        That's... new.
        
        }
     
     -> END
     
     + + + No... thanks...
     
     #character_barista_neutral
     
     "Alright... suit yer self." 
     
     -> END
     
     
     + + Your latest seasonal beverage. 
    
    #character_barista_thinking
    "Hmmmm... which one was that again?"
    
    #character_barista_shocked
    "Oh right! The espresso-triple-shot-mocha-almond-milk-protein-lavendar-boba-skinny-cup-a-joe!"
    
     #character_barista_happy
    "Coming right up!"
        
        He serves it to you almost instantanously... 
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
        
          { ending_ghost >= 1: 
        
        Wait... You see something scribbled on the cup... 
        
        "WE SEE YOU"
        
        That's... new.
        
        }
    
    -> END

+ You're so right. 

#character_barista_happy
"Dude, it's one of the main perks of working here. In fact, why else would you choose this place if not for that?" 

#character_barista_shocked
"Hey... next time you clock in, would ya wanna do a blind taste testing of all the different milks...? Whole... 2%... almond... oat... skim..."

#character_barista_confused
"On our down time... heh... obviously..." 

    + + OF COURSE!
    
  ~  friendship_barista++
    
    #character_barista_happy #sound_friendship_up
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
    
* Espresso martini on the rocks
     
        #character_barista_confused
        "Um... I don't think... we have that... here..."
        
    
     #character_barista_happy
        "But... between you and me... I can hook you up... with my handy dandy flask! I never leave home without it!"
            
             He serves it to you almost instantanously... 
            
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
        
        { ending_ghost >= 1: 
        
        Wait... You see something scribbled on the cup... 
        
        "WE SEE YOU"
        
        That's... new.
        
        }
        
        -> END
        
        
*  What do you recommend? 
     
     #character_barista_sad
     Honestly? Nothing. I don't think we've passed our most recent health inspection. 
     #character_barista_thinking
     But... I dunno, otherwise I think a glass of water would be pretty good? You look dehydrated. Did you want one?
     
     * * Yes please!
     
     #character_barista_happy
      "Coming right up!"
        
        He serves it to you almost instantanously... 
        Refreshing! You feel a renewed sense of energy! 
        ~ actions_taken--
        
          { ending_ghost >= 1: 
        
        Wait... You see something scribbled on the cup... 
        
        "WE SEE YOU"
        
        That's... new.
        
        }
     
     -> END
     
     * * No... thanks...
     
     #character_barista_neutral
     
     "Alright... suit yer self." 
     
     -> END
     
     
     
*  Your latest seasonal beverage. 
    
    #character_barista_thinking
    "Hmmmm... which one was that again?"
    
    #character_barista_shocked
    "Oh right! The espresso-triple-shot-mocha-almond-milk-protein-lavendar-boba-skinny-cup-a-joe!"
    
     #character_barista_happy
    "Coming right up!"
        
        He serves it to you almost instantanously... 
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
        
          { ending_ghost >= 1: 
        
        Wait... You see something scribbled on the cup... 
        
        "WE SEE YOU"
        
        That's... new.
        
        }
    
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

#minigame_coffee
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


== cash_register == 

#character_barista_angry
"Nope! Don't even THINK about it. Only I have access to the register... my sweet..."

-> END


== ghosthunter_coffee == 

#character_ghost_hunter_shocked
"Just gettin' my pick-me-up before I go back to huntin' ghosts! You know how it is!"

-> END

// UNION SOUTH END

// GORDON'S LAWN START


== cheese_club_trifold == 
//same one from Tuesday, now placed on the ground

This trifold looks like it's been used and reused for a few years now. They have a complex cheese family diagram, along with pictures of them at a cheese curd crawl. 

Too bad it has now seemingly been abandonded on this lawn... slowly deteriorating... 

-> END 

== spike_ball_setup == 

Ah yes, the classic Gordon's Lawn collegiate sport. Spike Ball. Where are the shirtless frat boys to match?

-> END 

== inflatable_bucky == 

Ah yes, our cult leader rises once more to bring inspiration and school pride to an otherwise mindless, careless and desolate generation.  

-> END


// GORDON'S LAWN END 

// LIBRARY MALL START


== Cheese_Club_President == 

#character_cheese_president_happy
"Hey hey HEY!"

#character_cheese_president_thinking
"Thanks for stopping by! Are you here for the Cheese Club event tonight? Ready to get started?!"

[Note: Initiating the Cheese Club event will result in the day being over at the conclusion of the event.]

* Yeah!

#character_cheese_president_happy #sound_friendship_up
"Yes!! Awesome! This is so exciting!!"

~ friendship_president++

//cheese minigame!

#minigame_cheese


~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++

//can you potentially just force end the day? wondering how it would work if players spam drinking coffees and the variable never reaches 10...
//low key that part of the game might just be broken ngl

-> END

* No!

#character_cheese_president_sad
"Aw... okay... "

#character_cheese_president_neutral
"Let me know when you're ready to get started!"

~ actions_taken++

-> END

== Jo_Cheese == 

{ 

- friendship_jo >= 1:

#character_jo_happy
"Oh hey! I swear we keep running into each other!"

#character_jo_shocked
"I heard there's going to be some sort of CHEESE EXTRAVAGANZA here..."

#character_jo_happy
"Of course I had to check this out! You here for the event too?"

* "Are you in the cheese club?"

#character_jo_thinking
"Not offically... I'm afraid of comittment..." 

#character_jo_neutral
"But after this event I might be! I'm going to be first in line for all this cheese!" 

~ actions_taken++

-> END

* "Ew, you like cheese?"

#character_jo_confused
"Um... did I hear you correctly? Ain't no way you said that."

#character_jo_neutral
"Heck yeah I like cheese! You're missing out man!"

~ actions_taken++

-> END
    
 * I'm lactose intolerant.
 
 #character_jo_shocked
"Oooooooh! Yikes! That's gotta suck."

 #character_jo_sad
"God gives his toughest battles for his strongest soldiers..."

 #character_jo_happy
"Feel free to watch me chow down on this cheese! Live vicariously!"
    
    ~ actions_taken++
    
    -> END

- friendship_jo == 0:

#character_jo_neutral
"...Sup."

* "Whatcha doin'?"

#character_jo_neutral
"Just enjoying the beautiful sight that is this cheese setup. How 'bout you?"

* * "I'm just enjoying this beautiful day!"

#character_jo_happy
"Wow! So happy for you dude. What's your name? I like your vibe." 

    * * * I'm more of a mysterious brooding type. 
    
    #character_jo_happy #sound_friendship_up
    "Pfffffft! You're ridiculous!"
    ~ friendship_jo++
    ~ actions_taken++
    
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
    ~ actions_taken++


-> END

* * "I hate it here."

#character_jo_thinking
"Y'know, every now and then, college will have you feeling that type of way. But then things like this cheese setup revitalize my will to live... What's your name Mr. Emo Man?" 
    
    * * * I'm more of a mysterious brooding type. 
    
    #character_jo_happy #sound_friendship_up
    "Pfffffft! You're ridiculous!"
    ~ friendship_jo++
    ~ actions_taken++
    
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
    ~ actions_taken++

-> END 

* "Are you a lesbian or something?"
#character_jo_happy
"Now that IS the million dollar question isn't it?" 

#character_jo_shocked
"Why... are YOU a lesbian?" 

#character_jo_thinking
"In any case, I don't think the sexuality of a stranger should concern you very much."

#character_jo_happy
"Well... not yet at least..."

-> END

- else: 

#character_jo_annoyed
"No... No... no... I'm not going to let you ruin this moment."

#character_jo_sad
"Can't you just leave me be? I just want to enjoy some cheese!"

#character_jo_annoyed #thought_bubble
"I hate this campus, there's so many creeps around!"

-> END

}


-> END



// LIBRARY MALL END

// MOSSE START

== mosse_class ==

{actions_taken >= 9:
Alright... made it to Mosse. 

Except.... wait, where's my class again? 

You would think after so many days I'd get the hang of this...

Room 2340..... 

//I don't think there will be any dialogue here, but should still switch scenes depending on which arrow the player clicks on in order to traverse the halls and get to the correct room

//this then leads to class scene, which is not accessible if player does not go to mosse first

- else: 

Yeah... I definitely did NOT make it to class on time...

  { ending_ghost >= 1: 
        
        It feels... TOO quiet...
        
        Almost like you're being watched... 
        
        
        }

}

~ actions_taken++

-> END

== mosse_class_door == 

{

- actions_taken >= 9:

You enter the classroom. You've made it just barely on time, but it looks like a lot of people decided to skip today...

You take a seat in the middle of the lecture hall. 

#character_prof_neutral
"Alright everyone, let's get started!"

#character_prof_happy
"Thank you to everyone who saw how beautiful of a day today was, and decided to spend it cooped up indoors in this musty lecture hall!"

#character_prof_happy
    "Today we'll be going over basic algebra concepts! Yes, hold back your cheers! We need to focus!"
    
 #minigame_trivia_math
 
 ~ actions_taken++
 ~ ending_perfect_student++
 
 #location_mosse_after_class_lecture_hall

-> END


- else: 

Class is over... no one is here...

}


-> END 


// MOSSE END

// FRAT HOUSE START

== Frat_Bro_Entrance == 

{ 

- joined_frat == true:

#character_frat_bro_happy
"Heyyyyyyy look who it is!" 

#character_frat_bro_neutral
"We were hoping you'd make it tonight, pledge!"

~ ending_party++
~ ending_party++

#character_frat_bro_thinking
"Go on, check out the party!"


#character_frat_bro_happy #sound_friendship_up
"Hell yeah! You won't regret this dude"

 ~ friendship_frat_bro++

#character_frat_happy
"We're having a party tomorrow to welcome all our new pledges... so stop by tomorrow and see what we're about!"

Note: If you visit the frat house tomorrow, the day will automatically turn into night and the day will immediately end after the party. 

#character_frat_thinking
"Now... since it's Thirsty Thursday, if it were up to me, I'd invite you to the bars with us later tonight... but we can't invite pledges just yet. 

#character_frat_happy
"Rules are rules. See ya tomorrow pledge."

~actions_taken++
~ ending_party++


-> END 

- else if: 

#character_frat_bro_annoyed 
"Hey! Who's this dude? Did anyone invite this guy...?"

#character_roommate_neutral
"Oh! Hey you made it!"

#character_roommate_happy
"Don't worry man, he's with me!"

#character_frat_bro_annoyed 
"Hmm... if you say so. Alright come on in..."

#character_roommate_neutral #location_frat_basement #music_party
"Don't worry, you can thank me later."

}

//the rest of these dialogues all take place in the basement 
//cycle through dancing animations for each character (all there, so it's crowded!)

== Frat_Bro_2 == 

"Hey, you down to play a game?"

+ Sure

#minigame_party_cup

~actions_taken++
~ending_party++

-> END


+ Nah...

~actions_taken++

-> END


== Frat_Bro_3 == 

He's unresponsive. 

#character_frat_bro_happy
"Oh don't worry about him... He always gets like this at parties." 

~actions_taken++

-> END

== Frat_Bro_4 == 

"The man to woman ratio is NOT where it's supposed to be right now... Who's letting these people in?!"

~actions_taken++

-> END

== Frat_Bro_5 == 

"DO YOU FEEL THE RHYTHM? DO YOU FEEL THE GROOVE?!"

~actions_taken++

-> END

== Roommate_Party == 

#character_roommate_happy
"So glad you made it dude!"

#character_roommate_thinking
"Now... here's the plan... you and I are BOTH finding love at this frat party!"

#character_roommate_happy
"...Said no one ever! C'mon, let's see you bust a move!"

~ actions_taken++

-> END

== Jo_Party == 

#character_jo_annoyed #thought_bubble
"Ugh... it's so humid and sticky in here..."

{

- friendship_jo >= 3:

#character_jo_happy
"Oh...  my gosh! It's YOU!"

Upon seeing you Jo runs over and gives you a hug. 

* Push her off of you

You immediately push Jo into the barista, causing the barista to shove your roommate.

#character_jo_annoyed #sound_friendship_down
"Ugh! HEY! What the heck!?"

~ friendship_jo--
~ friendship_jo--
~ friendship_jo--
~ friendship_barista--

#character_barista_confused
"Dude! Watch it!"

#character_roommate_annoyed
"Wha-? Dude why are you physically abusing girls?! And worst of all... ME?!"

~ actions_taken++
~ actions_taken++

-> END

* "Are you drunk?"

#character_jo_shocked
"WHAAAAAAAAAT? I can't hear you with how loud this music is!"

#character_jo_neutral
"All I know is I'm having a great time! Especially now that YOU'RE here!"

#character_jo_happy
"I wanna see you dance! C'mon! Show me what you've got!"

~ actions_taken++

-> END

* Hug her back 

#character_jo_shocked
"Wha- Oh my gosh, I'm so sorry, I don't know what I'm doing!"

She backs away from you. 

#character_jo_happy
"S-sorry! I'm so embarrassed! Guess I just got a little excited!" 

~ actions_taken++

-> END

- friendship_jo >= 1:

#character_jo_neutral
"Oh... hey! It's you!"

#character_jo_happy
"Nice to see a somewhat familiar face around these parts!"

~ actions_taken++

-> END

- friendship_jo == 0:

She's too busy dancing to notice you.

~ actions_taken++

-> END

- else: 

Upon making eye contact with you, Jo immediately splashes her drink onto your face, then throws her cup at you.

The crowd around you starts chuckling...

She holds her hand out and someone immediately places another drink in her hand. She stares daggers at you, as if threatening you to just TRY and talk to her again.

~ actions_taken++

-> END

}

-> END

== Barista_Party == 

#character_barista_thinking
"O-okay... I came here as sober as can be so I can have the mental capability to talk to a girl tonight..."

#character_barista_shocked
"AGH! Who am I even kidding..."

#character_barista_drinking
"[glug glug glug glug glug...]"

~ actions_taken++

-> END

==Ghosthunter_Party== 

#character_ghost_hunter_happy
"Even I need a break from hunting campus ghosts sometimes!"

~ actions_taken++

-> END

==Cheese_Club_President_Party== 

#character_cheese_president_happy
"Clean up for the cheese club event went smoother than expected, so I was able to make it to the party!"

#character_cheese_president_thinking
"Also... what's cheddka and why did someone ask me if I had some?"

~ actions_taken++

-> END

==Classmate_Party== 

#character_classmate_neutral
"..."

#character_cheese_president_thinking
"Drunk people are so entertaining..."

~ actions_taken++

-> END

// FRAT HOUSE END 



//COLLEGE LIBRARY START

== PC == 

Should I do some studying while I'm here? 

+ Yes

#location_college_PC_pov
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


==Library_Front_Desk_Student==

They're asleep on the job... must've had the 12AM-6AM shift too...

Man, that's also the fourth day in a row they're like this... 

Maybe someone should check on them?

-> END


== cheese_table ==
//in same room cheese club meeting was in yesterday


There's so many options to snack on here! Cheese cubes, cheese dip, grilled cheese, cheese puffs, goldfish... cheesecake...

I'm pretty sure this has just been sitting here since Wednesday... It doesn't smell very good...

  { ending_ghost >= 1: 
        
       It’s quieter than usual...

    Not peaceful quiet... like... someone is watching you quiet.
        
    }

-> END

//COLLEGE LIBRARY END


//SCIENCE HALL START


== Science_Hall_Icon == 

Note: If you enter Science Hall, the day will turn to night and you will not be able to come back.

Do you with to continue?

* Yes

//proceeds to Science Hall Scene

-> END

* No

-> END

== Ghosthunter == 

{ ending_ghost == 0:

#character_ghost_hunter_shocked
"There's no doubt about it... there's spirits here... GHOSTS..."

#character_ghost_hunter_sad
"They've been leaving signs all over this place for us to find... they're trying to communicate with us..."

#character_ghost_hunter_shocked
"Have you heard of all the campus lore and ghost stories?! There's so much! It CAN'T just be a coincedence! This campus is just too old for there to be zero ghosts..."

#character_ghost_hunter_thinking
"I don't know if they're evil entities or pure spirits... trapped to wander this God-forsaken campus for all of eternity..." 

#character_ghost_hunter_neutral
"Either way, I HAVE to see. I skipped class today for this. That means I'm now obliged to skip class EVERY day. There's no going back."

#character_ghost_hunter_shocked
"But there's this... this voice..."

#character_ghost_hunter_thinking
"It's telling me to go to Bascom Hill today... I can only hear the voice when I'm at Science Hall. Can you hear the voice too....?"

#character_ghost_hunter_neutral #thought_bubble
"...I sound REAL crazy, don't I?"

#character_ghost_hunter_neutral
"...I'm making some preparations... I've got my tools here... would you want to come with me to investigate?"

* Yes


~ ending_ghost++
~ actions_taken++

#character_ghost_hunter_happy
"Awesome! I'm so glad I finally found someone as passionate as I am!"

#character_ghost_hunter_neutral
"Let's go to Bascom Hil..."

#location_bascom_hill_night
#character_ghost_hunter_neutral
"Okay... we made it..."

#character_ghost_hunter_confused
"I'm getting a reading here..." 

#character_ghost_hunter_thinking
"Let's go inside... the energy is stronger the closer we get..." 

#location_bascom_hall_night
#character_ghost_hunter_neutral
"Okay... let's see if we find anything... I don't hear the voice anymore, so this is going to be a little more difficult..."

#minigame_ghost_hunt

#visual_flash

#character_ghost_hunter_shocked
"THERE! What is THAT?!"

You hear a quiet whisper... almost as if someone was whispering directly into your ear... 

"Warren... lightning..."

"Nelson.... forgotten...." 

You turn to your fellow ghosthunter, and he looks as if he is also in a daze... 

#character_ghost_hunter_shocked
"T-take a picture man! Try to capture.... something!"

This whispering gets louder... 

"Forgotten... FORGOTTEN..." 

Suddenly... two ghostly figures appear before you...

#visual_flash
#sound_ears_ringing

What... what's going on? 

Where... is everyone...

~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++
~ actions_taken++

//force day end?

-> END


* Heck no!

#character_ghost_hunter_sad
"That's alright... don't gotta risk yourself for this."

-> END


- else: 


#character_ghost_hunter_shocked
"Dude... YOU'RE ALIVE!"

#character_ghost_hunter_sad
"I have NO IDEA what HAPPENED last night! It's all so... so..." 

#character_ghost_hunter_shocked #exclamation_bubble
"ENTHRALLING!!!"

#character_ghost_hunter_thinking
"...."

#character_ghost_hunter_thinking
"Campus feels... different at night, doesn't it?"

#character_ghost_hunter_confused
"Even before I've come back to Science Hall... something feels... different..."

#character_ghost_hunter_thinking
"Like... IT'S been waiting for this...."

#character_ghost_hunter_confused
"Do you feel that too?"

#visuals_lights_flickering

* "We need to keep going with this."

#character_ghost_hunter_neutral
"You're right. We need to get to the bottom of this."

#character_ghost_hunter_thinking
"I'm definitely putting this on my resume..."

//scene goes to black, only the text box appears

You move deeper into the building with the ghosthunter.

The air feels heavier... 

#minigame_ghost

-> END

* [Call out to the ghosts] "Hello?"

#character_ghost_hunter_confused
"..."

#visual_effect_lights_flickering
#sound_crashing
#sound_wind_blowing

#character_ghost_hunter_shocked
"WHAT'S GOING ON?"

#minigame_ghost

-> END

}

== Haunted_Ending_Scene ==

//occurs post ghost minigame

//two ghsotly figures appear on the screen, everything else is dark so this is the only thing we see...

#character_ghost_hunter_shocked
"Whatever you do. Don't. Run."

#character_ghost_hunter_thinking
"In fact...."

#character_ghost_hunter_happy
"Embrace it..."

* "What's going on?"

#character_ghostly_figures
"You've been..."

#character_ghostly_figures
"...asking that all week..."

#sound_footsteps

-> END 

*"I shouldn't be here anymore..."

#character_ghostly_figures
"And yet... you are."

#character_ghostly_figures
"Again... and again... and again..."

#sound_footsteps

* * "This is more interesting that everything else."

#character_ghostly_figures
"Yes..."

#character_ghostly_figures
"You understand."

#character_ghostly_figures
"We stayed..."

#character_ghostly_figures
"There was more to do..."

#character_ghostly_figures
"There's always more to do..."

#sound_thunder

//screen goes completely black

Everything goes dark. 

Complete radio silence. 

You try to escape Science Hall... 

You can't find the ghosthunter anymore... 

But for some reason... 

The hallways keep looping. The exit keeps leading to just another classroom. 

You try to scream. But no one can hear. 

You can never escape.

#sound_ending_jingle
ENDING: HAUNTED IN SCIENCE HALL

-> END


* * "I didn't mean for this to happen."

#character_ghostly_figures
"That doesn't matter now..."

#character_ghostly_figures
"We stayed..."

#character_ghostly_figures
"There was more to do..."

#character_ghostly_figures
"There's always more to do..."

#sound_thunder

//screen goes completely black

Everything goes dark. 

Complete radio silence. 

You try to escape Science Hall... 

You can't find the ghosthunter anymore... 

But for some reason... 

The hallways keep looping. The exit keeps leading to just another classroom. 

You try to scream. But no one can hear. 

You can never escape.

ENDING: HAUNTED IN SCIENCE HALL


-> END

== Infrared_Camera == 

An infrared-capable camera...captures photos and videos in total darkness, revealing details hidden by regular light.

-> END

== EMF_Reader == 

If the theory that ghosts are made of energy holds true, then an electromagnetic field gauge is an essential tool...

-> END

== Ghosthunters_Notebook == 

It's closed, but looks well-used. I'm a little scared to see what he's written inside...

-> END

== Newspaper_1 ==

It's a newspaper article...

HAUNTED HISTORY: THE LEGEND OF SCIENCE HALL

Subsections: Foosteps Behind You... The Spirit of Science Hall...Bodies in the Walls...The Cadaver Chute...An Unseen Hand...

-> END

== Newspaper_2 ==

It's a newspaper article...

HAUNTED HISTORY: BASCOM'S BODIES

William Nelson and Samuel Warren were buried on Bascom Hill in the 1830s, but their graves weren’t discovered until the 1900s when workers were installing the Lincoln statue.

Today, their graves are marked with small brass plaques to the left of the statue. 

Passersby on Bascom have reported sightings of two ghostly figures walking the hill at night, and some even swear they’ve heard the two names whispered in Bascom Hall.


-> END


== Newspaper_3 ==

It's a newspaper article... 

HAUNTED HISTORY: BOOOOOKS!

Reports of Helen C. White’s spirit floating in the stacks of Memorial Library have gained enough notoriety that the legends made it onto Encyclopedia Britannica’s list of haunted libraries.

It remains a mystery why she might haunt Memorial and not her namesake library, but students, librarians and visitors alike have sworn to see her wandering around — some even claiming they hear her whispering from the shelves.


-> END

== Post_It_Note_Click_1 == 

There's something scribbled here... 

"You left."

"So I followed."

-> END

//SCIENCE HALL END


//BASCOM HILL START

== Bucky_Banner_Bascom_Hall == 

Seeing Bucky's face look down upon everyone, standing on the one and only Bascom Hill gasping for breath... it's a great day to be a Badger.

-> END

== Pink_Lawn_Flamingo == 

It seems someone left this here from Fill the Hill... 

It's like... it's like it's watching you... with those googly eyes...

-> END


//BASCOM HILL END

== day_over == 

It's getting late... guess it's time to call it a day! 

//FADE TO BLACK 
#sound_day_end_jingle


//checks friendship meters and adds to perfect student path if applicable...

{
- friendship_jo >= 5:
~ ending_perfect_student++
~ ending_perfect_student++
}

{
- friendship_classmate >= 5:
~ ending_perfect_student++
~ ending_perfect_student++
}
{
- friendship_barista >= 1:
~ ending_perfect_student++
}
{
- friendship_president >= 3:
~ ending_perfect_student++
~ ending_perfect_student++
}

{


- ending_barista > ending_perfect_student:

You finally finished a week of college! 

Week after week... those little decisions add up... leading you down a certain path in life... 

#fade_in
4 YEARS LATER...
#fade_out

#cutscene_barista_ending #fade_in
You picked up a shift.

Then another.

Then another...

At some point, you stopped checking your Canvas. 

...But you knew the drink menu by heart.

You learned people’s orders. Their routines. Their names.

You were good at this. REALLY good!

Eventually, you stopped going to class.

Not by accident... By choice.

Years later, you open your own café.

It’s small... But it’s yours.

You didn’t finish college.

But you found something that fit better.

ENDING: COLLEGE NOT FOR ME

-> END


- ending_perfect_student >= 15:

You finally finished a week of college! 

Week after week... those little decisions add up... leading you down a certain path in life... 

#fade_in
4 YEARS LATER...
#fade_out

#cutscene_perfect_student_ending #fade_in
You went to class. Every time.

You checked every deadline twice. Then a third time, just in case.

You joined clubs... networked with peers...

Introduced yourself to professors before they introduced themselves to you.

You did everything right, and it worked!

You graduate with honors!

Your calendar is full... Your inbox is even fuller.

Opportunities line up exactly where they should!

You made the most of your time here at UW. 

Congrats Badger! You did it!

ENDING: PERFECT STUDENT

-> END


- ending_party >= 4: 

You finally finished a week of college! 

Week after week... those little decisions add up... leading you down a certain path in life... 

#fade_in
4 YEARS LATER...
#fade_out

#cutscene_party_ending #fade_in
You met a lot of people.

You just don’t remember most of their names.

Or what day it is.

Or when your last class was.

But the parties?

Those you remember.

Actually... no, you don't remember those either.

You became a campus legend.

Not academically, but definitely... socially.

You leave college with stories.

A LOT of stories.

But no degree.

And potentially also a drinking problem...

ENDING: PARTY ANIMAL

-> END

- ending_burnt_out >= 8:

You finally finished a week of college! 

Week after week... those little decisions add up... leading you down a certain path in life... 

#fade_in
4 YEARS LATER...
#fade_out

#cutscene_burnt_out_ending #fade_in
You stayed up late.

Then later...

You told yourself it was temporary.

Just ONE MORE assignment.

Just 5 more minutes of scrolling...

You stopped leaving your room. 

You stopped checking in with yourself.

Then... the coffee stopped working.

Eventually, something had to give.

It was you...

You step away from school.

Not as a failure... but because you had to.

Rest isn’t optional. You just wish you realized that sooner.

ENDING: BURNT OUT

-> END

- else if: 
//average student ending 

You finally finished a week of college! 

Week after week... those little decisions add up... leading you down a certain path in life... 

#fade_in
4 YEARS LATER...
#fade_out

#cutscene_average_ending #fade_in
You went to class. Sometimes.

You did your assignments. Eventually.

You met people.

You drifted from most of them.

You meant to join clubs.

But ya didn’t...

You THOUGHT about doing more.

A lot more, actually.

And then...

it was over.

You graduate.

Nothing went wrong...

...but nothing really happened either.

ENDING: COMPLETELY AVERAGE

}

-> END