(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test1 = all_except_option ("string", ["string"]) = SOME []
val test1a = all_except_option ("string", []) = NONE
val test1b = all_except_option ("str", ["str2", "str", "str1"]) = SOME ["str2", "str1"]

val test2 = get_substitutions1 ([["foo"],["there"]], "foo") = []
val test2a = get_substitutions1 ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]

val test3 = get_substitutions2 ([["foo"],["there"]], "foo") = []
val test3a = get_substitutions2 ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]

val test4 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]

val test5 = card_color (Clubs, Num 2) = Black
val test5a = card_color (Spades, Jack) = Black
val test5b = card_color (Diamonds, Ace) = Red
val test5c = card_color (Hearts, Num 9) = Red

val test6 = card_value (Clubs, Num 2) = 2
val test6a = card_value (Clubs, Ace) = 11
val test6b = card_value (Clubs, Num 7) = 7
val test6c = card_value (Clubs, Queen) = 10

val test7 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test7a = (remove_card ([(Hearts, Ace)], (Hearts, Num 7), IllegalMove) handle IllegalMove => [(Diamonds, Ace)]) = [(Diamonds, Ace)]
val test7b = remove_card ([(Hearts, Ace), (Diamonds, King), (Hearts, Ace), (Spades, Num 5)], (Hearts, Ace), IllegalMove) = [(Diamonds, King), (Hearts, Ace), (Spades, Num 5)]


val test8 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true
val test8a = all_same_color [(Hearts, Ace), (Diamonds, King)] = true
val test8b = all_same_color [(Hearts, Ace), (Diamonds, King)] = true
val test8c = all_same_color [(Spades, Num 5),(Hearts, Ace), (Diamonds, King)] = false

val test9 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4
val test9a = sum_cards [(Clubs, Num 2),(Clubs, Num 2),(Hearts, Ace)] = 15
val test9b = sum_cards [(Clubs, Num 2),(Clubs, Num 2), (Hearts, Ace), (Spades, King)] = 25

val test10 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4 (* sum < goal *)
val test10a = score ([(Hearts, Num 2),(Diamonds, Num 4)],10) = 2 (* sum < goal, all same color *)
val test10b = score ([(Hearts, Num 2),(Clubs, King)],10) = 6 (* sum > goal *)
val test10c = score ([(Hearts, Num 2),(Diamonds, King)],10) = 3 (* sum > goal, all same color *)

val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)
             
             