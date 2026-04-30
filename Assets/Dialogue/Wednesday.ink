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

//checks if player was invited to the frat house from frat bro on Tuesday
VAR invited_frat_house = true

== start ==

#sound_phone_alarm

DAY 3 - WEDNESDAY
 
#character_roommate_neutral 
"Goooood morning. It's Wednesday my dude." 

#character_roommate_thinking  
"I heard that the Union South Peet's was hiring some new baristas... I was thinking maybe I should apply. I could really use the cash..."

#character_roommate_shocked
"But then that would mean... human interaction..."

#character_roommate_happy
"I dunno. I gotta go so, I'll see ya later!"

If I leave for class now... I'd actually be on time!

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

//not available: Library Mall


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

== Classmate_Memorial_Union == 

{ 

- friendship_classmate >= 2:

#character_classmate_happy
"Nothing quite like studying for an exam next to the lake!"

#character_classmate_thinking 
"If only it were this nice more than a third of the year..."

* "Can I join you?"

#character_classmate_happy #sound_friendship_up
"Sure! Come get you some of this sun my guy!" 
~ friendship_classmate++
~ ending_perfect_student++

You take a seat on the colorful orange terrace chair next to your classmate. 

#character_classmate_neutral
"Oh... I'm Morelia by the way. Not sure if I ever introduced myself yet." 

#character_classmate_thinking
"I'm gonna keep locking in, let me know if you need any help with class material too!"

Morelia puts on her headphones and starts scribbling away at her notebook. 

You pull out your notebook and laptop and get some studying in before your next quiz. 

-> END

* "Good luck!"

#character_classmate_neutral
"Thanks! Smell ya later."

-> END

* "Can you even see your screen with the sun?"

#character_classmate_thinking
"Not gonna lie, I do have to crank my laptop's brightness all the way up."

#character_classmate_annoyed
"Which drains my laptop's pathetic battery even faster..."

#character_classmate_sad
"And don't even get me started on the spotty wi-fi..."

* * "Maybe you should just chill?"

#character_classmate_thinking
"...Maybe. Once my laptop's battery overheats and explodes, which should happen in like 30 minutes or so, I'll doodle in my  notebook!"

-> END

* * "So you're just studying out here to be performative?"

#character_classmate_annoyed
"God forbid a girl catch some rays, I guess."

#character_classmate_shocked
"For your information, I could care less what these bozos think of me." 

-> END

- friendship_classmate >= 0:

#character_classmate_neutral
"...Hello."

* "Whatcha doin'?"

#character_classmate_neutral
"Um... you know... just studying by the lake."

#character_classmate_thinking
"Wait... Haven't I seen you before? Where do I know you from..."

#character_classmate_thinking
"Are you in Prof. Speedwagen's class?"

* * "Yes!"

#character_classmate_happy
"I knew it!" 

#character_classmate_thinking
"I'm studying for our next quiz. I think it's going to be on Science or something like that."

#character_classmate_annoyed
"Pretty broad class not gonna lie..."

#character_classmate_neutral #sound_friendship_up
"Maybe I'll see you at tomorrow's class!"
~ friendship_classmate++

-> END

* * "Yes, but I always skip."

#character_classmate_shocked
"What? No dude... you gotta go!"

#character_classmate_thinking
"Our Prof. literally gives us a quiz every day! You're missing out on mad points dude!"

#character_classmate_neutral #sound_friendship_up
"Maybe I'll see you at tomorrow's class!"
~ friendship_classmate++

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
"I'm studying for our next quiz. I think it's going to be on Science or something like that."

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

-> END

- else: 

#character_classmate_annoyed
"Oh. It's you."

#character_classmate_annoyed
"Don't ruin my day alright? You're blocking my sunlight."

-> END

}

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
    
     + + Lemonade Matcha
     
        #character_barista_confused
        "Lemonade... matcha?
        
        #character_barista_shocked #thought_bubble
        "Oh NO that's not on the menu!! What do I do what do I do what do I-"
        
        
        #character_barista_confused
        "Like... lemonade instead of the... milk?"
        
        #character_barista_ thinking
        "Well... okedokee...." 
        
        You watch him serve your drink, hesitating multiple times. You thought it would be a simple request but alas... 
        
        But... you notice he looks around, and when he thinks no one is watching, he sneaks a sip of your drink... 
        
        * * * "WHAT ARE YOU DOING TO MY DRINK?"
        
        #character_barista_shocked
        "AH! UM! UH! Nothing! I'm just making sure I didn't.... make something gross! Yeah!"
        
        #charcter_barista_happy #thought_bubble
        "This stuff's delicious! This guy really put me on!" 
        
            He serves it to you almost instantanously, ignoring your concern... 
            
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
        
        -> END
        
        
        * * *  [ignore him]
        
        He serves it to you almost instantanously... 
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
        
     -> END
     
     + + What do you recommend? 
     
     #character_barista_sad
     Honestly? Nothing. I don't think we've passed our most recent health inspection. 
     #character_barista_thinking
     But... I dunno, otherwise I think a boba tea would be pretty good? Did you want one?
     
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
    "Oh right! The protein-cinammon-nutmeg-boba-frap-whipped-latte!"
    
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
"Hey... next time you clock in, would ya wanna try all of the new seasonal donut sprinkes? On our down time... heh... obviously..." 

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
    
 + Lemonade Matcha
     
        #character_barista_confused
        "Lemonade... matcha?
        
        #character_barista_shocked #thought_bubble
        "Oh NO that's not on the menu!! What do I do what do I do what do I-"
        
        
        #character_barista_confused
        "Like... lemonade instead of the... milk?"
        
        #character_barista_ thinking
        "Well... okedokee...." 
        
        You watch him serve your drink, hesitating multiple times. You thought it would be a simple request but alas... 
        
        But... you notice he looks around, and when he thinks no one is watching, he sneaks a sip of your drink... 
        
        * * * "WHAT ARE YOU DOING TO MY DRINK?"
        
        #character_barista_shocked
        "AH! UM! UH! Nothing! I'm just making sure I didn't.... make something gross! Yeah!"
        
        #charcter_barista_happy #thought_bubble
        "This stuff's delicious! This guy really put me on!" 
        
            He serves it to you almost instantanously, ignoring your concern... 
            
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
        
        -> END
        
        
        * * *  [ignore him]
        
        He serves it to you almost instantanously... 
        Mmm! You feel a renewed sense of energy! 
        ~ actions_taken--
        
     -> END
     
