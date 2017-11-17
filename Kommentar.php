 
 
 
 <?php

 error_reporting( ~E_NOTICE );
require_once 'connect.php';

        if(isset($_POST['btn_kommentar']))
        {

        $Sender = $_POST["Comment_sender"];
        $Modtager = $_POST["Comment_modtager"];
        $Kommentar = $_POST["Kommentar"];

        if(empty($Kommentar)) {
            $erroMSG ="SKRIV NOGET";
        }


        if(!isset($erroMSG))
        {

        $sql3=("INSERT INTO Kommentarer(Comment_sender,Comment_modtager,Kommentar) VALUES(:sender, :modtager, :kommentar)");
        $stmt3=$conn->prepare($sql3);
        $stmt3->bindParam(':sender',$Sender);
        $stmt3->bindParam(':modtager',$Modtager);
        $stmt3->bindParam(':kommentar',$Kommentar);
       
        $stmt3->execute();
        }
        }
        
?>

<div class="col-lg-4">
	
 


	
     <form method="get"> <input placeholder="LIKE" type="submit" name="<?php echo $Helte?>" value="LIKE"> </form>
     <form method="post" class="form-horizontal" enctype="multipart/form-data">
     <input class="form-control" type="text" name="Kommentar" Placeholder="Din besked" value="<?php echo $Kommentar;?>"  />
     <input class="form-control" type="text" name="Comment_sender" Placeholder="Din besked" value="<?php echo $Sender;?>"  />
     <input class="form-control" type="text" name="Comment_modtager" Placeholder="Din besked"  value="<?php echo $Modtager;?>" />
     <button type="submit" name="btn_kommentar" class="btn btn-default" > POST </button>
     </form>
     
     </div>


</html>