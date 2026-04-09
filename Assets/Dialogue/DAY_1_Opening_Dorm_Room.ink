VAR action_variable = 0
VAR burnt_out_path = 0
VAR average_path = 0
VAR perfect_student_path = 0
VAR college_not_for_me_path = 0
VAR peets_banned = false

-> DAY_1_Opening_Dorm_Room

=== DAY_1_Opening_Dorm_Room ===
The player wakes up as their roommate is quickly rushing out of the room.
"Dude, how are you JUST NOW waking up? Didn't you say you had that one class in Mosse at 9?"
"Whatever, I'm running late too. See ya!"

What do you do?

+ Door
    -> door

+ Desk
    -> desk

+ Phone
    -> phone


=== dorm_room ===
What do you do?

+ Phone
    -> phone

+ Desk
    -> desk

+ Door
    -> door


=== door ===
# scene:Map
-> map


=== desk ===
Screen switches to POV of you sitting at a desk with a laptop, your phone, and a notebook.
"You decide to study. Since it's the first day of class, there's not much to work on..."
"Oh well! Wouldn't hurt to get ahead on some readings right?"

...
30 min later...
Got one reading assignment done for next week!

~ average_path += 1
~ action_variable += 1

+ Keep Studying
    -> Keep_Studying

+ Phone
    -> phone

+ Leave
    -> Leave


=== Keep_Studying ===
"Wow... at this rate, you'll be ahead on readings till midterms!"
1 hour later...
Alright, maybe not. I got two readings done.
Your motivation dips.

~ burnt_out_path += 1
~ action_variable += 1

+ Leave
    -> Leave


=== phone ===
Screen switches to POV of you holding your phone.
"You pick up your phone."

FLASH

"It's been 2 hours. You've spent them scrolling consuming reels that you don't even remember anymore."

~ burnt_out_path += 1
~ action_variable += 1

+ Keep scrolling
    -> Keep_scrolling

+ Leave
    -> Leave


=== Keep_scrolling ===
Another, more extreme FLASH, ears ringing, screen is white for longer.
"It's been another hour. Wait, what was I trying to do again? I should stop."

~ action_variable += 1
~ burnt_out_path += 1

+ KEEP SCROLLING
    -> KEEP_SCROLLING

+ Leave
    -> Leave


=== KEEP_SCROLLING ===
~ action_variable += 20
~ burnt_out_path += 1
-> DAY_1_Over


=== Leave ===
-> dorm_room