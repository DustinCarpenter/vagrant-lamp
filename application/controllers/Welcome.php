<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function index()
	{
		$data['view_file'] = 'content/home';
		$data['page_title'] = 'Home';
		$this->load->view('layouts/main', $data);
	}
}
