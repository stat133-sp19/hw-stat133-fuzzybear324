Workout 1
================
Justin Le

Introduction
============

Who is the best player on the Warriors? Is it KD or Steph? Is Draymond garbage? Is Iggy past his prime? Does Klay talk to his dog too much? In this article, we will take a look at the shooting percentages and shot selections of the Warriors to try to come to a conclusive ranking of the key players. Along the way, we will also take a look at the stylistic differences between key players.

Motivation
==========

While the Warriors are very good, they do not all play with the same style or even ability. Just by watching footage, it's clear that not everyone on the team is as good of a shooter as Steph or KD. Yet some more nuanced observations can be made about the types of shots being made between the players. For instance, Iggy and Draymond are clearly not as good as the other members of the team at scoring, but how do they compare to each other. At face value they both seem like similar players: offensive slashers with limted shooting capabilities. We will have to try and discern between them. And where does Klay fit into all of this? Can the stats help him make a suprise leapfrog over the two clear frontrunners in KD and Steph? Or does he have his own flaws that push him below the other two front court members?

Data
====

Let's take a look at the shooting percentages, going by whether the shots taken were two pointers, three pointers, and then both combined.

First let's look at just the 2pt shots.

    ##             Name Total Made Perc_Made
    ## 1 Andre Iguodala   210  134  63.80952
    ## 2   Kevin Durant   643  390  60.65319
    ## 3    Steph Curry   563  304  53.99645
    ## 4  Klay Thompson   640  329  51.40625
    ## 5 Draymond Green   346  171  49.42197

Interestingly, Andre Iguodala has the highest percentage, but that's a bit miselading as he has the fewest shot attempts. Kevin Durant impresses here with not only the most shot attempts but also the second highest percentage.

Now looking at the 3 pointers.

    ##             Name Total Made Perc_Made
    ## 1  Klay Thompson   580  246  42.41379
    ## 2    Steph Curry   687  280  40.75691
    ## 3   Kevin Durant   272  105  38.60294
    ## 4 Andre Iguodala   161   58  36.02484
    ## 5 Draymond Green   232   74  31.89655

The splash brothers are the far and away the best shooters from here, top 2 in both volume and accuracy. Klay has the highest percentage, but Steph beats him in attempts by over 100.

Combining both 2 point and 3 point attempts now:

    ##             Name Total Made Perc_Made
    ## 1   Kevin Durant   915  495  54.09836
    ## 2 Andre Iguodala   371  192  51.75202
    ## 3  Klay Thompson  1220  575  47.13115
    ## 4    Steph Curry  1250  584  46.72000
    ## 5 Draymond Green   578  245  42.38754

Kevin Durant again takes the throne at the top of the charts, with a whopping 54% shooting percentage and being the third highest in attempts.Suprisingly, Steph is second to last here. It is also intersting to note that Draymond is at the bottom of the standings among all three scenarios.

And now let's look at the shot charts of the players.

![](workout1-Justin_Le_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-11-1.png)

While a bit hard to make definitive statements from these charts, the key takeaway is that only Durant, Klay, and Steph take a considerable amount of midrange shots. Additionally, Step Curry has a noticeable pull up on his shot chart, indicating that he takes shots from further back than the other players.

Analsysis
=========

We will go over the five players in three chunks: Steph and Kd, Draymond and Iggy, and finally just Klay.

KD is better than Steph at shooting 2's as well as overall 2's and 3's, and has him beat in volume in both regards. On the other hand, Steph destroys Durant at shooting 3's where despite not being that much better percent wise, has almost triple Durant's volume. Which one wins here? Well even though Durant shoots better at 2's by 7% he only takes about 100 more than steph. Aditionally the aggregate of both 2's and 3's is a bit miselading here, since combining both shots doesn't makes the player who shoots 3's worse than the one who shoots 2's more, since the 3 pointer is a harder shot to hit since it's farther. The natural mean of these 2 shots should be different from each other, player to player. That leads to the main argument here: the 3 ball is just worth significantly more than the 2 ball. Curry shooting 3's generates 1.2 points per attempt more than anything KD can produce. Curry also takes his shots from farther back, as seen in the shot chart. This ability to strech and space the floor is Curry's most devstating ability, increasing the abilities of the other players on his team since he lures the defenders away from the basket. So while KD does have incredible production, he does not have the "magic" that Curry brings

Both Draymond and Iggy are not good to say the least, at shooting the ball. They are the 2 worst 3 point shooters of the starters. However, while Iggy at least shoots something reasonable, Draymond is atrocious at these shots, shooting 5% worse than Iggy. Even worse, he actually takes more shots than Andre as well. It's arguable that Draymond is a net negative on offense because of this. Defenders can sag off of him and guard other players, since they know Draymond is not a threat from outside. Even when Draymond goes in close, he's still the worst on the team at making 2 pointers! It's clear that Iggy beats out Draymond here. He doesn't shoot the ball very often, and when he does, you don't feel terrible about him shooting. Iggy plays his role, and doesn't bring the team down on their end of the floor. The same can't be said for Draymond.

Now on to Klay. Is there an argument for him being above KD? Sure he's a better three point shooter, the best on the team by percentage in fact. The difference between him and Steph, is the number of shots taken in this category, unfortunately for Klay. Klay simply doesn't shoot as much as Curry, so his high percentage doesn't mean as much. He also doesn't have Steph's gravity power, taking normal range 3's by comparison. And when it comes to the 2 point shots, he simply loses to KD. So while a very good player, he just doesn't have the firepower to move up the rankings. The good news for Klay though, is that he is clearly much better than Iggy. While Iggy tries to go even on offense, Klay actually does damage. He takes more shots, and makes them enough times for it to hurt, unlike Andre who takes very few shots by comparison, actually the least on the time.

Conclusions
===========

Based off the data and anlsyis we have seen, the rankings of the GSW players would have to be:

1.  Steph Curry
2.  Kevin Durant
3.  Klay Thompson
4.  Andre Iguodala
5.  Draymond Green

The inherit value of the 3 ball and Steph's overwhelming ability to make them put him at the top. Draymond loses out to Iggy by a considerable amount due to his horrendous efficiency and willingness to keep shooting in spite of his lack of ability. Klay while easily better than Andre, does not do enough to out power the sheer machine that is KD.
