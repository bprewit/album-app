<div>
    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Title</th>
                <th>Artist</th>
            </tr>
        </thead>
        <tbody>
            <?php 
                foreach($albums as $album)
                {
                    print("<tr>");
                    print("<td>"    . $album["title"]   . "</td>");
                    print("<td>"    . $album["artist"]  . "</td>");
                    print("</tr>");
                }
            ?>
        </tbody>
    </table>
</div>
