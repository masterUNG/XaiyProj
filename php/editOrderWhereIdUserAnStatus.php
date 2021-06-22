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
				
		$idUser = $_GET['idUser'];
		$Status = $_GET['Status'];
		$Status2 = $_GET['Status2'];
		
		
							
		$sql = "UPDATE `ordertable` SET `Status` = '$Status2' WHERE idUser = '$idUser' AND Status = '$Status'";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Master UNG";	// if2
   
}	// if1


	mysqli_close($link);
?>