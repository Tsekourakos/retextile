<?php
    require_once '../login_db.php';
    // header('Content-Type: application/json');
    // $email = "ilias2@gmail.com" ;
    $email = $_POST['email'];

    // $pwd ="1";
    $pwd = $_POST['pwd'];
    
    $loginquery = "SELECT * FROM `login` WHERE `email`= ? AND `password`= ?";
    $args = [$email, $pwd];
    $stmt = $dbConnection->prepare($loginquery);
    // $stmt->bindParam(':email', $email, PDO::PARAM_STR);
    // $stmt->bindParam(':password', $pwd, PDO::PARAM_STR);

    $stmt->execute($args);
    $result1 = $stmt -> fetch(PDO::FETCH_ASSOC);

    // print_r( );
    if($result1){
        $userquery = "SELECT * FROM `users` WHERE `id` = ?";
        $stmt = $dbConnection->prepare($userquery);
        $stmt->execute([$result1['users_id']]);
        $result2 = $stmt -> fetch(PDO::FETCH_ASSOC);

        echo json_encode( $result2);
    }
    else {
        # code...
        $response = array('email' => $email);
        echo json_encode($response);
    }
 ?>
