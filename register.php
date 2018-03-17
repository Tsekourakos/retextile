<?php
    header('Content-Type: application/json');
    header('Access-Control-Allow-Origin: *');
    require_once './login_db.php';
    // $name = $_POST['name'];
    // $surname = $_POST['surname'];
    // $address = $_POST['address'];
    // $zip_code = $_POST['zip_code'];
    // $afm = $_POST['post'];
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
    }

    $loginquery = "SELECT * FROM `login` WHERE `email`= ?";
    $stmt->execute($email);
    $result1 = $stmt -> fetch(PDO::FETCH_ASSOC);
    if(!$result1) {
        $emailErr = "Email already exists";
        echo "{\"error\": \"".$emailErr."\"}";
        exit;
    }

    
    // echo "{\"error\": \"".$passwordErr."\"}";

 ?>
