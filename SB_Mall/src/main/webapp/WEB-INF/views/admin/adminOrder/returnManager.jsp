<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.calbutton{
	width: 15px;
	height: 16px;
	background-size : 14px;
	background-image: url("<%=request.getContextPath()%>/img/calendar.png");
}
</style>
<!-- adminOrder.jsp 에서 불러온다. -->
<div id="mainContent">
	
	<!-- 날짜 선택 -->
	<div id="mainHeader" class="t-left">
		<div>
			<span class="fon16 fonb">
				검색 조건
			</span>
			<span class="seldate">
					<span class="input-group input-group1">
						<input type="text" id="startDate" name="startDate" class="datepicker inputSel bor-non" value="">
						<span class="input-group-addon">
		                	<span class="glyphicon calbutton"></span>
		                </span>
					</span>
			</span>
			<span class="fonb fon16">-</span><span class="seldate">
				<span class="input-group input-group2">
					<input type="text" id="endDate" name="endDate" class="datepicker inputSel bor-non" value="">
					<span class="input-group-addon">
	                	<span class="glyphicon calbutton"></span>
	                </span>
				</span>
			</span>
			<span>
				<select id="tableName">
					<option value="Order" selected="selected">일반주문</option>
					<option value="CrowdOrder">크라우드펀딩</option>
				</select>
			</span>
			<span>
				<select id="refund">
					<option value="1" selected="selected">반품대기</option>
					<option value="2">반품완료</option>
				</select>
			</span>
			<span>
				<input type="submit" id="select" class="select" value="조회">
			</span>
		</div>
	</div>
	
	<!-- 중단 -->
	<div id="mainMid">
		
	<!-- mainMid의 끝 -->
	</div>
	
	<!-- 하단 -->
	<div id="loadReturnList">
	<!-- loadReturnList의 끝 -->
	</div>
	
<!-- mainContent의 끝 -->
</div>
<script type="text/javascript">

	$(document).ready(function(){
		
		//datetimepicker 
		$(".input-group1, .input-group2").datetimepicker({
		      format: 'YYYY.MM.DD'
		  });
		$('.input-group1, .input-group2').on('dp.change', function (e) {
			  var datetimeval = e.date;   //선택된 날짜값 정보
			  var newDay  = e.date.format("YYYY.MM.DD"); //변경된 날(문자열로)
			  
			  var weekFistDay = moment(datetimeval, "YYYY.MM.DD").day(0).format("YYYY.MM.DD"); //주의 첫째날
			  var weekLastDy =  moment(datetimeval, "YYYY.MM.DD").day(6).format("YYYY.MM.DD"); //주의 마
			 
			 if($(this).attr('class') == 'input-group input-group1') {
				 $("#startDate").val(newDay); 
			} else {
				$("#endDate").val(newDay); 
			}
		});
		
		//loadReturnList.jsp를 불러온다.
		var tableName = $('#tableName').val();
		var refund = $('#refund').val();
		
		$('#loadReturnList').load(
				'<%=request.getContextPath()%>/admin/adminOrder/returnManager/loadReturnList?startDate='
						+ firstDate + '&endDate=' + nowString + '&tableName=' + tableName + '&pageNumber=1&refund=' + refund
		);

		
		//input 태그에 오늘 날짜 불러온다.
		$( "#startDate" ).val(firstDate);
		$( "#endDate" ).val(nowString);
		
		//메뉴 및 서브메뉴에 css 적용 - 서브메뉴가 있을 경우 두번째 인자에 서브메뉴 태그 id 또는 클래스명을 넣는다. 0으로 하면 서브메뉴가 없는것
		removeActive('#returnManager', 0);
		
		

		
	});
</script>
