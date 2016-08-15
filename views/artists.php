<div>
    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Artist</th>
                <th>Album</th>
            </tr>
        </thead>
        <tbody>
            <?php 
                foreach($artists as $artist)
                {
                    print("<tr>");
                    print("<td>"    . $artist["name"]   . "</td>");
                    print("<td>"    . $artist["album"]  . "</td>");
                    print("</tr>");
                }
            ?>
        </tbody>
    </table>
</div>
