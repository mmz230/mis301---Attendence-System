<?PHP
echo"php page ";

    $studentname = $_POST["studentname"];


$conn=new mysqli("localhost","mis301project","mis301project.","mis301");
if($conn->connect_error){
die("Connection Failed : ".$conn->connect_error);
}else{
$stmt=$conn->prepare("insert into student(studentname) values(?)");
$stmt->bind_param("s", $studentname);
$stmt->execute();
echo "data added";
$stmt->close();
$conn->close();

    
}






//https://www.youtube.com/watch?v=2HVKizgcfjo used code from this video
    //https://www.youtube.com/watch?v=qm4Eih_2p-M
//https://www.codeandcourse.com/connect-register-form-to-mysql-with-php/
//https://stackoverflow.com/questions/3659782/how-to-write-the-code-for-the-back-button
//https://www.youtube.com/watch?v=pdsfCLtNqus
?>
<html>
    <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">


    </head>
<body style="margin:50px;">
<button onclick="history.go(-1);">Back </button>
    
    <h1>Student Table</h1>
    
    <table>
    <thead>
    <tr>
    <th>Student ID</th>
    <th>Student Name</th>
    </tr>
    </thead>
    
    <tbody>
    <?php
    
    $conn=new mysqli("localhost","mis301project","mis301project.","mis301");

    if($conn->connect_error){
die("Connection Failed : ".$conn->connect_error);
}
        $sql = "SELECT * FROM student";
        $result = $conn->query($sql);
        
        if(!$result){
        die("Invalid query: ". $conn->error);
        }
        
        
        while ($row=$result->fetch_assoc()){
        echo "
        
        <tr>
        <td>".$row["studentid"]."</td>
        <td>".$row["studentname"]."</td>
        
        <tr/>";}
    
    
    ?>
        
    </tbody>
    
    
    
    </table>
    
</body>
</html>