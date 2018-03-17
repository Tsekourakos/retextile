<?php
    header('Content-Type: application/json');
    header('Access-Control-Allow-Origin: *');
    require_once './login_db.php';
    $name = (isset($_POST['name']) ? $_POST['name'] : "");
    $surname = (isset($_POST['surname']) ? $_POST['surname'] : "");
    $address = (isset($_POST['address']) ? $_POST['address'] : "");
    $zip_code = (isset($_POST['zip_code']) ? $_POST['zip_code'] : "");
    $afm = (isset($_POST['afm']) ? $_POST['afm'] : "");
    $email = (isset($_POST['email']) ? $_POST['email'] : "");
    $pwd = (isset($_POST['pwd']) ? $_POST['pwd'] : "");
    $pwd2 = (isset($_POST['pwd2']) ? $_POST['pwd2'] : "");

    if(!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL) === false) {
        $emailErr = "Invalid email format";
        echo "{\"error\": \"".$emailErr."\"}";
        exit;
    }
    if(!empty($pwd) && ($pwd == $pwd2)) {
        $password = $pwd;
        $cpassword = $pwd2;
        if (strlen($pwd) < 8) {
            $passwordErr = "Your Password Must Contain At Least 8 Characters! ".strlen($pwd);
            echo "{\"error\": \"".$passwordErr."\"}";
            exit;
        }
        elseif(!preg_match("#[0-9]+#",$password)) {
            $passwordErr = "Your Password Must Contain At Least 1 Number!";
            echo "{\"error\": \"".$passwordErr."\"}";
            exit;
        }
        else{
            $passwordErr = "ok";
        }


    }else {
         $passwordErr = "Not Valid Password ".$pwd;
         echo "{\"error\": \"".$passwordErr."\"}";
         exit;
    }

    $emailcheck = "SELECT * FROM `login` WHERE `email`= ?";
    $stmt = $dbConnection->prepare($emailcheck);
    $stmt->execute([$email]);
    $result1 = $stmt -> fetch(PDO::FETCH_ASSOC);
    if($result1) {
        $emailErr = "Email already exists";
        echo "{\"error\": \"".$emailErr."\"}";
        exit;
    }

    $createuser = "INSERT INTO users(name, surname, address, zip_code, afm) VALUES (?, ?, ?, ?, ? )";
    $stmt = $dbConnection->prepare($createuser);
    $userargs = [$name, $surname, $address, $zip_code, $afm];
    $stmt->execute($userargs);
    $id = $dbConnection->lastInsertId();

    $createlogin = "INSERT INTO login(users_id, email, password) VALUES(?, ?, ? )";
    $stmt = $dbConnection->prepare($createlogin);
    $loginargs = [$id, $email, $pwd];
    $stmt -> execute($loginargs);

    $getuser = "SELECT * FROM users WHERE id=?";
    $stmt = $dbConnection->prepare($getuser);
    $stmt->execute([$id]);
    $newuser = $stmt -> fetch(PDO::FETCH_ASSOC);
    // $userargs = $idarray+$userargs;
    echo json_encode($newuser);
    // echo $id;
    // $response = array('id' =>);
    // echo "{\"error\": \"".$passwordErr."\"}";

 ?>