+ What do you recommend? 
     
     #character_barista_sad
     Honestly? Nothing. I don't think we've passed our most recent health inspection. 
     #character_barista_thinking
     But... I dunno, otherwise I think a boba tea would be pretty good? Did you want one?
     
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
    "Oh right! The protein-cinammon-nutmeg-boba-frap-whipped-latte!"
    
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

==roommate_peets == 

#character_roommate_neutral
"Hey man. I came over to see if they were still hiring, but that barista over there seems really... intense."
#character_roommate_sad
"I don't know if I have what it takes to be a barista anymore..." 
#character_roommate_happy
"So, I've decided I'll stick to this side of the counter, and I ordered this delicious breakfast bacon egg and cheese! Cheered me right up. It was the last one too!"

#character_roommate_neutral
"I also made a new friend! That's Jo over there. We actually have a class together!" 

-> END


==jo_peets==

{ 

- friendship_classmate >= 2:

#character_jo_happy
"Oh hey! Kinda funny how we keep running into each other."

#character_jo_shocked
"Maybe it's fate..."

* "What do you recommend I get here?"

#character_jo_thinking
"Honestly, I've only just recently started drinking coffee, so I'm not too sure..." 

#character_jo_neutral
"But I always like to get a latte of some sort."

#character_jo_annoyed
"Although with these student workers, you get something different each time. I swear they just be throwing anything together."

#character_classmate_thinking
"Although, I feel like that one barista is always here. I always make sure to order from him." 

* * "I'm a barista here too!" 

#character_jo_shocked
"Dang, they'll really just hire ANYONE, huh?"

#character_jo_happy
"Hehe, just kidding... No, that's actually pretty cool!" 

#character_jo_neutral
"I love a man that knows his way around an espresso machine." 

#character_jo_neutral #sound_friendship_up
"Let me know next time you pick up a shift! I wanna see how YOU make my drink!"

~friendship_jo++
~ actions_taken++

-> END


* * "Yeah, he's crazy."

#character_jo_neutral
"Most baristas are. Can't blame him." 

#character_jo_thinking
"You gotta admit, it's impressive the way he just made this job his entire... livelihood."

#character_jo_happy
"Plus, take it from me... if you treat him nice enough... he'll give you free drinks!"

-> END

* "Why do you look like that."

#character_jo_happy
"Like what? Fabulous? Guess I just won the genetic lottery and paired it with style. Can't go wrong."

-> END

* "Can I buy you a coffee?"

#character_jo_happy #sound_friendship_up
"Oh! That's so nice of you!"
~ friendship_jo++
~ actions_taken++

#character_classmate_neutral
"I already bought one, you see, but maybe next time..?"

#character_classmate_neutral
"I'd love to chat over a coffee sometime soon."
-> END

- friendship_jo >= 0:

#character_classmate_neutral
"...Sup."

* "Whatcha doin'?"

#character_jo_neutral
"Just sippin' on this latte. Gettin' approached by strange men. How 'bout you?"

* * "How dare you! I'm not strange."

#character_jo_confused
"Who said I was talking 'bout you? I thought we were just sharing how our day was going." 

  #character_jo_happy
    "...I can see I may have hit a nerve. You're silly. What's your name?" 
    
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

* * "How dare you! I'm not a man."

#character_jo_confused
"Who said I was talking 'bout you? I thought we were just sharing how our day was going." 

  #character_jo_happy
    "...I can see I may have hit a nerve. You're silly. What's your name?" 
    
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
"Dude, are you following me or something?"

#character_jo_annoyed
"I don't wanna see your face right now. I was having a good day until I saw you."

-> END

}


