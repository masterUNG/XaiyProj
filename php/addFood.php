<?php
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");
	error_reporting(E_ERROR | E_PARSE);
if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {
				
		$idShop = $_GET['idShop'];
		$idGrp = $_GET['idGrp'];		
		$NameFood = $_GET['NameFood'];
		$PathImage = $_GET['PathImage'];
		$Price = $_GET['Price'];
		$Detail = $_GET['Detail'];
		$Status = $_GET['Status'];
		
							
		$sql = "INSERT INTO `foodtable`(`id`, `idShop`,`idGrp`, `NameFood`, `PathImage`, `Price`, `Detail`, `Status`) VALUES (Null,'$idShop','','$NameFood','$PathImage','$Price','$Detail' ,'')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Master xaiy";
   
}
	mysqli_close($link);
?>