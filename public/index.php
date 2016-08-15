<?php
    // configuration
    require("../includes/config.php");
    
    $view = (isset($_REQUEST['view'])) ? $_REQUEST['view'] : 'albums';
    
    switch($view)
    {
    case "albums":
    default:
        $sql = "SELECT DISTINCT " .
            	"   a.album AS title, " .
            	"   c.artist " .
                "FROM albums a " .
                "JOIN album_artists b USING (album_id) " .
                "JOIN artists c USING (artist_id) " .
                "JOIN user_albums u USING (album_id) " .
                "WHERE u.user_id = ? " .
                "AND a.album IS NOT NULL " .
                "AND c.artist IS NOT NULL " .
                "ORDER BY title ";
    
        $albums = AlbumDB::query($sql, $_SESSION["id"]);
        render("albums.php", ["title" => "Albums", "albums" => $albums]);
        break;
        
    case "artists":
        $sql = "SELECT DISTINCT " .
                "   a.artist AS name, " .
                "   c.album " .
                "FROM artists a " .
                "JOIN album_artists b USING (artist_id) " .
                "JOIN albums c USING (album_id) " .
                "JOIN user_albums u USING (album_id) " .
                "WHERE u.user_id = ? " .
                "AND a.artist IS NOT NULL " .
                "AND c.album IS NOT NULL " .
                "ORDER BY name ";
        $artists = AlbumDB::query($sql, $_SESSION["id"]);
        render("artists.php", ["title" => "Artists", "artists" => $artists]);
        break;
        
    case "songs":
        $sql = "SELECT DISTINCT " .
                "   s.title, " .
                "   a.artist, " .
                "   b.album " .
                "FROM songs s " .
                "JOIN artists a USING (artist_id) " .
                "JOIN albums b USING (album_id ) " .
                "JOIN user_albums u USING (album_id) " .
                "WHERE u.user_id = ? " .
                "ORDER BY s.title";
        $songs = AlbumDB::query($sql, $_SESSION["id"]);
        render("songs.php",["title" => "Songs", "songs" => $songs]);
    }
?>
