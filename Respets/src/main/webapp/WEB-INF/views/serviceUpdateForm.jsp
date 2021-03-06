<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Respets :: 업종 정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon" href="resources/images/logo-sm.png">

<!-- third party css -->
<link
	href="resources/dist/assets/css/vendor/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" type="text/css" />
<!-- third party css end -->

<!-- App css -->
<link href="resources/dist/assets/css/icons.min.css" rel="stylesheet"
	type="text/css" />
<link href="resources/dist/assets/css/app.min.css" rel="stylesheet"
	type="text/css" />
<style>
.custom-control {
    position: relative;
    display: inline;
    min-height: 1.3125rem;
    padding-left: 1.5rem;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@ include file="left-sidebar.jsp"%>
		<div class="content-page">
			<div class="content">
				<%@ include file="topbar-dashboard.jsp"%>
				<div class="container-fluid">

					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<div class="page-title-right">
									<form class="form-inline"></form>
								</div>
								<h4 class="page-title">업종 정보 수정</h4>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">

									<form action="serviceUpdate" method="post"
										enctype="multipart/form-data">
										<div class="row">
										<div class="col-lg-6">
										<input type="hidden" name="first" value="${first}" /> 
										<div class="form-group mb-3">
										<label for="simpleinput">서비스 종류</label>
										<input type="text" class="form-control" value="${bct_name}" readonly>
										</div>
										<input type="hidden" name="bct_code" value="${bct_code}" /> <br /> 
										${top} 
										<div class="form-group mb-3">
										<label for="example-fileinput" style="margin-right:15px;">사업장 사진</label>
										<input type="file" name="bgl_ori" multiple />
										</div>
										</div>
										<div class="col-lg-6">
										<div class="form-group mb-3">
										<label for="simpleinput">영업 오픈시간</label>
										<input type="time" class="form-control" name="work_o" id="am_open" value="${work_o}" step="1800">
										</div>
										<div class="form-group mb-3">
										<label for="simpleinput">영업 마감시간</label>
										<input type="time" class="form-control" name="work_c" id="pm_close" value="${work_c}" step="1800">
										</div>
										<div class="form-group mb-3">
										<label for="simpleinput">점심 시작시간</label>
										<input type="time" class="form-control" name=lunch_o id="lunch_open" value="${lunch_o}" step="1800">
										</div>
										<div class="form-group mb-3">
										<label for="simpleinput">점심 마감시간</label>
										<input type="time" class="form-control" name="lunch_c" id="lunch_close" value="${lunch_c}" step="1800">
										</div>
										<div class="form-group mb-3">
										<label for="simpleinput">고정휴무일</label><br/>
										${holiday} </div> 
										</div>
										<div class="col-lg-12">
										<div class="form-group mb-3">
										<label for="simpleinput">제공서비스</label><br/>
										${menu} </div> 
										${animal}
										</div>
										<div class="col-lg-12">
										<br /> &nbsp; <br /> ${medi_submit} ${price} <br />
										<br /> ${bct_price} ${cat_price} <br />
										<div id="but"></div>
										</div>
										</div>
									</form>
								</div>
								</div>
								</div>
								</div>
								</div>
								<%@ include file="footer.html"%>
								</div>
								</div>
								</div>
</body>
<script>
	function chk(val) {
		//var code = $('input[name=bct_code]').val();
		var code = $('input[name=bct_code]').attr('value');
		console.log(code + "mm");
		var url = "serviceUpdate?bct_code=" + code;
		Aj(url, "#changeCode");
		function Aj(url, position) {
			$.ajax({
				url : url,
				type : "post",
				dataType : "text",
				success : function(data) {
					$(position).html(data);
				},
				error : function(error) {
					console.log("error");
				}
			}); //ajax End
		}
	}

	function priceBox(cnt) {
		var code = $(cnt).attr('name');
		console.log(code); //네임
		console.log("뭐야ㅑ");
		console.log("나와랏");
		var tagName = new Array(); //태그 값 담기는 배열 
		var aniName = new Array(); //동물 종류 담기는 배열 
		var catName = new Array();
		var cat_tag = new Array();
		var dog_tag = new Array();
		var tag_cnt = 0; //태그 개수 
		var ani_cnt = 0; //동물 개수 
		var cat_cnt = 0;
		var cat_tag_cnt = 0;
		var dog_tag_cnt = 0;
		var values = document.getElementsByName("tag_name"); //태그네임으로 된 값 가져오기 
		var animal = document.getElementsByName("animal_code"); //애니멀코드로 된 값 가져오기
		var cat_code = document.getElementsByName("cat_code");
		console.log(cat_code);
		var cat_tag_ck = document.getElementsByName("cat_tag");
		var dog_tag_ck = document.getElementsByName("dog_tag");
		for (var i = 0; i < values.length; i++) { //태그네임 들어온 값 만큼 돌기 
			if (values[i].checked) { //체크된 값 확인 
				tagName[tag_cnt] = values[i].value; //체크된 값은 새로만든 태그네임 배열에 넣어주기 
				tag_cnt++; //태그 개수 카운트 올려주
			} //체크된 박스 확인 if End
		} //태그네임 새로 담는 for End 
		for (var i = 0; i < animal.length; i++) { //애니멀코드 들어온 값 만큼 돌기 
			if (animal[i].checked) { //체크된 값 확인 
				aniName[ani_cnt] = animal[i].value; //체크된 값은 새로만든 애니멀 배열에 넣어주기 
				ani_cnt++; //애니멀 개수 카운트 올려주기 
			} //체크된 박스 확인 if End 
		} //애니멀코드 새로 담는 for End 
		for (var i = 0; i < cat_code.length; i++) {
			if (cat_code[i].checked) {
				catName[cat_cnt] = cat_code[i].value;
				cat_cnt++;
			}
		}
		for (var i = 0; i < cat_tag_ck.length; i++) {
			if (cat_tag_ck[i].checked) {
				cat_tag[cat_tag_cnt] = cat_tag_ck[i].value;
				cat_tag_cnt++;
			}
		}
		for (var i = 0; i < dog_tag_ck.length; i++) {
			if (dog_tag_ck[i].checked) {
				dog_tag[dog_tag_cnt] = dog_tag_ck[i].value;
				dog_tag_cnt++;
			}
		}

		var trObj; //tr태그 생성 
		var div; //div네임 담는 변수 
		div = $("#" + code); //div네임에 호텔이름 넣어주고 
		$("#" + code + " *").remove(); //만약 append 된 것이 있다면 지워줘.
		var cat_div = $("#" + code + "_price");
		$("#" + code + "_price *").remove();
		var but = $("#but");
		$("#but *").remove();
		var num1 = aniName.length; //num1에 애니멀 개수를 넣어줘.
		var num2 = tagName.length; //서비스 개수를 넣어줘. 

		var x;

		var box = new Array();
		var m = 0;

		if (aniName.length != 0) {
			if (dog_tag[0] != null) {
				box[m] = dog_tag[0];
				m++;
				console.log("개태그");
			}
			for (var i = 0; i < num2; i++) {
				box[m] = tagName[i];
				m++;
			}
		}
		var num3 = box.length;

		for (var i = 0; i < num1 + 1; i++) { // 애니멀 개수만큼 돌거야.
			trObj = document.createElement("tr"); // tr 생성      
			for (var j = 0; j < num3 + 1; j++) { //서비스 개수만큼 돌거야. 
				var tdObj = document.createElement("td"); //td 생성 
				trObj.appendChild(tdObj); //td를 tr에 붙여줘. 
				if (i == 0) {
					if (j == 0) { //(0,0) 은 빈칸이여야해. 
						tdObj.innerHTML = " ";
					} else {
						tdObj.innerHTML = box[j - 1];
					}
				} //if(i==0) End 
				else {
					if (j == 0) {
						tdObj.innerHTML = aniName[i - 1];
					} else {
						x = document.createElement("input");
						x.setAttribute("type", "text");
						x.setAttribute("name", "price");
						x.setAttribute("class", "col-sm-6");
						var price;
						var url = "searchPrice?tag_name=" + box[j - 1]
								+ "&ani_name=" + aniName[i - 1] + "&bct_code="
								+ code;
						Aj(url);
						function Aj(url) {
							$.ajax({
								url : url,
								type : "post",
								dataType : "text",
								async : false,
								success : function(data) {
									price = data;
								},
								error : function(error) {
									console.log("error");
								}
							}); //ajax End
						}
						x.setAttribute("value", price);
						tdObj.appendChild(x);
					}
				} //if (i!=0) End 	      	          
			} //for End (td)    
			div.append(trObj); //div 태그에 tr태그를 붙여넣는다.
		} //for End (tr)

		var catBox = new Array();
		var o = 0;

		if (catName.length != 0) {
			if (cat_tag[0] != null) {
				catBox[o] = cat_tag[0];
				o++;
				console.log("고양이태그");
			}
			for (var i = 0; i < num2; i++) {
				catBox[o] = tagName[i];
				o++;
			}
		}
		var num4 = catBox.length;

		for (var i = 0; i < catName.length + 1; i++) { // 애니멀 개수만큼 돌거야.
			trObj = document.createElement("tr"); // tr 생성      
			for (var j = 0; j < num4 + 1; j++) { //서비스 개수만큼 돌거야. 
				var tdObj = document.createElement("td"); //td 생성 
				trObj.appendChild(tdObj); //td를 tr에 붙여줘. 
				if (i == 0) {
					if (j == 0) { //(0,0) 은 빈칸이여야해. 
						tdObj.innerHTML = " ";
					} else {
						tdObj.innerHTML = catBox[j - 1];
					}
				} //if(i==0) End 
				else {
					if (j == 0) {
						tdObj.innerHTML = catName[i - 1];
					} else {
						x = document.createElement("input");
						x.setAttribute("type", "text");
						x.setAttribute("name", "price");
						x.setAttribute("class", "col-sm-6");
						var price;
						var url = "searchPrice?tag_name=" + catBox[j - 1]
								+ "&ani_name=" + catName[i - 1] + "&bct_code="
								+ code;
						Aj(url);
						function Aj(url) {
							$.ajax({
								url : url,
								type : "post",
								dataType : "text",
								async : false,
								success : function(data) {
									price = data;
								},
								error : function(error) {
									console.log("error");
								}
							}); //ajax End
						}
						x.setAttribute("value", price);
						tdObj.appendChild(x);
					}
				} //if (i!=0) End 	      	          
			} //for End (td)    
			cat_div.append(trObj); //div 태그에 tr태그를 붙여넣는다.
		} //for End (tr)

		//	}//beauty else if End
		var para = document.createElement("P");
		var noti = document.createTextNode("제공을 원하지 않는 서비스에는 'X'를 입력해주세요.");
		para.appendChild(noti);
		cat_div.append(para);
		var btn = document.createElement("BUTTON");
		btn.setAttribute("class", "btn btn-outline-secondary")
		var t = document.createTextNode("수정하기");
		btn.appendChild(t);
		cat_div.append(btn);
	}
</script>
</html>