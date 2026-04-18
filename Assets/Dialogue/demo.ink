VAR global_variable = 0

-> start

== start ==
This is a line of narrative.

What's next? # character_Jo_confused
* Change a global variable
-> variable_stitch

* Pass a tag
-> tag_stitch

* Conditional lines
-> conditional_stitch

* Temporary variables
-> temp_stitch

* Change Background
-> background_stitch

= variable_stitch
~ global_variable = 1
Global variable is now 1!
-> END //use this to indicate when dialogue should close

= tag_stitch
# character_Jo_shocked
Both these tags are attached to this line!
-> END

= conditional_stitch
{global_variable == 1: global_variable is 1! | global_variable is not 1! }
*   { global_variable == 0 } This choice will only display when global_variable is 0
-> END
*   This choice will display regardless
-> END

= temp_stitch
~ temp temp_variable = 0
Add to temp variable?
* Yes
~ temp_variable++
* Nah
~ temp_variable--

- The temporary variable is {temp_variable}! // the "-" can be used to continue narrative the same way regardless of which choice was chosen
-> END

= background_stitch
# background_desk
Welcome to the desk!
-> END