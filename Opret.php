<?php
error_reporting( ~E_NOTICE );
require_once 'connect.php';






if(isset($_POST['btn_opret']))
	{
		$Helt = $_POST['Helt'];
		$Alder = $_POST['Alder'];
        $Superkraft = $_POST['Power'];
		
		$imgFile = $_FILES['Billede']['name'];
		$tmp_dir = $_FILES['Billede']['tmp_name'];
		$imgSize = $_FILES['Billede']['size'];
		
		
		if(empty($Helt)){
			$errMSG = "Indtast dit navn.";
		}
		else if(empty($Alder)){
			$errMSG = "Please Enter Your Job Work.";
		}
		else if(empty($imgFile)){
			$errMSG = "Please Select Image File.";
		}
		else
		{
			$upload_dir = 'user_images/'; 
	
			$imgExt = strtolower(pathinfo($imgFile,PATHINFO_EXTENSION)); 
		
			
			$valid_extensions = array('jpeg', 'jpg', 'png', 'gif'); 
		
			
			$userpic = rand(1000,1000000).".".$imgExt;
				
			
			if(in_array($imgExt, $valid_extensions)){			
				
				if($imgSize < 5000000)				{
					move_uploaded_file($tmp_dir,$upload_dir.$userpic);
				}
				else{
					$errMSG = "Filen er for stor";
				}
			}
			else{
				$errMSG = "JPG, JPEG, PNG & GIF er krav";		
			}
		}
		
		
		
		if(!isset($errMSG))
		{
			$stmt = $conn->prepare('INSERT INTO Helte(Helt,Age,Power,Billede) VALUES(:uname, :ujob, :power, :upic)');
			$stmt->bindParam(':uname',$Helt);
			$stmt->bindParam(':ujob',$Alder);
            $stmt->bindParam(':power',$Superkraft);
			$stmt->bindParam(':upic',$userpic);
			
			if($stmt->execute())
			{
				$successMSG = "Tillykke, du er nu oprettet i vores database ...";
				header("refresh:1;profil.php"); 
			}
			else
			{
				$errMSG = "error while inserting....";
			}
		}
	}
?>







































<body>

<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
 
        <div class="navbar-header">
            <a class="navbar-brand" href="Profil.php">Profil</a>
            <a class="navbar-brand" href="index.php">Find superhelt</a>
			 <a class="navbar-brand" href="Opret.php" style="float:right"> Opret profil </a>
            
        </div>
 
    </div>
</div>


<div class="container">


	<div class="page-header">
    	<h1 class="h2">Opret profil </h1>
    </div>

<div class="clearfix"></div>

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
    	<td><label class="control-label">Navn</label></td>
        <td><input class="form-control" type="text" name="Helt" placeholder="Dit navn" value="<?php echo $Helt; ?>" /></td>
    </tr>
    
    <tr>
    	<td><label class="control-label">Alder</label></td>
        <td><input class="form-control" type="text" name="Alder" placeholder="Din alder" value="<?php echo $Alder; ?>" /></td>
    </tr>

     <tr>
    	<td><label class="control-label">Superkraft</label></td>
        <td><input class="form-control" type="text" name="Power" placeholder="Dine superkræfter" value="<?php echo $Superkraft; ?>" /></td>
    </tr>

    
    <tr>
    	<td><label class="control-label">Profilbillede</label></td>
        <td><input class="input-group" type="file" name="Billede" accept="image/*" /></td>
    </tr>
    
    <tr>
        <td colspan="2"><button type="submit" name="btn_opret" class="btn btn-default">
        <span class="glyphicon glyphicon-save"></span> &nbsp; Opret
        </button>
        </td>
    </tr>
    
    </table>
    
</form>




</div>
</body>
</html>