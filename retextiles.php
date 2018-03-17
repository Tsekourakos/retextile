<?php
    header('Content-Type: application/json');
	header('Access-Control-Allow-Origin: *');
    include './login_db.php';
    $textile_query = "SELECT * FROM `retextile`";

    $stmt = $dbConnection->prepare($textile_query);
    $stmt->execute();

    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo "{\"retextiles\":".json_encode($result , JSON_UNESCAPED_UNICODE )."}";

 ?>
