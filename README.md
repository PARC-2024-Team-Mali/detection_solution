# Detection_solution



# TEAM1_RobotsMali: PARC Engineers League

Introduction:</BR>
    Le défi de cette phase de simulation consiste à créer un logiciel pour faire fonctionner le PARC AgRobot (Robot agricole) qui est un véhicule au sol sans pilote (UGV) équipé de différents capteurs.Les robots agricoles doivent être capables de naviguer dans les cultures et les terres agricoles, ce qui inclut de se déplacer de manière autonome dans les rangées de laitues sur un terrain accidenté dont les etapes se divise en deux taches qui sont: le deplacemnt du robot jusqu'à atteindre un but précis et la detection des coordonnées GPS de chaque herbe présent sur l'environnement, au cours du trajet le robot effectue des virages sur un terrain accidenté suivant un ittineraire précis  jusqu’à ce que l’emplacement du but soit atteint.
    
L'utilisation de PARC AgRobot (Robot agricole)  en Afrique présente plusieurs avantages convaincants. Ces robots améliorent l'efficacité agricole, réduisent la pénurie de main-d'œuvre, augmentent la précision des opérations, s'adaptent aux conditions locales et réduisent l'utilisation excessive de produits chimiques. Cependant, l'adoption des robots en agriculture peut rencontrer des défis tels que le coût, l'accès à l'électricité, la formation des agriculteurs, etc. Malgré ces défis, l'utilisation de robots peut contribuer à améliorer la productivité et la durabilité de l'agriculture en Afrique.

    

Pays de l’équipe: MALI

Noms des membres de l’équipe:

    Nom et Prénom: 
    Etudiant: 
    Ecole: .

    Nom et Prénom: 
    Etudiant : 
    Ecole: .

    Nom et Prénom: 
    Etudiant:
    Ecole:.

    Nom et Prénom: 
    Ecole: .
    Ecole:.
    
    Nom et Prénom: 
    Etudiant:
    Ecole:.
    
