<?php
    require("../includes/config.php");

    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        render("register_form.php", ["title" => "Register"]);
    }
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if($_POST["password"] == "" or $_POST["confirmation"] == "")
        {
            gripe("Empty password or confirmation");
        }
        
        if($_POST["password"] != $_POST["confirmation"])
        {
            gripe("Passwords do not match");
        }

        $sql = "SELECT user_id FROM users WHERE username = ?";
        $rc = AlbumDB::query($sql, $_POST["username"]);
        
        if($rc[0] != 0)
        {
            gripe("Username is already taken!");
        }
        
        $sql = "INSERT INTO users (username, password, first, last, email) " .
                "VALUES(?, ?, ?, ?, ?)";
                
        $rc = AlbumDB::query($sql,
                            $_POST["username"], 
                            password_hash($_POST["password"], PASSWORD_DEFAULT),
                            $_POST["firstname"],
                            $_POST["lastname"],
                            $_POST["email"]);
        if($rc !== 1)
        {
            gripe("Something went wrong! (Maybe you're already registered?)");
        }
        
        $rows = AlbumDB::query("SELECT LAST_INSERT_ID() AS id");
        $id = $rows[0]["id"];
        $_SESSION["id"] = $id;
        redirect("/");
    }
?>