-> END


// UNION SOUTH END

// GORDON'S LAWN START


== cheese_club_trifold == 
//same one from yesterday, now placed on the ground

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

// MOSSE START

== mosse_class ==

{actions_taken >= 9:
Alright... made it to Mosse. 

Except.... wait, where's my class again? Room 2340..... 

//I don't think there will be any dialogue here, but should still switch scenes depending on which arrow the player clicks on in order to traverse the halls and get to the correct room

//this then leads to class scene, which is not accessible if player does not go to mosse first

- else: 

Yeah... I definitely did NOT make it to class on time...

}

-> END

== mosse_class_door == 

{

- actions_taken >= 9:

You enter the classroom, barely making it on time. You take a seat in the back of the lecture hall, hoping no one will notice you.

~ ending_perfect_student++
~ actions_taken++

#character_prof_neutral
"Alright everyone, let's get started!"

As you open your laptop, you see something next to your foot... it looks like a sketchbook that has definitely been used quite a bit. 

You think nothing of it, and instead decide to focus on class. 

#character_prof_happy
    "Today we'll be going over history! Yes, hold back your cheers! We need to focus!"
    
 #minigame_trivia_history
 
 #location_mosse_after_class_lecture_hall
 
 You notice a gloomy girl next to you after class. 
 
 { 

- friendship_classmate >= 0:


#character_classmate_sad 
"Oh. Hello..." 

* What's wrong?

#character_classmate_sad
"I lost my sketchbook... my pride and joy... I ALWAYS have my sketchbook with me and now it's gone..."

#character_classmate_annoyed
"The urge to scribble... I can't... I can't stop it..."

    * * "Oh! It's actually right over there." 
    
    #character_classmate_shocked
    "Wait! Where!? Over there? In the back??"
    
     #character_classmate_happy
    "How did it get over there? Ah who cares! I just hope it's the right one!"
    
    She darts out, leaving you in the dust, to the back of the lecture hall. She crouches over then holds up her sketchbook triumphantly, screaming, "YES! YES! YES! REUNITED ONCE MORE!" 
    
    #sound_friendship_up
    You aren't sure if the scene is sweet or scary, but the she turns around and gives you a thumbs up. 
    
    ~ friendship_classmate++
    ~ ending_perfect_student++
    ~ actions_taken++
    
    -> END
    
    
    * * "I stole it."

    #character_classmate_annoyed
    "You BETTER be lying. If you know what's good for you."
    
    #character_classmate_annoyed
     "You know what? I'm finding out MYSELF if you are!"
    
    She tackles you to the ground and snatches your bag away from you. As you try to recover from the sudden attack, you realize she has already gone through your bag. 
    
    #character_classmate_shocked
    "Nothing here... unless... maybe you left it where you were sitting!"
    
    She leaps into the and does a somersault across the letcure hall, right to where you were sitting during class. She spots her sketchbook instantly. 
    
    
    #character_classmate_annoyed #sound_friendship_down
    "You... you... you MONSTER... You. Will. PAYYYYY....
    
    ~friendship_classmate--
      ~friendship_classmate--
        ~friendship_classmate--
          ~friendship_classmate--
            ~friendship_classmate--
            ~ actions_taken++
    
    Her fists clench, and a nefarious purple aura starts eminating from her. 
    
    I think she's going to remember this...

    -> END
    
    * * "That's rough buddy."
    
    #character_classmate_sad
    [sob]
    
    #character_classmate_thinking
    "It's okay... I have faith she'll find me again... somehow..."
    
    -> END


* Whatcha doing after class? 
#character_classmate_thinking
"Hmm... good question. I haven't thought that far ahead..." 

#character_classmate_neutral
"I dunno! I'll probably go to the terrace. It's a nice day outside today." 

-> END

- else: 

#character_classmate_annoyed
"...What do you want?"

* What's wrong?

#character_classmate_sad
"[sigh] I um... I lost my sketchbook... not that you would care."

    * * "Oh! It's actually right over there." 
    
    #character_classmate_shocked
    "Wait! Where!? Over there? In the back??"
    
     #character_classmate_happy
    "How did it get over there? Ah who cares! I just hope it's the right one!"
    
    She darts out, leaving you in the dust, to the back of the lecture hall. She crouches over then holds up her sketchbook triumphantly, screaming, "YES! YES! YES! REUNITED ONCE MORE!" 
    
    #sound_friendship_up
    You aren't sure if the scene is sweet or scary, but the she turns around and gives you a thumbs up. 
    
    #character_classmate_happy
    "Hmm... maybe you're not ALL bad..."
    
    ~ friendship_classmate++
    ~ friendship_classmate++
    ~ actions_taken++
    
    -> END
    
    
    * * "I stole it."

    #character_classmate_annoyed
    "You BETTER be lying. If you know what's good for you."
    
    #character_classmate_annoyed
     "You know what? I'm finding out MYSELF if you are!"
    
    She tackles you to the ground and snatches your bag away from you. As you try to recover from the sudden attack, you realize she has already gone through your bag. 
    
    #character_classmate_shocked
    "Nothing here... unless... maybe you left it where you were sitting!"
    
    She leaps into the and does a somersault across the letcure hall, right to where you were sitting during class. She spots her sketchbook instantly. 

    #character_classmate_annoyed #sound_friendship_down
    "You... you... you MONSTER... You. Will. PAYYYYY....
    
    ~friendship_classmate--
      ~friendship_classmate--
        ~friendship_classmate--
          ~friendship_classmate--
            ~friendship_classmate--
            ~ actions_taken++
    
    Her fists clench, and a nefarious purple aura starts eminating from her. 
    
    I think she's going to remember this...

    -> END
    
    * * "That's rough buddy."
    
    #character_classmate_sad
    [sob]
    
    #character_classmate_sad
    "Stop acting like you even care..."
    
    -> END

-> END

* Whatcha doing after class? 

#character_classmate_annoyed
"Don't try to act all buddy-buddy with me! You know what you did!"

-> END


}


-> END


- else: 

Class is over... no one is here...

}


