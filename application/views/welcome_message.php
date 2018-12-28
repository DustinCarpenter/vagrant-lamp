<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/style.css">
	<?php $this->load->view('partials/meta') ?>
</head>

<body class="d-flex flex-column h-100">

	<?php $this->load->view('partials/header') ?>	

	<main class="flex-shrink-0">
		<div class="container">
			<h1 class="mt-5">Hello World!</h1>
			<p class="lead"><i class="fas fa-laptop-code"></i> This is a template for a setting up a vargrant box ready for app development using CodeIgniter 3.x and Bootstrap 4.2.1</p>
			<div>
				<a class="btn btn-info" href="/info.php" role="button"> <i class="fas fa-info-circle"></i> View phpinfo() Page</a>
				<a class="btn btn-primary" href="https://github.com/DustinCarpenter/vagrant-lamp" role="button"><i class="fab fa-github"></i> View Project On GitHub</a>
			</div>
		</div>
	</main>

	<?php $this->load->view('partials/footer') ?>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	<script src="/js/main.js"></script>

</body>
</html>