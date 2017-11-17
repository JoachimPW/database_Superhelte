<?php
error_reporting( ~E_NOTICE );
require_once 'connect.php';
?>

<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
 
        <div class="navbar-header">
            <a class="navbar-brand" href="profil.php">Profil</a>
            <a class="navbar-brand" href="index.php">Find superhelt</a>
            <a class="navbar-brand" href="Opret.php" style="float:right"> Opret profil </a>
        </div>
 
    </div>
</div>

<!-- PROFIL -->

<div class="row">
<?php
 
 $stmt = $conn->prepare('SELECT id, Helt, Age, Power, Billede FROM Helte ORDER BY id DESC LIMIT 1');
 $stmt->execute();
 
 if($stmt->rowCount() > 0)
 {
  while($row=$stmt->fetch(PDO::FETCH_ASSOC))
  {
   extract($row);
   ?>
   
   <div class="col-lg-10">
    <p class="page-header"><?php echo $Helt."&nbsp;/&nbsp;".$Age. "&nbsp;/&nbsp;". $Power; ?></p>
    <img src="user_images/<?php echo $row['Billede']; ?>" class="img-rounded" width="500px" height="450px" />
	<h3> Beskeder du har sendt </h3>
	
    
   </div>     
   </div>  
   <?php
  }
 }
 else
 {
  ?>
        <div class="col-xs-12">
         <div class="alert alert-warning">
             <span class="glyphicon glyphicon-info-sign"></span> &nbsp; Mangler data
            </div>
        </div>
        <?php
 }



 
 $stmt1 = $conn->prepare('SELECT helte.id, kommentarer.Comment_Modtager, helte.Helt, kommentarer.Kommentar
FROM helte
INNER JOIN kommentarer ON helte.id=kommentarer.Comment_Modtager');
 $stmt1->execute();
 
 if($stmt1->rowCount() > 0)
 {
  while($row1=$stmt1->fetch(PDO::FETCH_ASSOC))
  {
   extract($row1);
   ?>

     <div style="float:right">
	 
	  	<p> <strong> <?php echo $row1["Helt"]; ?></strong> </p>
    <p> <?php echo $row1["Kommentar"]; ?> </p>

<div>
</div>
      
   <?php
  }
 }



 
?>




<!-- OPDATER PROFIL -->

<?php


if(isset($_GET['edit_id']) && !empty($_GET['edit_id']))
	{
		$id = $_GET['edit_id'];
		$stmt_edit = $conn->prepare('SELECT Helt, Age, Power, Billede FROM Helte WHERE id =:uid');
		$stmt_edit->execute(array(':uid'=>$id));
		$edit_row = $stmt_edit->fetch(PDO::FETCH_ASSOC);
		extract($edit_row);
	}
	
	
	
	
	if(isset($_POST['btn_opdater']))
	{
		$Helt = $_POST['Helt'];
		$Age = $_POST['Age'];
        $Power = $_POST['Power'];
			
		$imgFile = $_FILES['Billede']['name'];
		$tmp_dir = $_FILES['Billede']['tmp_name'];
		$imgSize = $_FILES['Billede']['size'];
					
		if($imgFile)
		{
			$upload_dir = 'user_images/'; 
			$imgExt = strtolower(pathinfo($imgFile,PATHINFO_EXTENSION)); 
			$valid_extensions = array('jpeg', 'jpg', 'png', 'gif'); 
			$userpic = rand(1000,1000000).".".$imgExt;
			if(in_array($imgExt, $valid_extensions))
			{			
				if($imgSize < 5000000)
				{
					unlink($upload_dir.$edit_row['Billede']);
					move_uploaded_file($tmp_dir,$upload_dir.$userpic);
				}
				else
				{
					$errMSG = "Sorry, your file is too large it should be less then 5MB";
				}
			}
			else
			{
				$errMSG = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";		
			}	
		}
		else
		{
			
			$userpic = $edit_row['Billede']; 
		}	
						
		
		
		if(!isset($errMSG))
		{
			$stmt = $conn->prepare('UPDATE superhelte 
									     SET Helt=:uname, 
										     Age=:ujob, 
										     Power=:power, 
                                             Billede=:upic
								       WHERE id=:uid');
			$stmt->bindParam(':uname',$Helt);
			$stmt->bindParam(':ujob',$Age);
            $stmt->bindParam(':power',$Power);
			$stmt->bindParam(':upic',$userpic);
			$stmt->bindParam(':uid',$id);
				
			if($stmt->execute()){
				?>
                <script>
				alert('Successfully Updated ...');
				
				</script>
                <?php
			}
			else{
				$errMSG = "Sorry Data Could Not Updated !";
			}
		
		}
		
						
	}
	
?>




<div class="container">


	<div class="page-header">
    	<h1 class="h2">Profil </h1>
    </div>



<h2> Opdater profil </h2>

<form method="post" enctype="multipart/form-data" class="form-horizontal">
	
    
    <?php
	if(isset($errMSG)){
		?>
        <div class="alert alert-danger">
          <span class="glyphicon glyphicon-info-sign"></span> &nbsp; <?php echo $errMSG; ?>
        </div>
        <?php
	}
	?>
   
    
	<table class="table table-bordered table-responsive">
	
    <tr>
    	<td><label class="control-label">Navn.</label></td>
        <td><input class="form-control" type="text" name="Helt" value="<?php echo $Helt; ?>" required /></td>
    </tr>
    
    <tr>
    	<td><label class="control-label">Alder</label></td>
        <td><input class="form-control" type="text" name="Age" value="<?php echo $Age; ?>" required /></td>
    </tr>

    <tr>
    	<td><label class="control-label">Superkraft</label></td>
        <td><input class="form-control" type="text" name="Power" value="<?php echo $Power; ?>" required /></td>
    </tr>
    
    <tr>
    	<td><label class="control-label">Profilbillede</label></td>
        <td>
        	<p><img src="user_images/<?php echo $userpic; ?>" height="150" width="150" /></p>
        	<input class="input-group" type="file" name="Billede" accept="image/*" />
        </td>
    </tr>
    
    <tr>
        <td colspan="2"><button type="submit" name="btn_opdater" class="btn btn-default">
        <span class="glyphicon glyphicon-save"></span> Opdater
        </button>
        
        
        
        </td>
    </tr>
    
    </table>
    
</form>

