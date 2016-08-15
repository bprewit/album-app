<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    
    <!-- Bootstrap theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- UIKit CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/uikit/2.26.4/css/uikit.min.css">
    <title>My Albums</title>

</head>
<body>
    <div class="container">
        <div id="top">
            <table class="uk-table">
                <tr>
                    <td colspan=1><img alt="My Albums" src="/img/logo.png"/></td>
                    <td colspan=3 class="uk-text-left uk-table-middle"><h1>My Albums</h1></td>
                    <td colspan=1><img alt="Bruce Prewit" src="/img/logo2.png"/></td>
                </tr>
            </table>
            
            <?php if(!empty($_SESSION["id"])): ?>
            <ul class="nav nav-tabs">
                <li><a href="index.php?view=albums">Albums</a></li>
                <li><a href="index.php?view=artists">Artists</a></li>
                <li><a href="index.php?view=songs">Songs</a></li>
                <li><a href="logout.php">Log Out</a></li>
            </ul>
            <?php endif ?>
        </div>
        <div id="middle">