-> END 


// MOSSE END

// FRAT HOUSE START

== Frat_Bro == 

{ 

- invited_frat_house == true: 

#character_frat_bro_neutral
"Heyyyyyyy dude! You actually made it!"

#character_frat_bro_happy
"Get a burger and grab a beer!"

* "Heck yeah!"

#character_frat_bro_happy #sound_friendship_up
"Hell yeah!"

 ~ friendship_frat_bro++

#character_frat_neutral
"Feel free to walk around and meet some of the guys! If they like you... we'll give you a bid to join our frat!"

#character_frat_bro_thinking #thought_bubble
"Bro is definitely leaving here holding a random cup he didn't ask for..." 

#character_frat_neutral
"Hey, just chill and enjoy your time here. Come back tomorrow and we'll let you know if you got a bid!"

~actions_taken++
-> END 

* "I don't drink."

#character_frat_bro_confused
"Uhhhh... I'm gonna make pretend you did NOT just say that."

"Why else did you even come bro? Isn't that what all you freshmen care about? Did you not follow the smell of Natty Light to get here?" 

* * "I thought it'd be a good place to meet people."

#character_frat_bro_neutral #sound_friendship_up
"Alright, alright... I respect that. We’re all about connections here.

~ friendship_frat_bro++

#character_frat_neutral
"Feel free to walk around and meet some of the guys! If they like you... we'll give you a bid to join our frat!"

#character_frat_neutral
"Hey, just chill and enjoy your time here. Come back tomorrow and we'll let you know if you got a bid!"
~actions_taken++

-> END 

* * "I’m trying to maximize my networking opportunities and leadership potential."

#character_frat_bro_confused
"...Bro, this isn't LinkedIn. Stop talking like that."

#character_frat_bro_neutral
"Word of advice: don't try too hard." 

#character_frat_neutral
"Feel free to walk around and meet some of the guys! If they like you... we'll give you a bid to join our frat!"

#character_frat_bro_thinking #thought_bubble
"Bro is definitely leaving here holding a random cup he didn't ask for..." 

#character_frat_neutral
"Hey, just chill and enjoy your time here. Come back tomorrow and we'll let you know if you got a bid!"
~actions_taken++

-> END

* "I don't eat."
#character_frat_bro_confused
"Uhhhh... that sounds like an eating disorder bro."

#character_frat_bro_thinking
"And if you're looking for eating disorders, you should probably join a sorority instead dude, hate to break it to you."

#character_frat_bro_confused
"Now what's the real reason you decided to stop by?"

* * "I thought it'd be a good place to meet people."

#character_frat_bro_neutral #sound_friendship_up
"Alright, alright... I respect that. We’re all about connections here.

~ friendship_frat_bro++

#character_frat_neutral
"Feel free to walk around and meet some of the guys! If they like you... we'll give you a bid to join our frat!"

#character_frat_neutral
"Hey, just chill and enjoy your time here. Come back tomorrow and we'll let you know if you got a bid!"
~actions_taken++

-> END 

* * "I’m trying to maximize my networking opportunities and leadership potential."

#character_frat_bro_confused
"...Bro, this isn't LinkedIn. Stop talking like that."

#character_frat_bro_neutral
"Word of advice: don't try too hard." 

#character_frat_neutral
"Feel free to walk around and meet some of the guys! If they like you... we'll give you a bid to join our frat!"

#character_frat_bro_thinking #thought_bubble
"Bro is definitely leaving here holding a random cup he didn't ask for..." 

#character_frat_neutral
"Hey, just chill and enjoy your time here. Come back tomorrow and we'll let you know if you got a bid!"
~actions_taken++

-> END

- else if: 

It seems this place is invite only... 
~actions_taken++

//return to map 
//is there a way to check for this as soon as the player clicks on the frat house location and prompts this sequence?


}

