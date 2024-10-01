--  ___________  __   __  ___   __  ___________  ___________  _______   _______       ________   ___      ___ 
-- ("     _   ")|"  |/  \|  "| |" \("     _   ")("     _   ")/"     "| /"      \     |"      "\ |"  \    /"  |
--  )__/  \\__/ |'  /    \:  | ||  |)__/  \\__/  )__/  \\__/(: ______)|:        |    (.  ___  :) \   \  //   |
--     \\_ /    |: /'        | |:  |   \\_ /        \\_ /    \/    |  |_____/   )    |: \   ) || /\\  \/.    |
--     |.  |     \//  /\'    | |.  |   |.  |        |.  |    // ___)_  //      /     (| (___\ |||: \.        |
--     \:  |     /   /  \\   | /\  |\  \:  |        \:  |   (:      "||:  __   \     |:       :)|.  \    /:  |
--      \__|    |___/    \___|(__\_|_)  \__|         \__|    \_______)|__|  \___)    (________/ |___|\__/|___|
                                                                                                        
-- Binome 1 : Je soussigné(e), Nom, Prénom, …………………………………………………………………………………………………………………………………… certifie qu’il s’agit d’un travail original et que toutes les sources utilisées ont été indiquées dans leur totalité. Fait à ______________ le __/__/__.
-- Binome 2 : Je soussigné(e), Nom, Prénom, …………………………………………………………………………………………………………………………………… certifie qu’il s’agit d’un travail original et que toutes les sources utilisées ont été indiquées dans leur totalité. Fait à ______________ le __/__/__.


-- Connect to the database
\connect db_twitter

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--  Q1: Donnez la liste des tweets de [@CampusIoT](https://twitter.com/CampusIoT)

SELECT T.tweetId, T.content, TO_CHAR(T.postTime, 'Day, DD  HH24:MI') AS DATE
FROM TUserInfo U NATURAL JOIN TTweet T
WHERE LOWER(U.userName) = 'campusiot'
ORDER BY T.postTime DESC
;

--  Q2: Donnez la liste des tweets qui [contiennent à la fois le hashtag #postgresql et le hashtag #mysql](https://twitter.com/search?q=%23postgresql%20%23mysql&src=typed_query&f=top)
--  Q3: Donnez la liste des tweets référencant l'utilisateur @Frigiel
--  Q4: Donnez la liste des tweets de @Frigiel antérieurs à 2020 supprimés (retirés) ou modifiés.
--  Q5: Donnez le fil d'accueil de [@CampusIoT](https://twitter.com/CampusIoT) : ie les tweets des utilisateurs suivis par @CampusIoT ainsi que les tweets des autres utilisateurs contenant [@CampusIoT](https://twitter.com/CampusIoT). Remarque: Pensez à exclure les tweets des utilisateurs suspendus.
--  Q6: Donnez le nombre de tweets postés dans la dernière heure
--  Q7: Donnez les tweets les plus republiés dans la dernière heure
--  Q8: Donnez les utilisateurs qui suivent à la fois les utilisateurs @realDonaldTrump et @KamalaHarris
--  Q9: Donnez la liste des 'lurkers' : ie les utilisateurs qui ne redigent ni republient des tweets, qui ne suivent personne, et qui n'aiment aucun tweet.
--  Q10: Donnez le nombre moyen de tweets contenant des hashtags par utilisateur
--  Q11: Donnez le nombre moyen de 'likes' des tweets de l'utilisateur [@rdicosmo](https://twitter.com/rdicosmo)
--  Q12: Donnez les utilisateurs qui ont plus de followers que de 'following' 
--  Q13: Donnez les tweets les plus likés dans les dernières 6 heures (en incluant le score de sentiment moyen).
--  Q14: Donnez les tweets qui ont l'objet d'un grand nombre des rapports de comportement inappropriés.
--  Q15: Donnez les tweets qui sont des republications de tweets qui ont l'objet d'un grand nombre des rapports de comportement inappropriés.
--  Q16: Donnez les utilisateurs qui ont aimé le plus de tweets supprimés.
--  Q17: Donnez les utilisateurs qui ont aimé le plus de tweets d'utilisateurs suspendus.
--  Q18: Donnez le nombre de utilisateurs connectés en même temps qu'au moins 1 de leurs followers.
--  Q19: Donnez les utilisateurs dont le nombre de tweets contenant des images est supérieur à 70%.
--  Q20: Donnez les 10 utilisateurs qui ont fait la blague la plus drôle 😀 (Astuce : le contenu contient un ou plusieurs [Emoji U+1F60x](https://fr.wikipedia.org/wiki/%C3%89moji)).
--  Q21: Donnez la liste des utilisateurs qui semblent être des trolls ou des bots : ie beaucoup d'abonnés en très peu de temps, des abonnés qui sont eux-même des trolls ou des bots, ...
--  Q22: Donnez la liste des hashtags les plus populaires (aka tendances) ces dernières 24 heures. 
--  Q23: Donnez les tweets qui semblent être générés par un [transformeur GPT](https://fr.wikipedia.org/wiki/Transformeur) (IA générative).
--  Q24: Donnez les medias qui semblent être générés par un [transformeur GPT](https://fr.wikipedia.org/wiki/Transformeur) (IA générative).



-- Bannière générée avec https://manytools.org/hacker-tools/ascii-banner/