Dépendances
    Les Packages nécessaires sont:    (requis Python version 3)

    rospy: 
         rospy est une bibliothèque client Python pure pour ROS. L’API client Rospy permet aux programmeurs Python d’interagir rapidement avec ROS Topics, Services et Parameters. La conception de rospy favorise la vitesse d’implémentation (i.developer time) sur les performances d’exécution afin que les algorithmes puissent être rapidement prototypés et testés au sein de ROS. Il est également idéal pour le code de chemin non critique, comme le code de configuration et d’initialisation. De nombreux outils ROS sont écrits en rose pour profiter des capacités d’introspection de type. De nombreux outils de ROS, tels que rostopic et rosservice, sont construits sur le dessus de rospy.

    roscpp :
        roscpp est une implémentation C++ de ROS. Il fournit une bibliothèque client qui permet aux programmeurs C++ d’interagir rapidement avec les sujets, les services et les paramètres ROS. roscpp est la bibliothèque client ROS la plus utilisée et est conçue pour être la bibliothèque haute performance pour ROS.

    actionlib:
       La pile actionlib fournit une interface normalisée pour l’interfaçage avec les tâches pré-emptables. 
       Par exemple, déplacer la base vers un emplacement cible, effectuer un balayage laser et retourner le nuage de points résultant, détecter la poignée d’une porte, etc.

    Dans tout grand système basé sur ROS, il y a des cas où quelqu’un voudrait envoyer une demande à un noeud pour effectuer une tâche, et aussi recevoir une réponse à la demande. Cela peut actuellement être réalisé via les services ROS.

    Dans certains cas, cependant, si le service prend beaucoup de temps à exécuter, l’utilisateur peut vouloir la possibilité d’annuler la demande pendant l’exécution ou obtenir des commentaires périodiques sur la façon dont la demande progresse. Le paquet actionlib fournit des outils pour créer des serveurs qui exécutent des objectifs de longue durée qui peuvent être pré-exemptés. Il fournit également une interface client afin d’envoyer des requêtes au serveur.

    std_msgs:
       std_msgs contient des wrappers pour les types primitifs ROS, qui sont documentés dans la spécification msg. Il contient également le type Vide, qui est utile pour envoyer un signal vide. Cependant, ces types ne transmettent pas de sens sémantique sur leur contenu : chaque message a simplement un champ appelé "data". Par conséquent, alors que les messages dans ce paquet peuvent être utiles pour le prototypage rapide, ils ne sont PAS destinés à une utilisation "à long terme". Pour faciliter la documentation et la collaboration, nous recommandons d’utiliser les messages existants ou de créer de nouveaux messages qui fournissent des noms de champ significatifs.

    Notez que ce paquet contient également les types "MultiArray", qui peuvent être utiles pour stocker des données de capteur. Cependant, la même mise en garde s’applique : c’est généralement "mieux" (dans le sens de rendre le code plus facile à comprendre, etc.) lorsque les développeurs utilisent ou créent des types de messages non génériques.

    actionlib_msgs:
      La pile actionlib fournit une interface normalisée pour l’interfaçage avec les tâches pré-emptables. Par exemple, déplacer la base vers un emplacement cible, effectuer un balayage laser et retourner le nuage de points résultant, détecter la poignée d’une porte, etc.

    sensor_msgs:
      Cet ensemble définit les messages pour les capteurs couramment utilisés, y compris les caméras et les télémètres à balayage laser.

    geometry_msgs:
       geometry_msgs fournit des messages pour les primitives géométriques courantes telles que les points, les vecteurs et les poses. Ces primitives sont conçues pour fournir un type de données commun et faciliter l’interopérabilité dans l’ensemble du système.

    cv_bridge:
      Il contient CvBridge, qui convertit les messages ROS Image et les images OpenCV.

    tf:
       tf est un paquet qui permet à l’utilisateur de garder une trace de plusieurs trames de coordonnées au fil du temps. tf maintient la relation entre les cadres de coordonnées dans une arborescence tamponnée dans le temps, et permet à l’utilisateur de transformer des points, des vecteurs, etc., entre deux cadres de coordonnées à tout moment souhaité.

    action robot:
    robot d’action est notre planificateur local qui permet de déplacer le robot d’un point à un autre.

Mathlab:
      MathLab (ou MATLAB) est un environnement de programmation et de calcul numérique largement utilisé dans divers domaines scientifiques et techniques. MathLab offre des fonctionnalités puissantes pour le traitement et l'analyse des données, ce qui permet de prendre des décisions plus éclairées dans les opérations agricoles.
   


Tache 1:

   Dans cette tâche, notre robot navigue en toute sécurité sur les trottoirs.
   cette solution fonctionne seulement sur la route 1

      Exécutez la commande suivante pour exécuter la tache 1
      $ roslaunch task1_solution task1_solution.launch

Tache 2:

   Dans cette tâche, notre robot detecte la différence entre les herbes et les salades afin de localiser la position des herbes dans le champ.
   cette solution fonctionne seulement sur toute les routes durant le trajet de deplacemment du robot.

      Exécutez la commande suivante pour exécuter la tache 2
      $ roslaunch task2_solution task2_solution.launch

Défis rencontrés
    Au sujet du défi, nous avons eu des problèmes avec les installations de ROS. Nous avons également eu des erreurs avec avec l'aquisition et le traitement des données, l'application de filtre dans un espace colorimétrique, la calibration de la camera, les transformation suvant les cadres de coordonnées spécifique, la localisation d'herbe dans diverce image fourni par les cameras, la difficultée d'utilisation des bibithèque comme : geometry_msgs, sensor_msgs, cv_bridge mais en fin de compte, une solution a été trouvée pour la configuration du fichier rplidar.xacro (parce que nous utilisons le CPU et non le GPU, avec le CPU, la machine prend beaucoup de temps lors de l’exécution d’une tâche à chaque fois ou parfois la machine se plante et elle devra être redémarrée.)
    
# TEAM2_RobotsMali: PARC Engineers League