== Frat_Bro_2 == 

"Hey. I have an important question for you to think about..."

"You a 'I'm gonna regret this tomorrow' or 'this would make for a good story' kinda guy?"

* I try to think ahead

"Gotcha."

-> END

* I do things for the lore

~ friendship_frat_bro++
#sound_friendship_up
"Alright... alright..."

-> END

== Frat_Bro_3 == 

He's unresponsive. 

#character_frat_bro_happy
"Oh don't worry about him... He always gets like this after our weekly power hour." 

-> END

== Frat_Bro_4 == 

"You heard of Pi Lam before?"

* Never once in my life. 

"Gotcha."

-> END

* My uncle was a Pi Lam!

~ friendship_frat_bro++
#sound_friendship_up
"Alright... alright..."

-> END

== Frat_Bro_5 == 

"Is water wet?"

* Yes 

"Gotcha."

-> END

* No

~ friendship_frat_bro++
#sound_friendship_up
"Alright... alright..."

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

Man, that's also the third day in a row they're like this... 

-> END

== College_Library_Class_Door == 

#character_cheese_president_happy
"Hello hello hello! Welcome in, welcome in!"

#character_cheese_president_neutral
"We are actually just about to start our cheese club meeting!" 

* "Count me in!"

#character_cheese_president_happy #sound_friendship_up
"Yes...! Yes! FANTASTIC!"

#character_cheese_president_thinking #thought_bubble
"I can sense this guy has potential... the potential to be future cheese club president once I take my leave..."

#character_cheese_president_shocked #thought_bubble
"Plus... we need as many members as possible... or else we might not survive as an org!"

~ ending_perfect_student++
~ friendship_president++

#character_cheese_president_neutral
"You definitely won't regret it! You might gain a pound or two but that's nothing to be afraid of!" 

#character_cheese_president_thinking
"Please, take a seat, take a seat!" 

You take a seat inbetween a cheese head and a girl munching on Goldfish crackers. 

#character_cheese_president_neutral
"Let's welcome our newest recruit!"

The whole room speaks simultaneously... 

"Welcome!" 
"What's your favorite cheese?"
"Have you ever had squeaky curds?"
"QUEEEEEEESOOOOOO!" 

