<div>
    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Song</th>
                <th>Artist</th>
                <th>Album</th>
            </tr>
        </thead>
        <tbody>
            <?php 
                foreach($songs as $song)
                {
                    print("<tr>");
                    print("<td>"    . $song["title"]    . "</td>");
                    print("<td>"    . $song["artist"]   . "</td>");
                    print("<td>"    . $song["album"]    . "</td>");
                    print("</tr>");
                }
            ?>
        </tbody>
    </table>
</div>