Introduction:</BR>
    Le défi de cette phase de simulation consiste à créer un logiciel pour rendre autonome le PARC AgRobot (Robot agricole) qui est un véhicule terrestre autonome (UGV). Le robot doit être capable de se déplacer de manière autonome sur le terrain pour inspecter les cultures et détecter les mauvaises herbes. Il peut utiliser des capteurs tels que des caméras, des lidars et des modules GPS pour se déplacer avec précision dans un environnement dont les etapes se divise en deux taches qui sont: le deplacemnt du robot jusqu'à atteindre un but précis et la detection des coordonnées GPS de chaque herbe présent sur l'environnement, au cours du trajet le robot effectue des virages sur un terrain accidenté suivant un ittineraire précis  jusqu’à ce que l’emplacement du but soit atteint.
    
L'utilisation de PARC AgRobot (Robot agricole)  en Afrique présente plusieurs avantages convaincants. Le PARC AgRobot peut être programmé pour effectuer des tâches agricoles spécifiques telles que la plantation, l'arrosage, la fertilisation la récolte et la diminution de l'utilisation des produits chimiques. Ils peuvent travailler de manière plus rapide et plus efficace que les travailleurs humains, ce qui peut augmenter la production et la diminution du prix des produits agricole. Malgré ces défis, l'utilisation de robots peut contribuer à améliorer la productivité et la durabilité de l'agriculture en Afrique et dans le monde entier.

    

Pays de l’équipe: MALI

Noms des membres de l’équipe:

    Nom et Prénom: 
    Etudiant: 
    Ecole: .

    Nom et Prénom: 
    Etudiant : 
    Ecole: .

    Nom et Prénom: 
    Etudiant:
    Ecole:.

    Nom et Prénom: 
    Ecole: .
    Ecole:.
    
    Nom et Prénom: 
    Etudiant:
    Ecole:.
    
