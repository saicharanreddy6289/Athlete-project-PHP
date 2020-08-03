<?php
defined('BASEPATH') or exit('No direct script access allowed');

$conn = new mysqli("localhost", "root", "", "mydb");

if ($conn->connect_error) {
	die("connection failed" . $conn->connect_error);
}

$result =  array('error' => false);

$action = '';

if (isset($_GET['action'])) {
	$action = $_GET['action'];
}


if (isset($_SERVER['HTTP_ORIGIN']) && $_SERVER['HTTP_ORIGIN'] != '') {


	header('Access-Control-Allow-Origin:*');
	header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
}
// Get data from database
if ($action == 'read') {
	$sql = $conn->query("SELECT * FROM Athlete INNER JOIN Location ON Athlete.location_id = Location.Location_id");
	$id = $conn->query("SELECT athlete_id FROM Athlete ORDER BY athlete_id DESC LIMIT 1");
	$users = array();
	while ($row = $sql->fetch_assoc()) {
		array_push($users, $row);
	}
	$result['users'] = $users;
	$row_id = $id->fetch_assoc();

	if (is_null($row_id) == 1) {
		$row_id['athlete_id'] = 0;
	}
	$result['id'] = $row_id;

	echo json_encode($result);
}
if ($action == 'get_id') {
	$id = $_GET['id'];
	$sql = $conn->query("SELECT * FROM Athlete INNER JOIN Location ON Athlete.location_id = Location.Location_id where Athlete.location_id = $id");
	$users = array();
	while ($row = $sql->fetch_assoc()) {
		array_push($users, $row);
	}
	$result['users'] = $users;




	echo json_encode($result);
}
// insert data into database
if ($action == 'create') {


	$name = $_POST['name'];
	$age = $_POST['age'];
	$location_id = $_POST['id'];
	$city = $_POST['city'];
	$province = $_POST['province'];
	$country = $_POST['country'];
	$sql = $conn->query("insert into Location values('$location_id','$city','$province','$country')");
	$sql = $conn->query("insert into Athlete values('$location_id','$name','$age','$location_id')");

	if ($sql) {
		$result['message'] = "user Added successfully";
	} else {
		$result['error'] = "true";
		$result['message'] = "user not added";
	}
}

//delete data from database
if ($action == 'delete') {

	$id = $_POST['id'];
	$sql = $conn->query("delete from Athlete where Athlete_id = $id");
	$sql = $conn->query("delete from Location where location_id = $id");
	if ($sql) {
		$result['message'] = "user deleted successfully";
	} else {
		$result['error'] = "true";
		$result['message'] = "user not deleted";
	}
}
