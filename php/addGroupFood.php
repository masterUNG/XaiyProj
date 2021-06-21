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
		$NameGroup = $_GET['NameGroup'];
		$PathImage = $_GET['PathImage'];
		
		
							
		$sql = "INSERT INTO `groupfood`(`id`, `idShop`, `NameGroup`, `PathImage`) VALUES (Null,'$idShop','$NameGroup','$PathImage')";

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