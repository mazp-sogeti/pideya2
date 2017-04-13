<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

<div data-role="page" id="pageone" data-theme="b">
  <div data-role="header">
    <h1>Page Header</h1>
  </div>

  <div data-role="main" class="ui-content">
    <p>Some Text..</p>
    <a href="#">A Standard Text Link</a>
    <a href="#" class="ui-btn">Link Button</a>
    <p>A List View:</p>
    <ul data-role="listview" data-autodividers="true" data-inset="true">
      <li><a href="#">Adele</a></li>
      <li><a href="#">Billy</a></li>
    </ul>
    <label for="fullname">Input Field:</label>
      <input type="text" name="fullname" id="fullname" placeholder="Name..">    
    <label for="switch">Toggle Switch:</label>
      <select name="switch" id="switch" data-role="slider">
        <option value="on">On</option>
        <option value="off" selected>Off</option>
      </select>
  </div>

  <div data-role="footer">
    <h1>Page Footer</h1>
  </div>
</div> 

</body>
</html>
