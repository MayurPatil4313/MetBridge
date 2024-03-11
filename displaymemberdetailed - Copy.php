<?php
include("header.php");
if(isset($_POST['submit']))
{
	$arrrecx['member_id'] =	$_POST['member_id'];
	$arrrecx['maleapplicant'] = $_POST['maleapplicant'];
	$arrrecx['femaleapplicant'] = $_POST['femaleapplicant'];
	$arrrecx['workingfor'] =	$_POST['workingfor'];
	$arrrecx['annualincome'] =	$_POST['annualincome'];
	$arrrecx['designation'] =	$_POST['designation'];
	$arrrecx['pfno'] =	$_POST['pfno'];
	$arrrecx['childname'] = 	$_POST['childname'];
	$arrrecx['applicationprocessdate'] = 	$_POST['applicationprocessdate'];
	$arrrecx['reasonforadoption'] = 	$_POST['reasonforadoption'];
	$arrrecx['anynotes'] = 	$_POST['anynotes'];
	$serializearrrecx = serialize($arrrecx);
	$sql = "INSERT INTO  child_adoption (donor_id,member_id,child_adoption,child_adoption_status) VALUES('$_SESSION[donor_id]','$arrrecx[member_id]','$serializearrrecx','Pending')";
	$qsql = mysqli_query($con,$sql);
	echo mysqli_error($con);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('Child Adoption Request sent successfully...');</script>";
		echo "<script>window.location='viewadoptchildapply.php';</script>";
	}
}
$sqlmember = "SELECT member.*,member_type.member_type FROM member LEFT JOIN member_type ON member.member_type_id=member_type.member_type_id WHERE member.status='Active' AND member.member_id='$_GET[member_id]'";
$qsqlmember = mysqli_query($con,$sqlmember);
$rsmember = mysqli_fetch_array($qsqlmember);
if($rsmember['image'] == "")
{
	$imgname="img/noimage.png";
}
else if(file_exists("imgmember/".$rsmember['image']))
{
	$imgname = "imgmember/".$rsmember['image'];
}
else
{
	$imgname="img/noimage.png";
}
?>
<div id="page-header">
	<div class="section-bg" style="background-image: url(img/background-2.jpg);"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="header-content">
						<h1>Child Profile</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

</header>


<div class="section">

<div class="container">

<div class="row">


<div class="col-md-3">

	<h3><?php echo $rsmember['name']; ?></h3>
	<img src='<?php echo $imgname; ?>' style="width: 100%;height: 300px;" >

</div>


<div class="col-md-9">
	<div class="widget">
		<h3 class="widget-title">About <?php echo $rsmember['name']; ?></h3>
		<div class="widget-category">
		<?php echo $rsmember['description']; ?>
		</div>
		<hr>
		<h3 class="widget-title"><?php echo $rsmember['name']; ?> Profile</h3>
		<div class="widget-category">
<table class="table table-striped table-bordered" style="width: 100%;">
	<thead>
		<tr>
			<th style="width: 250px;">Name:</th>
			<td><?php echo $rsmember['name']; ?></td>
		</tr>
		<tr>
			<th style="width: 250px;">Contact Address:</th>
			<td><?php echo $rsmember['address']; ?></td>
		</tr>
		<tr>
			<th style="width: 250px;">Contact Person:</th>
			<td><?php echo $rsmember['contact_no']; ?></td>
		</tr>
		<tr>
			<th style="width: 250px;">Type:</th>
			<td><?php echo $rsmember['member_type']; ?></td>
		</tr>
	</thead>
</table>
<br>
<a class="btn btn-primary" href="adoptachildapply.php?member_id=<?php echo $rsmember[0]; ?>">Adopt this Child</a>
<br>
<br>
		</div>
	</div>
</div>

</div>

</div>
<div id="cta" class="section">
	<div class="section-bg" style="background-image: url(img/background-1.jpg);" data-stellar-background-ratio="0.5"></div>
	<div class="container">
		<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<div class="cta-content text-center">
				<h1>How to Adopt a Child?</h1>
					<p class="lead" style="text-align: left;color: white;">	
					<b>
		- The adoptive parents shall be physically, mentally and emotionally stable, financially capable and shall not have any life threatening medical condition.<br>
		- Any prospective adoptive parents, irrespective of his marital status and whether or not he has biological son or daughter, can adopt a child subject to following, namely:-<bR>
		&nbsp; &nbsp; &nbsp; a) the consent of both the spouses for the adoption shall be required, in case of a married couple;<bR>
		&nbsp; &nbsp; &nbsp; b) a single female can adopt a child of any gender;<bR>
		&nbsp; &nbsp; &nbsp; c) a single male shall not be eligible to adopt a girl child<bR>
		- No child shall be given in adoption to a couple unless they have at least two years of stable marital relationship.<bR>
		
		- In case of couple, the composite age of the prospective adoptive parents shall be counted.<bR>
		
- The minimum age difference between the child and either of the prospective adoptive parents shall not be less than twenty-five years.<bR>

- The age criteria for prospective adoptive parents shall not be applicable in case of relative adoptions and adoption by step-parent.<bR>

- Couples with three or more children shall not be considered for adoption except in case of special need children as defined in sub-regulation (21) of regulation 2, hard to place children as mentioned in regulation 50 and in case of relative adoption and adoption by step-parent.</b></p>
				</div>
			</div>
		</div>
	</div>
</div>

<?php
include("footer.php");
?>
<script>
function validateform()
{
	var i = 0;
	var exppfno = /^([A-Z]){5}([0-9]){10,25}?$/;
	$('.errorclass').html('');
	if(document.getElementById("maleapplicant").value=="")
	{
		document.getElementById("errmaleapplicant").innerHTML = "Male Applicant field should not be empty ...";
		i = 1;
	}
	if(document.getElementById("femaleapplicant").value=="")
	{
		document.getElementById("errfemaleapplicant").innerHTML = "Female Applicant field should not be empty .....";
		i = 1;
	}	
	if(document.getElementById("workingfor").value=="")
	{
		document.getElementById("errworkingfor").innerHTML = "Kindly enter Working Company detail...";
		i = 1;
	}
	if(document.getElementById("annualincome").value=="")
	{
		document.getElementById("errannualincome").innerHTML = "Kindly enter Annual income detail...";
		i = 1;
	}
	if(document.getElementById("designation").value=="")
	{
		document.getElementById("errdesignation").innerHTML = "Designation should not be empty..";
		i = 1;
	}
	if(!document.getElementById("pfno").value.match(exppfno))
	{
		document.getElementById("errpfno").innerHTML = "Entered PF No. is not valid.";
		i = 1;
	}  
	if(document.getElementById("pfno").value=="")
	{
		document.getElementById("errpfno").innerHTML = "PF No. should not be empty..";
		i = 1;
	}
	if(document.getElementById("childname").value=="")
	{
		document.getElementById("errchildname").innerHTML = "Child name should not be empty...";
		i = 1;
	}
	//                    
	if(document.getElementById("applicationprocessdate").value=="")
	{
		document.getElementById("errapplicationprocessdate").innerHTML = "Kindly select application process date...";
		i = 1;
	}
	if(document.getElementById("reasonforadoption").value=="")
	{
		document.getElementById("erreasonforadoption").innerHTML = "Reason for Adoption should not be empty...";
		i = 1;
	}
	/*
	if(document.getElementById("anynotes").value=="")
	{
		document.getElementById("erranynotes").innerHTML = "Kindly enter the donor password ...";
		i = 1;
	}
	*/
	if(i == 0)
	{
		return true;
	}
	else
	{
		return false;
	}
}
</script>