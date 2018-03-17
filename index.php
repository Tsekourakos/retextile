<?php session_start(); ?>
        <?
        if (array_key_exists('login', $_SESSION)) {
            if($_SESSION['login']==1){
                echo '<a href="/sdi1400161/user/profile.php">'.$_SESSION['username'].'</a>
                </li>
                <li>
                    <a href="/sdi1400161/logout.php">Αποσύνδεση</a>
                </li>
                ';
            }else{
                echo '<a href="/sdi1400161/user/login.php">Είσοδος/Έγγραφη</a>';
            }
        }else{
            echo '<a href="/sdi1400161/user/login.php">Είσοδος/Έγγραφη</a>';
        }
        ?>
