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


== start ==

#sound_phone_alarm

DAY 4 - THURSDAY
 
#character_roommate_neutral 
"What's going on dude! We made it to Thursday." 

#character_roommate_shocked
"I heard that there was some weird GHOST activity seen yesterday at Science Hall and Bascom Hall... Isn't that crazy?!"

#character_roommate_shocked
"I'm gonna be staying away from those places FOR SURE..."

#character_roommate_sad
"...N-not that I even belive in ghosts. But... you also never know..."

#character_roommate_happy
"Anyways! Have fun at class! I know how much you love going!"

  { ending_ghost >= 1: 
        
        After your roommate leaves, you hear a whisper in your ear...
        
        "Come back..."
        
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
        You grab it and bring it to your mouth. There's a funky smell eminating from it. After taking a swig, your tummy gurgles. It leave a weird taste in your mouth. 
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

== Roommate_Memorial_Union == 

#character_roommate_thinking
"...You ever just stare at the lake... the great blue beyond... and realize how small and insignificant you are?"

#character_roommate_sad
"...You ever just stare at the lake... and realize... failing an exam isn't even close to being the worst thing in the world?"

#character_roommate_annoyed
"...You ever just stare at the lake... and realize... life is so much more than just getting a degree...?"

#character_roommate_sad
"...Who am I kidding."

#character_roommate_confused
"...I'm definitely going to fail this midterm. My parents are going to KILL ME!"

-> END
 

== brat ==

It seems someone left over a perfectly good brat here! It's got all the fixins...

+ Take a bite

You take a big, juicy bite of the glizzy. The savory taste infultrates your tastebuds, and suddenly, life is worth living again. 
However, even more suddenly, a growing pain festers in the bottom of your stomach. How long had it been sitting out here? 

I need to go to the bathroom... quick....

#sound_energy_down
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
     But... I dunno, otherwise I think a mocha frappe would be pretty good? Did you want one?
     
     + + + Yes please!
     
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
     
     + + + No... thanks...
     
     #character_barista_neutral
     
     "Alright... suit yer self." 
     
       { ending_ghost >= 1: 
        
        Wait... You see something scribbled on the cup... 
        
        "WE SEE YOU"
        
        That's... new.
        
        }
     
     -> END
     
     
     + + Your latest seasonal beverage. 
    
    #character_barista_thinking
    "Hmmmm... which one was that again?"
    
    #character_barista_shocked
    "Oh right! The protein-mocha-refresher-dragonfruit-pistachio-skinny-smoothie!"
    
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
"Hey... next time you clock in, would ya wanna try all of the new seasonal foam topping flavors? On our down time... heh... obviously..." 

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
    
 + Espresso martini on the rocks
     
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
        
        
     + What do you recommend? 
     
     #character_barista_sad
     Honestly? Nothing. I don't think we've passed our most recent health inspection. 
     #character_barista_thinking
     But... I dunno, otherwise I think a mocha frappe would be pretty good? Did you want one?
     
     + +  Yes please!
     
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
     
     + +  No... thanks...
     
     #character_barista_neutral
     
     "Alright... suit yer self." 
     
     -> END
     
     
     +  Your latest seasonal beverage. 
    
    #character_barista_thinking
    "Hmmmm... which one was that again?"
    
    #character_barista_shocked
    "Oh right! The protein-mocha-refresher-dragonfruit-pistachio-skinny-smoothie!"
    
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

#character_ghost_hunter_angry
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
"I know what you're thinking... doesn't this lady ever catch a break?"

#character_cheese_president_happy
"And the answer is no! The life of a student org president is one of constant strain and responsibility!"

#character_cheese_president_neutral
"Right now I'm interviewing random passerby students about their favorite cheese for an Instagram reel!"

#character_cheese_president_shocked
"We gotta do everything in our power to promote this event tomorrow!"

#character_cheese_president_happy
"Want to be in the video?!"

* Yeah!

#character_cheese_president_happy #sound_friendship_up
"Yes!! Awesome!"

~ friendship_president++

She pulls out her phone and immediately starts recording you. 

#character_cheese_president_happy
"Alright! What's your favorite cheese?!"

    * * Cheddar!

    #character_cheese_president_happy
"A very popular answer! Might I even say... basic!"

 #character_cheese_president_neutral
"Thanks for your help! You should check out our Instagram to see yourself!"

    -> END
    
    
    * * Mozzarella!
    
    #character_cheese_president_happy
"A very popular answer! Might I even say... basic!"

 #character_cheese_president_neutral
"Thanks for your help! You should check out our Instagram to see yourself!"

    -> END
    
    
    
    * * I don't know...
    
#character_cheese_president_happy
"I know what you're saying! There's just too many types to choose from!!"
    
 #character_cheese_president_neutral
"Thanks for your help! You should check out our Instagram to see yourself!"
    
    -> END

* No!

#character_cheese_president_happy #sound_friendship_down
"Aw... okay... "

~ friendship_president--
~ actions_taken++

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

-> END

== mosse_class_door == 

{

- actions_taken >= 9:

You enter the classroom. It looks like most people aren't here yet... not even the professor. You're early!

You take a seat in the middle of the lecture hall. 

Suddenly, your classmate appears outta nowhere.

#character_classmate_neutral
"Um... hey... can I ask you a favor?" 

#character_classmate_thinking
"Do you have the notes from yesterday's class? I didn't have my sketchbook with me and I'm afraid I missed some important stuff..."

#character_classmate_annoyed
"And you're kind of the only person I really recognize in this class so..."

* "Yeah you can see my notes!"

#character_classmate_neutral #sound_friendship_up
"Awesome, thanks man!"

You hand her your notebook. 

#character_classmate_thinking
"Um... 

#character_classmate_confused
"Uh... there's nothing in here..."

#character_classmate_annoyed #sound_friendship_down
"Are you messing with me?!"

~ friendship_classmate--

#character_classmate_annoyed
"Psh. Forget I asked dude."

#character_prof_neutral
"Alright everyone, let's get started!"

As you open your laptop, you see your classmate from you peripheral vision. She's staring daggers.

You think nothing of it, and instead decide to focus on class. 

#character_prof_happy
    "Today we'll be going over the incredibly complex English language! Yes, hold back your cheers! We need to focus!"
    
 #minigame_trivia_english
 
 #location_mosse_after_class_lecture_hall
 
 

-> END


* "I don't take any notes."

#character_classmate_thinking
"Whaaaat? How? You just wing your quizes or something?

#character_classmate_confused
"Well uh... thanks anyways I guess..."

#character_prof_neutral
"Alright everyone, let's get started!"

As you open your laptop, you see your classmate from you peripheral vision. She's staring daggers.

You think nothing of it, and instead decide to focus on class. 

#character_prof_happy
    "Today we'll be going over the incredibly complex English language! Yes, hold back your cheers! We need to focus!"
    
 #minigame_trivia_english
 
 #location_mosse_after_class_lecture_hall

-> END


* "Sucks to suck."

#character_classmate_annoyed #sound_friendship_down
"Psh. Forget I asked dude."

~ friendship_classmate--

#character_prof_neutral
"Alright everyone, let's get started!"

As you open your laptop, you see your classmate from you peripheral vision. She's staring daggers.

You think nothing of it, and instead decide to focus on class. 

#character_prof_happy
    "Today we'll be going over the incredibly complex English language! Yes, hold back your cheers! We need to focus!"
    
 #minigame_trivia_english
 
 #location_mosse_after_class_lecture_hall
 
 Class is over... no one is here...

-> END


- else: 

Class is over... no one is here...

}


-> END 


// MOSSE END

// FRAT HOUSE START

== Frat_Bro == 

{ 

- friendship_frat_bro >= 3:

#character_frat_bro_happy
"Heyyyyyyy it's the man of the hour!" 

#character_frat_bro_neutral
"We were hoping you'd stop by!"

#character_frat_bro_thinking
"The brotherhood would like to offer you a bid to join. Do you accept?"

* "Heck yeah!"

#character_frat_bro_happy #sound_friendship_up
"Hell yeah! You won't regret this dude"

 ~ friendship_frat_bro++

#character_frat_happy
"We're having a party tomorrow to welcome all our new pledges... so stop by tomorrow and see what we're about!"

Note: If you visit the frat house tomorrow, the day will automatically turn into night and the day will immediately end after the party. 

#character_frat_thinkiing
"Now... since it's Thirsty Thursday, if it were up to me, I'd invite you to the bars with us later tonight... but we can't invite pledges just yet. 

#character_frat_happy
"Rules are rules. See ya tomorrow pledge."

~actions_taken++
~ ending_party++
VAR joined_frat = true

-> END 

* "No thanks."

#character_frat_bro_annoyed #sound_friendship_down
"Uhhhh... then why'd you even come dude?"

"That's a shame. Yep... a shame. We saw a lot of potential in you." 

 ~ friendship_frat_bro--
  ~ friendship_frat_bro--
  ~ actions_taken++
  
  //screen is forced to the map 

-> END

* "I feel like this choice will affect my future in ways I don’t fully understand."

#character_frat_bro_thinking #thought_bubble
"...Is bro okay?" 

#character_frat_confused
"Uh.... is that a yes or a no dude?"

* * "Heck yeah!"

#character_frat_bro_happy #sound_friendship_up
"Hell yeah! You won't regret this dude"

 ~ friendship_frat_bro++

#character_frat_happy
"We're having a party tomorrow to welcome all our new pledges... so stop by tomorrow and see what we're about!"

Note: If you visit the frat house tomorrow, the day will automatically turn into night and the day will immediately end after the party. 

#character_frat_thinkiing
"Now... since it's Thirsty Thursday, if it were up to me, I'd invite you to the bars with us later tonight... but we can't invite pledges just yet. 

#character_frat_happy
"Rules are rules. See ya tomorrow pledge."

~actions_taken++
~ ending_party++
~ joined_frat = true

-> END 

* * "No thanks."

#character_frat_bro_annoyed #sound_friendship_down
"Uhhhh... then why'd you even come dude?"

"That's a shame. Yep... a shame. We saw a lot of potential in you." 

 ~ friendship_frat_bro--
  ~ friendship_frat_bro--
  ~ actions_taken++
  
  //screen is forced to the map 

-> END

-> END

- else if: 

#character_frat_bro_annoyed 
"Hey! Who's this dude? I don't think you're welcome here bro."

It seems this place is invite only... 
~actions_taken++

//return to map 
//is there a way to check for this as soon as the player clicks on the frat house location and prompts this sequence?

}

== Frat_Bro_2 == 

"Welcome to Pi Lam, pledge."

-> END


== Frat_Bro_3 == 

He's unresponsive. 

#character_frat_bro_happy
"Oh don't worry about him... He always gets like this before pregaming the bars." 

-> END

== Frat_Bro_4 == 

"I originally joined the frat just so I was guaranteed housing..."

-> END

== Frat_Bro_5 == 

"Alright pledge... Let's see if you've got what it takes."

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

== Classmate_College == 

{ 

- friendship_classmate >= 4:

#character_classmate_happy
"What's up dawg! I'm getting ready for our final quiz tomorrow!"

#character_classmate_thinking 
"It could be on any subject ever, and he never says what it'll be so... I'm kinda just going over all human knowledge ever. You know how it is."

* "Can I join you?"

#character_classmate_happy #sound_friendship_up
"Sure!" 
~ friendship_classmate++
~ ending_perfect_student++

You take a seat at your classmate's table. 

#character_classmate_neutral
"Here are all the notes I've taken so far." 

#character_classmate_confused
"Well... except yesterday's notes. I don't want to talk about it..." 

#character_classmate_thinking
"I'm gonna keep locking in, let me know if you need any help with class material too!"

She puts on her headphones and starts scribbling away at her notebook. 

You pull out your notebook and laptop and get some studying in before your next quiz. 
Feels good to be prepared! 

~ actions_taken++ 

-> END

* "Good luck!"

#character_classmate_neutral
"Thanks! Smell ya later."

~ actions_taken++ 

-> END

* "What are your study methods?"

#character_classmate_thinking
"An excellent question, my pupil."

#character_classmate_shocked
"I write down EVERYTHING onto my sketchbook! And I do mean EVERYTHING!"

#character_classmate_happy
"After that, it's easy to go back and review everything I need to know!"

#character_classmate_neutral
"You should definitely try it. You don't scribble or doodle much and it shows."

-> END

- friendship_classmate == 0:

#character_classmate_neutral
"...Hello."

* "Whatcha doin'?"

#character_classmate_neutral
"Um... you know... just studying..."

#character_classmate_thinking
"Wait... Haven't I seen you before? Where do I know you from..."

#character_classmate_thinking
"Are you in Prof. Speedwagen's class?"

* * "Yes!"

#character_classmate_happy
"I knew it!" 

#character_classmate_thinking
"I'm studying for our next quiz. Although I have no idea what it's going to be on."

#character_classmate_annoyed
"Pretty broad class not gonna lie..."

#character_classmate_neutral #sound_friendship_up
"Maybe I'll see you at tomorrow's class!"
~ friendship_classmate++
~ actions_taken++

-> END

* * "Yes, but I always skip."

#character_classmate_shocked
"What? No dude... you gotta go!"

#character_classmate_thinking
"Our Prof. literally gives us a quiz every day! You're missing out on mad points dude!"

#character_classmate_neutral #sound_friendship_up
"Maybe I'll see you at tomorrow's class!"
~ friendship_classmate++
~ actions_taken++

-> END 

* * "WHO?"

#character_classmate_neutral
"Okay, Snoop Dogg, must've mistaken you for someone else. My bad."

#character_classmate_neutral
"I gotta get back to my stoodies. Catcha ya later."

-> END

* "Easy there, white chocolate. I wouldn't want you to melt..."

#character_classmate_happy
"Pfffffft hahahahahaha! What the hell?"

#character_classmate_neutral
"W reference. But I need to photosynthesize."

#character_classmate_thinking
"Haven't I seen you before? Where do I know you from..."

#character_classmate_thinking
"Are you in Prof. Speedwagen's class?"

* * "Yes!"

#character_classmate_happy
"I knew it!" 

#character_classmate_thinking
"I'm studying for our next quiz. Although I have no idea what it's going to be on."

#character_classmate_annoyed
"Pretty broad class not gonna lie..."

#character_classmate_neutral #sound_friendship_up
"Maybe I'll see you at tomorrow's class!"
~ friendship_classmate++
~ actions_taken++

-> END

* * "Yes, but I always skip."

#character_classmate_shocked
"What? No dude... you gotta go!"

#character_classmate_thinking
"Our Prof. literally gives us a quiz every day! You're missing out on mad points dude!"

#character_classmate_neutral #sound_friendship_up
"Maybe I'll see you at tomorrow's class!"
~ friendship_classmate++
~ actions_taken++

-> END 

* * "WHO?"

#character_classmate_neutral
"Okay, Snoop Dogg, must've mistaken you for someone else. My bad."

#character_classmate_neutral
"I gotta get back to my stoodies. Catch ya later."
~ actions_taken++

-> END

- else: 

#character_classmate_annoyed
"Oh. It's you."

#character_classmate_annoyed
"Don't ruin my day alright? You're blocking my view of the lake."

-> END

}


-> END

== cheese_table ==
//in same room cheese club meeting was in yesterday


There's so many options to snack on here! Cheese cubes, cheese dip, grilled cheese, cheese puffs, goldfish... cheesecake...

I'm pretty sure this has just been sitting here since yesterday... It doesn't smell very good...

  { ending_ghost >= 1: 
        
       It’s quieter than usual...

    Not peaceful quiet... like... someone is watching you quiet.
        
    }

-> END

//COLLEGE LIBRARY END


//SCIENCE HALL START

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
"EXHILARATING!!!"

#character_ghost_hunter_thinking
"You already KNOW I had to come back for more!"

#character_ghost_hunter_thinking
"Although..."

#character_ghost_hunter_confused
"Even before I've come back to Science Hall... something feels... different..."

#character_ghost_hunter_shocked
"Like the ghosts are following me or something..."

#character_ghost_hunter_neutral #thought_bubble
"...I sound REAL crazy, don't I?"

#character_ghost_hunter_thinking
"Like... in little things... it feels like there's a presence that wasn't there before... have you felt it too?"

#character_ghost_hunter_neutral
"I figured it would escalate."

#character_ghost_hunter_thinking
"It usually takes longer though…"

#character_ghost_hunter_confused
"…What did we do?"

* "You knew this would happen?"

#character_ghost_hunter_neutral
"Knew? No."

#character_ghost_hunter_thinking
"Suspected? Absolutely."

#character_ghost_hunter_thinking
"This is like… textbook escalation."

#visual_effect_lights_flickering
#sound_crashing
#sound_wind_blowing

#character_ghost_hunter_shocked
"WHAT'S GOING ON?"

Your head suddenly starts pounding... You hear whispering in your ear... 

"...You chose this... You chose US..."

"Speak... speak with us..."

#character_ghost_hunter_shocked
"!!!!!"

//screen fades to black, then fades back to the scene

#character_ghost_hunter_confused
"...Whoa....."

#character_ghost_hunter_neutral
"Dude... I think we're... trapped."

#character_ghost_hunter_sad
"The ghosts aren't tied to the building anymore..."

#character_ghost_hunter_shocked
"They're tied to us..."

#character_ghost_hunter_annoyed
"We have to get to the bottom of this. This settles it."

#character_ghost_hunter_annoyed
"I'm going to try to contact them offically tomorrow with my equipment. If you want to join, meet me here tomorrow..."

#character_ghost_hunter_sad
"This may be the only way we can get them to leave us alone..."

~ actions_taken++
~ ending_ghost++
~ ending_ghost++
~ ending_ghost++

-> END

* "This is... interesting."

#character_ghost_hunter_thinking
"...You're either going to be really good at this..."

#character_ghost_hunter_shocked
"...or this is going to go very badly for you."

#visual_effect_lights_flickering
#sound_crashing
#sound_wind_blowing

#character_ghost_hunter_shocked
"WHAT'S GOING ON?"

Your head suddenly starts pounding... You hear whispering in your ear... 

"...You chose this... You chose US..."

"Speak... speak with us..."

#character_ghost_hunter_shocked
"!!!!!"

//screen fades to black, then fades back to the scene

#character_ghost_hunter_confused
"...Whoa....."

#character_ghost_hunter_neutral
"Dude... I think we're... trapped."

#character_ghost_hunter_sad
"The ghosts aren't tied to the building anymore..."

#character_ghost_hunter_shocked
"They're tied to us..."

#character_ghost_hunter_annoyed
"We have to get to the bottom of this. This settles it."

#character_ghost_hunter_annoyed
"I'm going to try to contact them offically tomorrow with my equipment. If you want to join, meet me here tomorrow..."

#character_ghost_hunter_sad
"This may be the only way we can get them to leave us alone..."

~ actions_taken++
~ ending_ghost++
~ ending_ghost++
~ ending_ghost++


-> END

* "Make it stop."

#character_ghost_hunter_thinking
"Oh yeah, sure, let me just-"

#character_ghost_hunter_confused
"..."

#character_ghost_hunter_shocked
"...I have no idea how to do that."

#visual_effect_lights_flickering
#sound_crashing
#sound_wind_blowing

#character_ghost_hunter_shocked
"WHAT'S GOING ON?"

Your head suddenly starts pounding... You hear whispering in your ear... 

"...You chose this... You chose US..."

"Speak... speak with us..."

#character_ghost_hunter_shocked
"!!!!!"

//screen fades to black, then fades back to the scene

#character_ghost_hunter_confused
"...Whoa....."

#character_ghost_hunter_neutral
"Dude... I think we're... trapped."

#character_ghost_hunter_sad
"The ghosts aren't tied to the building anymore..."

#character_ghost_hunter_shocked
"They're tied to us..."

#character_ghost_hunter_annoyed
"We have to get to the bottom of this. This settles it."

#character_ghost_hunter_annoyed
"I'm going to try to contact them offically tomorrow with my equipment. If you want to join, meet me here tomorrow..."

#character_ghost_hunter_sad
"This may be the only way we can get them to leave us alone..."

~ actions_taken++
~ ending_ghost++
~ ending_ghost++
~ ending_ghost++


-> END

}

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

