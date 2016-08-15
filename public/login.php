<?php
    require("../includes/config.php"); 
    if($_SERVER["REQUEST_METHOD"] == "GET")
    {
        render("login_form.php", ["title" => "Log In"]);
    }
    else if($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if(empty($_POST["username"]))
        {
            gripe("Username is required.");
        }
        else if(empty($_POST["password"]))
        {
            gripe("Password is required.");
        }

        $rows = AlbumDB::query("SELECT user_id, password FROM users WHERE username = ?", $_POST["username"]);

        if(count($rows) == 1)
        {
            $row = $rows[0];
            if(password_verify($_POST["password"], $row["password"]))
            {
                $_SESSION["id"] = $row["user_id"];
                redirect("/");
            }
        }
        
        gripe("Invalid credentials.");
    }
?>
