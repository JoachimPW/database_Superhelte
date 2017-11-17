<body>

<?php
error_reporting( ~E_NOTICE );
require_once 'connect.php';

?>


 <?php
 
 

 
 $sql="SELECT * FROM Helte WHERE id !=18";
 $query = $conn->prepare($sql);
 $query->execute();
 $results = $query->fetchAll();


 $sql5="SELECT * FROM Kommentar";
 $query5 = $conn->prepare($sql5);
 $query->execute();
 $results5 = $query->fetchAll();
 
   ?>
   
   
<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
           <a class="navbar-brand" href="profil.php"> <img src="user_images/<?php echo ['Billede'];?>" class="img-rounded" width="70px" height="70px" </a>
    
            <a class="navbar-brand" href="profil.php">Profil</a>
            <a class="navbar-brand" href="index.php">Find superhelt</a>
            <a class="navbar-brand" href="Opret.php" style="float:right"> Opret profil </a>
        </div>
 
    </div>
</div>

<?php

  $Sender = 18;
    
        

        if(isset($_POST['btn_kommentar']))
        {      
        $Sender = $_POST['Comment_Sender'];
        $Modtager = $_POST['Comment_Modtager'];
        $Kommentar = $_POST['Kommentar'];

        if(empty($Kommentar)) {
            $erroMSG ="SKRIV NOGET";
        }


        if(!isset($erroMSG))
        {

        $sql3=("INSERT INTO kommentarer(Comment_Sender,Comment_Modtager,Kommentar) VALUES(:sender, :modtager, :kommentar)");
        $stmt3=$conn->prepare($sql3);
        $stmt3->bindParam(':sender',$Sender);
        $stmt3->bindParam(':modtager',$Modtager);
        $stmt3->bindParam(':kommentar',$Kommentar);
        $stmt3->execute();
        }
        }
    foreach($results as $row2) {

        $Helte=$row2["id"];
        $Likes=$row2["Liikes"];

        foreach($results as $id) {
            if(isset($_GET["$Helte"]))
            {
                $sql1=("UPDATE Helte SET Liikes = '$Likes' +1 WHERE id ='$Helte'");
                
                $stmt2=$conn->prepare($sql1);
                $stmt2->execute([$Likes]);
            }

        }
        ?>

        
        <?php


   
  
?>

<div class="col-lg-6">





	<p class="page-header"><?php echo $row2["Helt"]. "&nbsp;/&nbsp;" .$row2["Age"]. "&nbsp;/&nbsp;" .$row2["Power"]; ?></p>
    
	<img src="user_images/<?php echo $row2['Billede']; ?>" class="img-rounded" width="300px" height="300px"> 
    
     <form method="get"> <input placeholder="LIKE" type="submit" name="<?php echo $Helte?>" value="LIKE"> </form>
     <p> <?php echo $row2["Liikes"]; ?> Likes</p>
     <form method="post" class="form-horizontal" enctype="multipart/form-data">
     <input class="form-control" type="text" name="Kommentar" Placeholder="Din besked"   />
     <input class="form-control" type="hidden" name="Comment_Sender" Placeholder="Din besked" value="<?php echo $Sender?>"/>
     <input class="form-control" type="hidden" name="Comment_Modtager" Placeholder="Din besked"  value="<?php echo $Helte?>" display="invisible" />
     <button type="submit" name="btn_kommentar" class="btn btn-default" > POST </button>
     </form>
     <p> <strong> Wonderwoman skrev: </strong> <?php echo $Kommentar ?> </p> 
     
     </div>


   




<?php

    }
?>


</body>
</html>