Dépendances
    Les Packages nécessaires sont:    (requis Python version 3)

    rospy: 
         rospy est une bibliothèque client Python pure pour ROS. L’API client Rospy permet aux programmeurs Python d’interagir rapidement avec ROS Topics, Services et Parameters. La conception de rospy favorise la vitesse d’implémentation (i.developer time) sur les performances d’exécution afin que les algorithmes puissent être rapidement prototypés et testés au sein de ROS. Il est également idéal pour le code de chemin non critique, comme le code de configuration et d’initialisation. De nombreux outils ROS sont écrits en rose pour profiter des capacités d’introspection de type. De nombreux outils de ROS, tels que rostopic et rosservice, sont construits sur le dessus de rospy.

    roscpp :
        roscpp est une implémentation C++ de ROS. Il fournit une bibliothèque client qui permet aux programmeurs C++ d’interagir rapidement avec les sujets, les services et les paramètres ROS. roscpp est la bibliothèque client ROS la plus utilisée et est conçue pour être la bibliothèque haute performance pour ROS.

    actionlib:
       La pile actionlib fournit une interface normalisée pour l’interfaçage avec les tâches pré-emptables. 
       Par exemple, déplacer la base vers un emplacement cible, effectuer un balayage laser et retourner le nuage de points résultant, détecter la poignée d’une porte, etc.

    Dans tout grand système basé sur ROS, il y a des cas où quelqu’un voudrait envoyer une demande à un noeud pour effectuer une tâche, et aussi recevoir une réponse à la demande. Cela peut actuellement être réalisé via les services ROS.

    Dans certains cas, cependant, si le service prend beaucoup de temps à exécuter, l’utilisateur peut vouloir la possibilité d’annuler la demande pendant l’exécution ou obtenir des commentaires périodiques sur la façon dont la demande progresse. Le paquet actionlib fournit des outils pour créer des serveurs qui exécutent des objectifs de longue durée qui peuvent être pré-exemptés. Il fournit également une interface client afin d’envoyer des requêtes au serveur.

    std_msgs:
       std_msgs contient des wrappers pour les types primitifs ROS, qui sont documentés dans la spécification msg. Il contient également le type Vide, qui est utile pour envoyer un signal vide. Cependant, ces types ne transmettent pas de sens sémantique sur leur contenu : chaque message a simplement un champ appelé "data". Par conséquent, alors que les messages dans ce paquet peuvent être utiles pour le prototypage rapide, ils ne sont PAS destinés à une utilisation "à long terme". Pour faciliter la documentation et la collaboration, nous recommandons d’utiliser les messages existants ou de créer de nouveaux messages qui fournissent des noms de champ significatifs.

    Notez que ce paquet contient également les types "MultiArray", qui peuvent être utiles pour stocker des données de capteur. Cependant, la même mise en garde s’applique : c’est généralement "mieux" (dans le sens de rendre le code plus facile à comprendre, etc.) lorsque les développeurs utilisent ou créent des types de messages non génériques.

    actionlib_msgs:
      La pile actionlib fournit une interface normalisée pour l’interfaçage avec les tâches pré-emptables. Par exemple, déplacer la base vers un emplacement cible, effectuer un balayage laser et retourner le nuage de points résultant, détecter la poignée d’une porte, etc.

    sensor_msgs:
      Cet ensemble définit les messages pour les capteurs couramment utilisés, y compris les caméras et les télémètres à balayage laser.

    geometry_msgs:
       geometry_msgs fournit des messages pour les primitives géométriques courantes telles que les points, les vecteurs et les poses. Ces primitives sont conçues pour fournir un type de données commun et faciliter l’interopérabilité dans l’ensemble du système.

    cv_bridge:
      Il contient CvBridge, qui convertit les messages ROS Image et les images OpenCV.

    tf:
       tf est un paquet qui permet à l’utilisateur de garder une trace de plusieurs trames de coordonnées au fil du temps. tf maintient la relation entre les cadres de coordonnées dans une arborescence tamponnée dans le temps, et permet à l’utilisateur de transformer des points, des vecteurs, etc., entre deux cadres de coordonnées à tout moment souhaité.

    action robot:
    robot d’action est notre planificateur local qui permet de déplacer le robot d’un point à un autre.

Mathlab:
      MathLab offre des outils de modélisation et de simulation qui permettent aux ingénieurs de concevoir et d'optimiser des systèmes robotiques agricoles. Vous pouvez créer des modèles mathématiques représentant le comportement des robots, des capteurs, des actionneurs, etc., et les simuler dans un environnement virtuel. Cela permet de prédire les performances du système, d'optimiser les paramètres et de minimiser les erreurs avant la mise en œuvre réelle.


Tache 1:

   Dans cette tâche, notre robot autonome navigue en toute sécurité sur les trottoirs à travers differents procéssus succéssives.
   Cette solution fonctionne seulement sur la route 1

      Exécutez la commande suivante pour exécuter task1
      $ roslaunch task1_solution task1_solution.launch


Tache 2:

   Dans cette tâche, notre robot détecte la différence entre les herbes et les salades afin de localiser la position des herbes dans le champ.
   cette solution fonctionne sur toute les routes durant le deplacemment du robot.

      Exécutez la commande suivante pour exécuter la tache 2
      $ roslaunch task2_solution task2_solution.launch


Défis rencontrés
    Au sujet du défi, nous avons eu des problèmes avec les installations et la pris en main de ROS. Nous avons également eu des erreurs avec l'aquisition et le traitement des données, l'application de filtre de couleur, la calibration de la camera, les transformation suvant des cadres de coordonnées, la localisation d'herbe dans diverce image fourni par la camera,l'utilisation de different biblothèque comme: geometry_msgs, sensor_msgs, cv_bridge... mais en fin de compte, une solution a été trouvée pour la configuration du fichier rplidar.xacro (parce que nous utilisons le CPU et non le GPU)
    Avec le CPU, la machine prend beaucoup de temps lors de l’exécution d’une tâche à chaque fois ou parfois la machine se plante et elle devra être redémarrée.
    