== Jo_Bascom_Hill ==

{ 

- friendship_jo >= 1:

#character_jo_happy
"Oh hey! Kinda funny how we keep running into each other."

#character_jo_shocked
"I came around the hill because I heard some creepy stories about something that happened last night..."

* "What happened?"

#character_jo_thinking
"Apparently... these two students attracted the spirits of the two men that are buried at the top of Bascom Hill..." 

#character_jo_shocked
"It's not the first time anyone has seen these two ghosts either!" 

#character_jo_neutral
"It's still day, so I probably won't see anything, but it's kinda cool just to be in the presence of... I don't know... spirits?"

#character_jo_thinking
"Although who says spirits and ghosts can only roam during the night?"

#character_jo_thinking
"Do you believe in spirits? Good spirits? Evil spirits?"

    * * Not really. That's not scientific.
    
    #character_jo_thinking
"Yeah... I guess it isn't. But I think it's still cool to belive spirits and souls are real!"

 #character_jo_neutral
"Makes life seem a little more mysterious, doesn't it? Like... not EVERYTHING can be explained by science?"

~ actions_taken++
    
    -> END
    
    * * Yes! There has to be!
    
      #character_jo_shocked #sound_friendship_up
"Yeah! That's what I think too!"

     #character_jo_thinking
"There's no way our human brains have the capacity to understand EVERYTHING about our world... and I think spirits are one of those things!"

 #character_jo_shocked 
"This campus has plenty of ghost stories and witnesses... makes you a little curious to try and see for yourself doesn't it?"

~ friendship_jo++
~ actions_taken++
    
    -> END

-> END

* "I was there!"

#character_jo_happy
"No way! I hate to say it, but I don't believe it... YOU? Summoning ghosts?"

#character_jo_neutral
"It's still day, so I probably won't see anything, but it's kinda cool just to be in the presence of... I don't know... spirits?"

#character_jo_thinking
"Although who says spirits and ghosts can only roam during the night?"

#character_jo_thinking
"Do you believe in spirits? Good spirits? Evil spirits?"

    * * Not really. That's not scientific.
    
    #character_jo_thinking
"Yeah... I guess it isn't. But I think it's still cool to belive spirits and souls are real!"

 #character_jo_neutral
"Makes life seem a little more mysterious, doesn't it? Like... not EVERYTHING can be explained by science?"

~ actions_taken++
    
    -> END
    
    * * Yes! There has to be!
    
      #character_jo_shocked #sound_friendship_up
"Yeah! That's what I think too!"

     #character_jo_thinking
"There's no way our human brains have the capacity to understand EVERYTHING about our world... and I think spirits are one of those things!"

 #character_jo_shocked 
"This campus has plenty of ghost stories and witnesses... makes you a little curious to try and see for yourself doesn't it?"

~ friendship_jo++
~ actions_taken++
    
    -> END

- friendship_jo == 0:

#character_jo_neutral
"...Sup."

* "Whatcha doin'?"

#character_jo_neutral
"Just enjoying the beautiful sight that is Bascom Hill. How 'bout you?"

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
"Y'know, every now and then, college will have you feeling that type of way. We should chat about it. What's your name?" 
    
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
"Dude, STOP FOLLOWING ME!"

#character_jo_annoyed #thought_bubble
"I hate this campus, there's so many creeps around!"

-> END

}


-> END


//BASCOM HILL END

== day_over == 

It's getting late... maybe I should head home and rest up now. 

//FADE TO BLACK 
#sound_day_end_jingle

-> END