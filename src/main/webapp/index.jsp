<%@ pyear contentType="text/html; charset=UTF-8" pyearEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Music list</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #008CBA;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        form {
            margin: 20px;
            display: inline-block;
        }

        label {
            display: inline-block;
            width: 100px;
            text-align: right;
            margin-right: 5px;
        }

        input[type="text"], input[type="number"] {
            display: inline-block;
            width: 150px;
            margin-bottom: 5px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="button"] {
            padding: 5px 10px;
            background-color: #008CBA;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="button"]:hover {
            background-color: #006CBA;
        }

        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
        }

    </style>
</head>
<body>
<h1>Music list</h1>

<form>
    <label for="name">Name:</label>
    <input type="text" id="name" name="name"><br>

    <label for="author">Author:</label>
    <input type="text" id="author" name="author"><br>
    
    <label for="year">Year:</label>
    <input type="number" id="year" name="year"><br>

    <label for="album">Album:</label>
    <input type="text" id="album" name="album"><br>

    <label for="country">Country:</label>
    <input type="text" id="country" name="country"><br>

    <input type="button" value="Add music" onclick="addMusic()">
</form>

<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Author</th>
        <th>Year</th>
        <th>Album</th>
        <th>Country</th>
    </tr>
    </thead>
    <tbody id="MusicTableBody">
    </tbody>
</table>

<script>
    function addMusic() {
        let name = document.getElementById("name").value;
        let author = document.getElementById("author").value;
        let year = document.getElementById("year").value;
        let album = document.getElementById("album").value;
        let country = document.getElementById("country").value;

        let xhr = new XMLHttpRequest();
        xhr.open("POST", "MusicController");
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    let success = JSON.parse(xhr.responseText);
                    if (success) {
                        getMusicList();
                    } else {
                        alert("Error");
                    }
                } else {
                    alert("Error");
                }
            }
        }
        xhr.send("name=" + name + "&author=" + author + "&year=" + year +
            "&album=" + album + "&country=" + country);
    }

    function getMusicList() {
        let xhr = new XMLHttpRequest();
        xhr.open("GET", "MusicController");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    let Music = JSON.parse(xhr.responseText);
                    let MusicTableBody = document.getElementById("MusicTableBody");
                    MusicTableBody.innerHTML = "";
                    for (let i = 0; i < Music.length; i++) {
                        let song = Music[i];
                        let row = document.createElement("tr");
                        let cell1 = document.createElement("td");
                        let cell2 = document.createElement("td");
                        let cell3 = document.createElement("td");
                        let cell4 = document.createElement("td");
                        let cell5 = document.createElement("td");
                        cell1.innerHTML = song.name;
                        cell2.innerHTML = song.author;
                        cell3.innerHTML = song.album;
                        cell4.innerHTML = song.year;
                        cell5.innerHTML = song.country;
                        row.appendChild(cell1);
                        row.appendChild(cell2);
                        row.appendChild(cell3);
                        row.appendChild(cell4);
                        row.appendChild(cell5);
                        MusicTableBody.appendChild(row);
                    }
                } else {
                    alert("Error");
                }
            }
        }
        xhr.send();
    }
    getMusicList();
</script>
</body>
</html>