You feel so welcomed and accepted already!

#character_cheese_president_thinking
"Let's see... where was I..."

#character_cheese_president_neutral
"As I was saying, feel free to eat all the rest of the cheese in the back of the room. I can't take it all home!"

#character_cheese_president_neutral
"Also, don't forget about our event this Friday! We will be having a cheese tasting event and competition! It will be taking place at Library Mall! Invite all your friends too!"

#character_cheese_president_thinking
"We will be having our state-championship winning cheese recipe there as well! Alright... that's it for today!" 

~actions_taken++

-> END



* Cheese club? Sounds lame.

A multitude of gasps echo across the room. A guy in the back clutches his bag of cheese puffs to his chest, as if his heart was hurting. 

#character_cheese_president_shocked
"You... surely... surely you don't mean that."

#character_cheese_president_sad
"Please... take it back... give us a chance!"

#character_cheese_president_sad
"We... we have free cheese snacks at every meeting! Doesn't that sound swell?"

* * No.

#character_cheese_president_sad
"Ah... okay... well... suit yourself."

#character_cheese_president_annoyed #sound_friendship_down
"If you wouldn't mind, then please take your anti-cheese propoganda elsewhere. We have this room reserved for another hour."

~ friendship_president--
~ ending_average++
~ actions_taken++

#location_college_library_entrance

-> END

* * Hmm... FREE cheese snacks you say?

#character_cheese_president_happy
"Yes...! Yes! So you should totally join us!"

#character_cheese_president_thinking #thought_bubble
"I can sense this guy has potential... the potential to be future cheese club president once I take my leave..."

#character_cheese_president_shocked #thought_bubble
"Plus... we need as many members as possible... or else we might not survive as an org!"

#character_cheese_president_happy
"Whaddya say? Want to join the UW Cheese Club?"

* * * YES!

#character_cheese_president_happy #sound_friendship_up
"FANTASTIC!!!" 

~ ending_perfect_student++
~ friendship_president++

#character_cheese_president_neutral
"You definitely won't regret it! You might gain a pound or two but that's nothing to be afraid of!" 

#character_cheese_president_thinking
"Please, take a seat, take a seat!" 

You take a seat inbetween a cheese head and a girl munching on Goldfish crackers. 

#character_cheese_president_neutral
"Let's welcome our newest recruit!"

The whole room speaks simultaneously... 

"Welcome!" 
"What's your favorite cheese?"
"Have you ever had squeaky curds?"
"QUEEEEEEESOOOOOO!" 

You feel so welcomed and accepted already!

#character_cheese_president_thinking
"Let's see... where was I..."

#character_cheese_president_neutral
"As I was saying, feel free to eat all the rest of the cheese in the back of the room. I can't take it all home!"

#character_cheese_president_neutral
"Also, don't forget about our event this Friday! We will be having a cheese tasting event and competition! It will be taking place at Library Mall! Invite all your friends too!"

#character_cheese_president_thinking
"We will be having our state-championship winning cheese recipe there as well! Alright... that's it for today!" 

~actions_taken++
-> END

* * * NO!

#character_cheese_president_sad
"Ah... okay... well... suit yourself."

#character_cheese_president_annoyed #sound_friendship_down
"If you wouldn't mind, then please take your anti-cheese propoganda elsewhere. We have this room reserved for another hour."

~ friendship_president--
~ ending_average++
~ actions_taken++

#location_college_library_entrance

-> END

== cheese_table ==

There's so many options to snack on here! Cheese cubes, cheese dip, grilled cheese, cheese puffs, goldfish... cheesecake...

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
"Have you heard of all the campus lore and ghost stories?! There's so much! It CAN'T just be a coincedence! This campus is just too old for there to be zero ghosts..."

#character_ghost_hunter_thinking
"I don't know if they're evil entities or pure spirits... trapped to wander this God-forsaken campus for all of eternity..." 

#character_ghost_hunter_neutral
"Either way, I HAVE to see. I skipped class today for this. That means I'm now obliged to skip class EVERY day. There's no going back."

#character_ghost_hunter_shocked
"But I sill hear this... this voice..."

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

What happened?

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

"DO NOT RESIST."

-> END

//note changes when player checks it again

== Post_It_Note_Click_2 == 

There's something scribbled here... 

"What is a 'Sunday' and why do you get the scaries?"

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

It's getting late... maybe I should head home and rest up now. 

//FADE TO BLACK 
//Day End jingle

-> END







