

<!DOCTYPE html>
<HTML lang="ja">
<HEAD>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<link rel="stylesheet" href="/Lysithea/JSP_Files/common/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/Lysithea/JSP_Files/common/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/Lysithea/JSP_Files/common/assets/css/app.css">

<script src="/Lysithea/JSP_Files/common/assets/vendor/jquery-2.2.2.min.js"></script>
<script src="/Lysithea/JSP_Files/common/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/Lysithea/JSP_Files/common/assets/vendor/underscore-min.js" charset="utf-8"></script>
<script src="/Lysithea/JSP_Files/common/assets/vendor/moment.min.js" charset="utf-8"></script>
<script src="/Lysithea/JSP_Files/common/assets/vendor/d3.min.js" charset="utf-8"></script>
<script src="/Lysithea/JSP_Files/common/assets/vendor/fixed_midashi.js"></script>
<script src="/Lysithea/JSP_Files/common/assets/js/components-util.js" charset="utf-8"></script>
<script src="/Lysithea/JSP_Files/common/assets/js/components-app.js" charset="utf-8"></script>
<script src="/Lysithea/JSP_Files/common/assets/js/components-d3.js" charset="utf-8"></script>
<script src="/Lysithea/JSP_Files/common/assets/js/main.js" charset="utf-8"></script>

<title>リシテア</title>
<script src="../common/common_core.js" charset="UTF-8"></script>
<script src="../common/common_check.js" charset="UTF-8"></script>
<script src="../common/common_next.jsp" charset="UTF-8"></script>
<script>
<!--
var menujs = (function() {

	var wApproverConsoleHnd = null;

	
	var menuHaveSubmitted = false;
	var logoffHaveSubmitted = false;

	
	window.onPageLoadOrBack(function() {
		menuHaveSubmitted = false;
		logoffHaveSubmitted = false;
	});

	
	return {
		// メニューリンクの押下による画面遷移操作
		go: function(aimLabel,flag,sendParameters) {

			App.Console.log("menuHaveSubmitted:" + menuHaveSubmitted);
			App.Console.log("aimLabel:" + aimLabel);
			App.Console.log("flag:" + flag);

			if(!menuHaveSubmitted || aimLabel == "WC010_2"){
				if (top.haveAlert()) {
					return false;
				}
				if(aimLabel == "WC010_2"){
					if(logoffHaveSubmitted){
						return false;
					}
					logoffHaveSubmitted = true;
				}
				menuHaveSubmitted = true;
				document.FORM_MENU.Flag.value = flag;

				if (aimLabel =="WX010" 
						|| aimLabel =="PREVIOUSMONTH" 
						|| aimLabel =="NEXTMONTH"
						|| aimLabel =="CHANGE_LANGUAGE") {
					if(wApproverConsoleHnd != null && !wApproverConsoleHnd.closed) {
						document.FORM_MENU.ShowedApproverConsole.value = true;
					}
				}else if(aimLabel =="WC010_2" || aimLabel =="MX010"){
					this.closeApproverConsole();
					clearMenuState();
				}

				document.FORM_MENU.LabelName.value = aimLabel + "_ON_WX010";

				App.Console.log("FORM_MENU.LabelName.value:" + document.FORM_MENU.LabelName.value);

				document.FORM_MENU.target="_self";

				if(sendParameters){
					var formMenu = $(document.FORM_MENU);
					var addForms = formMenu.find("#addForms");
					if(addForms.length == 0){
						addForms = $("<div></div>",{id:"addForms"}).appendTo(formMenu);
					}else{
						addForms.empty();
					}
					_.each(sendParameters, function(param){
						addForms.append($("<input />",{name:param[0],value:param[1],type:"hidden"}));
					});
				}

				App.UI.Loader.show();
				document.FORM_MENU.submit();
			}

			return false;
		},

		get haveSubmitted() {
			return menuHaveSubmitted;
		},

		//日付選択ﾎﾞﾀﾝを押下する
		fnClickHizuke: function(year,month,date,flag){
			//警告があれば、制御を行う。
			if (top.haveAlert() == true) {
			  return false;
			}

			if (date<10) {
				date = "0"+date;
			}
			if (month<10) {
				month = "0"+month;
			}

			document.FORM_MENU.SelectDate.value=String(year)+"/"+String(month)+"/"+String(date);

			return this.go("WC020",flag);
		},

		//固定リンク
		doLinkUrl: function(newUrl) {
			window.open(newUrl);
			return false;
		},

		// 上長コンソールウインドウオープン
		openApproverConsole: function() {
			wApproverConsoleHnd = window.open("about:blank","APPROVERCONSOLE");
			document.APPROVERCONSOLE.target = "APPROVERCONSOLE";
			
			document.APPROVERCONSOLE.action = "null";
			document.APPROVERCONSOLE.submit();
			return false;
		},

		// 上長コンソールウインドウクローズ
		closeApproverConsole: function() {
			if(wApproverConsoleHnd != null){
				if(!wApproverConsoleHnd.closed) {
					wApproverConsoleHnd.close();
					wApproverConsoleHnd = null;
				}
			}
			return false;
		},

	};

})();
// -->
</script>
<script type="text/javascript">
	var JSLogger = {};
	
	JSLogger.url = '../common/Logger.jsp';
	
	JSLogger.log = function (message, level){
		
		try{
			new Image().src = JSLogger.url + '?level=' + level + '&message='
			    + encodeURIComponent(message);
		}catch(e){}
		
	};
	
	JSLogger.info = function (message){
		JSLogger.log(message,'info');
	};
	
	JSLogger.error = function (message){
		JSLogger.log(message,'error');
	};
	
	JSLogger.debug = function (message){
		JSLogger.log(message,'debug');
	};
	
	
	window.onerror = function() {
		var text = '';
		text += 'JavaScript error was detected.,';
		text += navigator.userAgent + ',';
		text += document.cookie + ',';
		for(var i = 0, n = arguments.length; i < n; ++i){
			text += arguments[i] + ',';
		}
		text += 'WC020$jsp'; 
		JSLogger.error(text);
		return true;
	}
	
</script>
<script>

var lysithea_debug_stop_change_holiday = false;

var lysithea_debug_stop_change_autocal = false;


var wc020Const = {
		calendarDispName: 'DispName_01'
		, calendarDispOption: 'status=no,resizable=yes,scrollbars=yes,width=350,height=400,left=100,top=100'
		, wc062ErrorDispName: 'DispName_04'
		, wc023DispName: 'DispName_12'
		, wc023DispOption: 'status=no,resizable=yes,scrollbars=yes,width=600,height=600,left=100,top=100'
	};


var wc020ScriptParam = {
		// 計算ボタンの入力可否
		calcEnabled: Boolean('1')
		// 休暇区分プルダウンの表示有無
		, dispHolidayDiv: Boolean('')
		// 休暇事由の表示有無
		, dispHolidayCause: Boolean('')
		// エラー一覧の表示
		, showingErrorList: Boolean('')
	};
</script>
<script src="../common/WC020Script.js" charset="UTF-8"></script>

<style>
    #WC020 .desk .rack .rack-sect .sect-body table {
        width: 100%;
    }
</style>

</HEAD>

<BODY onunload="top.closeChild();">


<div id="gBody" style="visibility:hidden">
<script>
$(function(){
	;
	
	$('#gBody').css("visibility","visible");
	$('#kojin-settings-parent').append($('#kojin-settings-child'));	
	$('#otherURL-link-parent').append($('#otherURL-link-child'));

	if (window.sessionStorage) {
		var ss = window.sessionStorage.getItem('WX010_MENU_TAB');
		if (ss) {
			$('#menuTabs').find("a[href='"+ ss + "']").parent().addClass('active');
			$(ss).addClass('active');
		} else {
			$('#menuTabs > li:first').addClass('active');
			$('#personal').addClass('active');
		}
	}

	$('#personal > div > div > a').click(function (e) {
		e.preventDefault();
		if ($(this).next().is(':visible')) {
			$(this).next().hide();
		} else {
			$('#kojin-settings-parent > a').next().hide();
			$('#otherURL-link-parent > a').next().hide();
			$(this).next().show();
		}
	});
	
});
</script>

<div id="gSidebar">
<form  method="POST" action="/Lysithea/com.hisas.ias.web.Invoker" target="_top" name="APPROVERCONSOLE" >
<input type="hidden" name="SASFWSTATEID" value="WC020">
<input type="hidden" name="SASFWSTAMP" value="1767850465471">
<input type="hidden" name="SASFWNEXTLABEL" value="APPROVERCONSOLE">

<input type="hidden" name="login_param" value="0">
</form>
<form  method="POST" action="/Lysithea/com.hisas.ias.web.Invoker" target="_top" name="FORM_MENU" >
<input type="hidden" name="SASFWSTATEID" value="WC020">
<input type="hidden" name="SASFWSTAMP" value="1767850465471">
<input type="hidden" name="SASFWNEXTLABEL" value="">
 
<input type="hidden" name="MyGroupManagementPerson" value="">
 
<input type="hidden" name="LabelName" value="">
<input type="hidden" name="SelectDate" value="">
<input type="hidden" name="Flag" value="">
<input type="hidden" name="HaveAlert" value="">
<input type="hidden" name="ShowedApproverConsole" value="">
<input type="hidden" name="passwardPeriodError" value="WC01W010：パスワードの期限が切れています。パスワードを変更してください。">
<input type="hidden" name="wC01W030Message" value="WC01W030：パスワードが初期パスワードから変更されていません。パスワードを変更してください。">
<input type="hidden" name="wC01W040Message" value="WC01W040：nullにパスワードの期限が切れます。パスワードを変更してください。">
<input type="hidden" name="displayedMenuPage" id="displayedMenuPage" value="ATTENDANCE">


<header class="side-header">
	<nav class="appBar">
		<div class="appLogo">
			<h2 class="title">LYSITHEA</h2>
		</div>
		<div class="appBtns">
			<a href="#" class="btn btn-transp" onclick="menujs.go('WC300'); return false;">
			<i class="fa fa-home"></i>HOME
			</a>
		</div>
	</nav>
	
	<ul id="menuTabs" role="tablist" class="mod-tabs">
		<li class="tab">
			<a href="#personal" aria-controls="personal" role="tab" data-toggle="tab">本人</a>
		</li>
		
			<li class="tab">
				<a href="#manager" aria-controls="manager" role="tab" data-toggle="tab">承認者</a>
			</li>
		
	</ul>
</header>
<div class="tab-content">
	<div id="personal" role="tabpanel" class="tab-pane">
        
		<div class="side-section">
			<div class="mod-MENU-calendar">
				<div class="fb fb-lr">
					<div class="mod-navs">
						
								<a href="#"
								   class="nav-prev"
								   onclick="return menujs.go('PREVIOUSMONTH'
								                            ,'PERSONAL');">
								</a>
							
								<a href="#"
								   class="nav-next"
								   onclick="return menujs.go('NEXTMONTH'
								                            ,'PERSONAL');">
								</a>
							
					</div>
					<div class="date">
						2026 / 01
					</div>
					<div class="stat">
						
							<span class="gsk">gsk-0</span>
						
					</div>
				</div>
				<table class="calendar">

					<tr>

						<th class = "calSunday" >日</th>

						<th class = "calMonday" >月</th>

						<th class = "calTuesday" >火</th>

						<th class = "calWednesday" >水</th>

						<th class = "calThursday" >木</th>

						<th class = "calFriday" >金</th>

						<th class = "calSaturday" >土</th>

					</tr>

					<tr>

						<td class="calBlank"></td>

						<td class="calBlank"></td>

						<td class="calBlank"></td>

						<td class="calBlank"></td>

						<td class ="">
							<a href ="."
							   class="calLinkDayOff"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,1
							                                       ,'PERSONAL');"
							>1</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkDayOff"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,2
							                                       ,'PERSONAL');"
							>2</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkDayOff"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,3
							                                       ,'PERSONAL');"
							>3</a>
						</td>

					</tr>

					<tr>

						<td class ="">
							<a href ="."
							   class="calLinkDayOff"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,4
							                                       ,'PERSONAL');"
							>4</a>
						</td>

						<td class ="jsk-cal jsk-2">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,5
							                                       ,'PERSONAL');"
							>5</a>
						</td>

						<td class ="jsk-cal jsk-2">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,6
							                                       ,'PERSONAL');"
							>6</a>
						</td>

						<td class ="jsk-cal jsk-2">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,7
							                                       ,'PERSONAL');"
							>7</a>
						</td>

						<td class ="jsk-cal jsk-1 today">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,8
							                                       ,'PERSONAL');"
							>8</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,9
							                                       ,'PERSONAL');"
							>9</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkDayOff"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,10
							                                       ,'PERSONAL');"
							>10</a>
						</td>

					</tr>

					<tr>

						<td class ="">
							<a href ="."
							   class="calLinkDayOff"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,11
							                                       ,'PERSONAL');"
							>11</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkDayOff"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,12
							                                       ,'PERSONAL');"
							>12</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,13
							                                       ,'PERSONAL');"
							>13</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,14
							                                       ,'PERSONAL');"
							>14</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,15
							                                       ,'PERSONAL');"
							>15</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,16
							                                       ,'PERSONAL');"
							>16</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkDayOff"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,17
							                                       ,'PERSONAL');"
							>17</a>
						</td>

					</tr>

					<tr>

						<td class ="">
							<a href ="."
							   class="calLinkDayOff"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,18
							                                       ,'PERSONAL');"
							>18</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,19
							                                       ,'PERSONAL');"
							>19</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,20
							                                       ,'PERSONAL');"
							>20</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,21
							                                       ,'PERSONAL');"
							>21</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,22
							                                       ,'PERSONAL');"
							>22</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,23
							                                       ,'PERSONAL');"
							>23</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkDayOff"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,24
							                                       ,'PERSONAL');"
							>24</a>
						</td>

					</tr>

					<tr>

						<td class ="">
							<a href ="."
							   class="calLinkDayOff"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,25
							                                       ,'PERSONAL');"
							>25</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,26
							                                       ,'PERSONAL');"
							>26</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,27
							                                       ,'PERSONAL');"
							>27</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,28
							                                       ,'PERSONAL');"
							>28</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,29
							                                       ,'PERSONAL');"
							>29</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkWeekDay"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,30
							                                       ,'PERSONAL');"
							>30</a>
						</td>

						<td class ="">
							<a href ="."
							   class="calLinkDayOff"
							   onClick="return menujs.fnClickHizuke(2026
							                                       ,1
							                                       ,31
							                                       ,'PERSONAL');"
							>31</a>
						</td>

					</tr>

				</table>
			</div>
		</div>
        
		<div class="side-section">
			
				<h3 class="section-title">当月度</h3>
			
			<div class="section-body">
				
						<div class="ss-row">
							<div class="ss-label">時間外</div>
							
								<div class="ss-value">1:30</div>
							
						</div>
					
						<div class="ss-row">
							<div class="ss-label">法定時間外</div>
								
									<div class="ss-value">1:30</div>
								
						</div>
					
				<div class="ss-row">
					<div class="fb fb-wrap">
						
									<div class="item">
									    <div class="lbl">残</div>
									    <div class="val">1:30</div>
									</div>
								
									<div class="item">
									    <div class="lbl">休</div>
									    <div class="val">0:00</div>
									</div>
								
					</div>
				</div>
				
					<div class="ss-row">
						<div class="ss-label">有休付与</div>
						<div class="ss-value">40.0</div>
					</div>
				
				<div class="ss-row">
					<div class="fb fb-wrap">
						
							<div class="item">
								<div class="lbl">行使</div>
								<div class="val">14.5</div>
							</div>
						
							<div class="item">
								<div class="lbl">残</div>
								<div class="val">25.5</div>
							</div>
						
					</div>
				</div>
				
					<div class="ss-row">
						
							<div class="ss-label">
								代休残日数
							</div>
							<div class="ss-value">
								0.0
							</div>
						
					</div>
				
				<div class="ss-row">
					<div class="ss-label">
						 
					</div>
					<div class="ss-value">
						0
					</div>
				</div>
				
			</div>
		</div>
        <input type="hidden" id="WK11E010" name="WK11E010" value="WK11E010：押下したメニューの設定が正しくありません。システム管理部門に問い合わせてください。">
	<div class="mod-gamen-linklist">
		
					<a href="." onclick="return menujs.go('WK030','PERSONAL')">勤休月次一覧</a>
				
					<a href="." onclick="return menujs.go('WD050','PERSONAL')">勤休月次累計（参照日時点）</a>
				
					<a href="." onclick="return menujs.go('WJ070','PERSONAL')">休暇一括登録</a>
				
					<a href="." onclick="return menujs.go('WC230','PERSONAL')">残業申請</a>
				
					<a href="." onclick="return menujs.go('WC071','PERSONAL')">確定勤休一覧</a>
				
					<a href="." onclick="return menujs.go('WC081','PERSONAL')">有休・積休台帳</a>
				
					<a href="." onclick="return menujs.go('WC241','PERSONAL')">代休台帳</a>
				
					<div id="kojin-settings-parent" style="position:relative">
						<a href=".">個人設定</a>
					</div>
				
					<div id="otherURL-link-parent" style="position:relative">
						<a href=".">別サイトへのリンク</a>
					</div>
				
	</div>
	
				<div id="kojin-settings-child" style="position:absolute;display:none;bottom:0;left:101%;width:100%;background-color:#fff;z-index:1;">
					
							<a href="." onclick="return menujs.go('WK100','PERSONAL')">個人設定</a>
						
							<a href="." onclick="return menujs.go('WC140','PERSONAL')">デフォルトPJ/JOBコード設定</a>
						
							<a href="." onclick="return menujs.go('WJ100','MANAGER')">代行者登録</a>
						
				</div>
			
				<div id="otherURL-link-child" style="position:absolute;display:none;bottom:0;left:101%;width:100%;background-color:#fff;z-index:1;">				

							<a href="." onclick="window.open('https://mobile.bulas180.com/payslip/browser/');return false;">
							WEB給与明細</a>

							<a href="." onclick="window.open('/doc/OPM_SHISHUGYO.zip');return false;">
							始終業時刻ﾂｰﾙ</a>

							<a href="." onclick="window.open('/doc/OPM_Basic.pdf');return false;">
							マニュアル_基本</a>

							<a href="." onclick="window.open('/doc/OPM_Employee.pdf');return false;">
							マニュアル_正</a>

							<a href="." onclick="window.open('/doc/OPM_Contract.pdf');return false;">
							マニュアル_契</a>

							<a href="." onclick="window.open('/doc/OPM_Authorizer.pdf');return false;">
							ﾏﾆｭｱﾙ_承認_代行</a>

							<a href="." onclick="window.open('/doc/OPM_FAQ.zip');return false;">
							FAQ</a>

							<a href="." onclick="window.open('https://chat4-78.chatdealer.jp/chat/url/1aIsmIU?vgAtxt=FKHTfChat4-78');return false;">
							チャットで質問</a>

				</div>
		
	</div>
	
		<div id="manager" class="tab-pane">
			
	<div class="mod-gamen-linklist">
	
	<div class="mod-deptpicker">
		<div class="mod-user-1info">
			<span class=stfno> 
				組織選択
			</span>
		</div>
		<div class="gridform">
			<div class="gf-row" style="margin: 0px 15px;">
			<select multiple data-modalid="modal-WX010" class="modalizedMyGroupManagementPerson" name="MyGroupManagementPerson">
			
					<OPTION VALUE="Group_49439,2,250364042000,２">Group_49439,2,250364042000,２</OPTION>
				
					<OPTION VALUE="Group_16918,2,99000000047P,丸の内ＡＬ">Group_16918,2,99000000047P,丸の内ＡＬ</OPTION>
				
					<OPTION VALUE="Group_18391,2,9900000005U0,虎ノ門ＯＬＭ">Group_18391,2,9900000005U0,虎ノ門ＯＬＭ</OPTION>
				
					<OPTION VALUE="Group_19578,2,990000000600,伏見ＴＭ１">Group_19578,2,990000000600,伏見ＴＭ１</OPTION>
				
					<OPTION VALUE="Group_16945,2,990000000617,橘ＮＴ">Group_16945,2,990000000617,橘ＮＴ</OPTION>
				
					<OPTION VALUE="Group_48539,2,9900000008CC,池袋ＮＤ１">Group_48539,2,9900000008CC,池袋ＮＤ１</OPTION>
				
			</select>
			</div>
		</div>
	</div>
	<div class="mod-deptpicker">
		<div class="text">
			<span>
				選択中組織：<span style="padding-left:20px;"></span>
			</span>
		</div>
		<div class="text">
			<span style="font-weight: bold" id="showC9">
				絞り込みなし
			</span>
			<span style="font-weight: bold" id="showC8">
				絞り込みあり
			</span>
		</div>
	</div>
	<div id="group">
		<div style="text-indent:1em;">
			<span class="stfno" id="groupCode"></span>
		</div>
		<div style="text-indent:1em;">
			<span style="word-wrap:break-word;word-break:break-all;" class="stfno" id="groupName" ></span>
		</div>
	</div>
	
					<a href="." onclick="return menujs.go('WJ130','MANAGER')">承認待ち一覧</a>
				
					<a href="." onclick="return menujs.go('WC050','MANAGER')">承認状況一覧</a>
				
					<a href="." onclick="return menujs.go('WC210','MANAGER')">日次データ出力</a>
				
					<a href="." onclick="return menujs.go('CW070','MANAGER')">始終業時刻データ取込</a>
				
					<a href="." onclick="return menujs.go('WC090','MANAGER')">未入力・未承認検索</a>
				
					<a href="." onclick="return menujs.go('WJ060','MANAGER')">勤休月次締め処理</a>
				
					<a href="." onclick="return menujs.go('WJ070','MANAGER')">休暇一括登録</a>
				
					<a href="." onclick="return menujs.go('WJ140','MANAGER')">残業承認</a>
				
					<a href="." onclick="return menujs.go('WC070','MANAGER')">確定勤休一覧</a>
				
					<a href="." onclick="return menujs.go('WC103','MANAGER')">残業警告対象者一覧</a>
				
					<a href="." onclick="return menujs.go('CW060','MANAGER')">勤務シフトマスタアップロード</a>
				
					<a href="." onclick="return menujs.go('CW020','MANAGER')">利用勤務シフト選択</a>
				
					<a href="." onclick="return menujs.go('MS080','MANAGER')">勤務シフト変更</a>
				
					<a href="." onclick="return menujs.go('MS160','MANAGER')">1-1 勤務シフトデータ出力</a>
				
					<a href="." onclick="return menujs.go('MS170','MANAGER')">1-2 勤務シフトデータ取込</a>
				
					<a href="." onclick="return menujs.go('MM240','MANAGER')">PJコード設定</a>
				
					<a href="." onclick="return menujs.go('WJ160','MANAGER')">社員別デフォルトPJコード設定</a>
				
					<a href="." onclick="return menujs.go('WJ080','MANAGER')">管理対象者登録</a>
				
					<a href="." onclick="return menujs.go('CW030','MANAGER')">承認代行者登録</a>
				
					<a href="." onclick="return menujs.go('CW050','MANAGER')">マイグループ設定</a>
				
					<a href="." onclick="return menujs.go('WC080','MANAGER')">有休・積休情報一覧</a>
				
					<a href="." onclick="return menujs.go('WC240','MANAGER')">代休情報一覧</a>
				
					<a href="." onclick="return menujs.go('MS100','MANAGER')">休暇台帳出力</a>
				
					<a href="." onclick="return menujs.go('WC110_2','MANAGER')">勤務表検索</a>
				
					<a href="." onclick="return menujs.go('MS150','MANAGER')">勤務表印刷</a>
				
					<a href="." onclick="return menujs.go('MS110','MANAGER')">2-1 勤休抽出&#040;項目選定&#041;</a>
				
					<a href="." onclick="return menujs.go('MS120','MANAGER')">2-2 勤休抽出&#040;期間選定&#041;</a>
				
					<a href="." onclick="return menujs.go('MS121','MANAGER')">2-3 勤休抽出&#040;ダウンロード実行&#041;</a>
				
					<a href="." onclick="return menujs.go('CW040','MANAGER')">前給データ作成</a>
				
	</div>

		</div>
	
</div>
</form>


<div id="modal-myGroup-managementPersonlist" tabindex="-1" role="dialog"
	class="modal fade">
	<div role="document" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" class="close">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">マイグループ／管理対象組織リスト</h4>
			</div>
			<div class="modal-body">
				<div class="mod-table-in-modal">
					<table>
						<thead>
							<tr>
								<th></th>
								<th><input type="text" placeholder="絞り込み"
									class="localfilter block"></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary modal-btn-ok">OK</button>
			</div>
		</div>
	</div>
</div>

</div>

<div id="gOperation">
<div id="WC020" class="functionArea">


<FORM NAME="messages">
	<input type="hidden" id="ZZ00E010" name="ZZ00E010" value="ZZ00E010：{0}は、半角カタカナを使用できません。"><input type="hidden" id="ZZ00E011" name="ZZ00E011" value="ZZ00E011：{0}は半角英数字で入力してください。"><input type="hidden" id="ZZ00E012" name="ZZ00E012" value="ZZ00E012：{0}は、「,（半角カンマ）」、「&#39;（半角シングルクォーテーション）」、 「&quot;（半角ダブルクォーテーション）」を使用できません。"><input type="hidden" id="ZZ00E013" name="ZZ00E013" value="ZZ00E013：{0}は、半角{1}桁以内で入力してください。"><input type="hidden" id="ZZ00E014" name="ZZ00E014" value="ZZ00E014：{0}は、半角{1}桁で入力してください。"><input type="hidden" id="ZZ00E020" name="ZZ00E020" value="ZZ00E020：{0}は、半角数字で入力してください。"><input type="hidden" id="ZZ00E021" name="ZZ00E021" value="ZZ00E021：{0}は、正の値で入力してください。"><input type="hidden" id="ZZ00E022" name="ZZ00E022" value="ZZ00E022：{0}は、9999999.99以下で入力してください。"><input type="hidden" id="ZZ00E030" name="ZZ00E030" value="ZZ00E030：{0}は、HHMMの形式で入力してください。"><input type="hidden" id="ZZ00E031" name="ZZ00E031" value="ZZ00E031：{0}は、HHMMの形式で入力してください。"><input type="hidden" id="ZZ00E032" name="ZZ00E032" value="ZZ00E032：{0}は、0000～2359の範囲で入力してください。"><input type="hidden" id="ZZ00E033" name="ZZ00E033" value="ZZ00E033：{0}は、HHMMの形式で入力してください。"><input type="hidden" id="ZZ00E050" name="ZZ00E050" value="ZZ00E050：{0}は、YYYY/MM/DDの形式で入力してください。"><input type="hidden" id="ZZ00E051" name="ZZ00E051" value="ZZ00E051：{0}は、YYYY/MM/DDの形式で入力してください。"><input type="hidden" id="ZZ00E052" name="ZZ00E052" value="ZZ00E052：{0}は、1990/01/01～2099/12/31の範囲で入力してください。"><input type="hidden" id="ZZ00E053" name="ZZ00E053" value="ZZ00E053：{0}は、1930/01/01～2099/12/31の範囲で入力してください。"><input type="hidden" id="ZZ00E035" name="ZZ00E035" value="ZZ00E035：{0}は、HHMMの形式で入力してください。"><input type="hidden" id="ZZ01E010" name="ZZ01E010" value="ZZ01E010：{0}を入力してください。"><input type="hidden" id="WC02E020" name="WC02E020" value="WC02E020：時間項目が重複しています。同じ時間項目は合計して入力してください。"><input type="hidden" id="WC02E021" name="WC02E021" value="WC02E021：時間項目が選択されていない時間帯があります。時間項目を選択してください。"><input type="hidden" id="WC02E200" name="WC02E200" value="WC02E200：休憩時間帯は所定時間帯と重複しないように入力してください。"><input type="hidden" id="WC02E030" name="WC02E030" value="WC02E030：{0}は、-2400～2400の範囲で入力してください。"><input type="hidden" id="WC02E031" name="WC02E031" value="WC02E031：{0}は、0000～2400の範囲で入力してください。"><input type="hidden" id="WC02E050" name="WC02E050" value="WC02E050：回数項目が重複しています。同じ回数項目は合計して入力してください。"><input type="hidden" id="WC02E220" name="WC02E220" value="WC02E220：{0}の日付には、当日以外を入力してください。"><input type="hidden" id="WC02E221" name="WC02E221" value="WC02E221：振替休日から振替出勤日を指定できません。振替出勤日から振替休日（{0}）を指定してください。"><input type="hidden" id="WC02E100" name="WC02E100" value="WC02E100：実働時間は0分以上になるように入力してください。"><input type="hidden" id="WC02E110" name="WC02E110" value="WC02E110：管理会計/担当JOBコード、PJコードの組合せが重複しています。同じ管理会計/担当JOBコード、PJコードの組合せは合計して入力してください。"><input type="hidden" id="WC02E120" name="WC02E120" value="WC02E120：作業内容を登録する場合、管理会計/担当JOBコード、PJコード、作業時間のすべてに値を入力してください。"><input type="hidden" id="WC02E130" name="WC02E130" value="WC02E130：実働時間と作業時間合計を一致させてください。"><input type="hidden" id="WC02W130" name="WC02W130" value="WC02W130：実働時間と作業時間が一致しません。登録してもよろしいですか？"><input type="hidden" id="WC02E816" name="WC02E816" value="WC02E816：時間帯項目を入力する場合、時間帯項目、開始時刻、終了時刻のすべてに値を入力してください。"><input type="hidden" id="WC02EC01" name="WC02EC01" value="WC02EC01：管理会計/担当JOBコードを作業時間で登録する場合は、開始時刻、終了時刻を全て入力してください。">
</FORM>

<form  method="POST" action="/Lysithea/com.hisas.ias.web.Invoker" target="_top" name="FORM_COMMON" onsubmit="return false;" >
<input type="hidden" name="SASFWSTATEID" value="WC020">
<input type="hidden" name="SASFWSTAMP" value="1767850465471">
<input type="hidden" name="SASFWNEXTLABEL" value="WC020">

<input type="hidden" name="tokenNo" value="00dcd642-75c4-4884-a571-cf1df385cd7d">
<input type="hidden" name="LabelName" value="">
<INPUT TYPE="HIDDEN" NAME="SakuBanFlag" VALUE="">


<INPUT TYPE="hidden" NAME="PersonID" VALUE="Person_77467">
<INPUT type="hidden" name="DateToday" value="2026/01/08">
<header class="funcHeader">
	
<nav class="funcBar">
	<div class="funcBarBox">
		
			<div class="tgl-menu">
			</div>
		
		<div class="funcbar-content">
			<div class="func-back">
				
			</div>
			<div class="func-title">
				
						<h2 id="funcBar-title" class="title">勤休内容登録</h2>
					
			</div>
			
					<div class="func-logout">
						<button id="funcBar-btn-logoff" class="btn btn-transp" onclick="return menujs.go('WC010_2','PERSONAL');">
							<i class="fa fa-sign-out"></i>
							<span>
								ログアウト
							</span>
						</button>
					</div>
				
		</div>
	</div>
</nav>

	<nav class="funcNav">
		<div class="container">
			
			<div class="fb fb-lr">
				<div class="fb fb-column">
					
					<div class="mod-user-2info">
						<span class="stfno">A2172877</span>
						<span class="name">内山　隆啓</span>
					</div>
					
					<div class="mod-daily-control">
						<div class="mod-navs">
							
									<a href="#" class="nav-prev" onclick="return top.doLabel('PREVIOUSDAY')"></a>
								
									<a href="#" class="nav-next" onclick="return top.doLabel('NEXTDAY')"></a>
								
						</div>
						<div class="mod-daily-control"><div class="date"><span class="year">2026</span><span>1</span><span class="sla"></span><span>8</span><span class="divider"></span><span class="kakko">木</span></div></div>
							<div class="jsk">jsk-1</div>
							
								<div class="gsk">gsk-0</div>
							
					</div>
				</div>
				<div class="fi">
					<div class="btn-box-r">
						
						<button type="button" class="btn btn-delete" onclick="top.dosubmitCancel();return false;">
							取消
						</button>
						
						<button type="button" class="btn btn-big btn-primary" onclick="top.dosubmitRegister();return false;">
							登録
						</button>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<nav class="funcSubNav">
		<div class="container">
			<div class="fb fb-lr">
				
				<input type="hidden" name="SelectedTabHolidayId" id="SelectedTabHolidayId" value="">
				
					<div class="mod-tabs">
						
								<a class="tab active" href="#" onclick="return changeTab('Holiday_1_Company_1')">働く</a>
							
								<a class="tab " href="#" onclick="return changeTab('Holiday_27')">休む／特休</a>
							
								<a class="tab " href="#" onclick="return changeTab('Holiday_29')">半休</a>
							
					</div>
				
				<div class="mod-WC020-calc">
					
					<div class="grp">
						<span class="lbl">実働時間</span>
						<span class="time" id="actual-working-header">
							--
						</span>
					</div>
					
						<div class="grp">
							<span class="lbl">作業時間</span>
							<span class="time" id="total-quantity-header">--</span>
						</div>
					
					<div class="grp">
						<div id="calc-button" class="btn btn-wire">
							<i class="fa fa-calculator"></i>
							計算
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
</header>

<div class="desk">
<div class="container">
<div class="rack">


<div class="rack-row" id="holiday-area" style="display:none">
	<div class="rack-sect sect-embed">
		<div class="sect-head">
			状態
		</div>
		<div class="sect-body">
			<div class="gridform">
				<div class="gf-row" id="holiday-div-row" style="display:none">
					
					<label class="f5x">
						<span class="lbl">
							休暇区分
						</span>
						
							<input type="hidden" name="HolidayKind" value="WeekDay">
						
						<input type="hidden" name="HolidayKind"><select class="InputSelect" NAME="HolidayDivision" onchange="return top.doLabel('HOLIDAY');">
<option value="Holiday_1_Company_1" selected> </option>
</select>

					</label>

					
					<label class="f6x" id="holiday-cause-part" style="display:none">
						
							<span class="lbl">
								積立休暇事由
							</span>
							<select class="InputSelect" NAME="HolidayCause">
<option value="Cause_CauseTypeHoliday_none" selected></option>
<option value="Cause_13">私傷病</option>
<option value="Cause_14">育児</option>
<option value="Cause_15">介護</option>
<option value="Cause_16">妊婦関連</option>
<option value="Cause_17">計画休暇</option>
</select>

					</label>
				</div>
				
				<div class="gf-row" id="holiday-date-row" style="display:none">
					<div class="embed-form-row">
						<div class="fi fb fb-middle">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="rack-row">
	
			<div class="rack-sect">
				<div class="sect-head">
					予定
				</div>
				<div class="sect-body">
					<div class="gridform">
						<div class="gf-row">
							
								<label class="f3x">
									<span class="lbl">始業予定</span>
									<span class="time">--</span>
								</label>
							
								<label class="f3x">
									<span class="lbl">終業予定</span>
									<span class="time">--</span>
								</label>
							
								<label class="f6x">
									<span class="lbl">理由</span>
									<span class="txt"></span>
								</label>
							
						</div>
					</div>
				</div>
			</div>
		
				<div class="rack-sect">
			<div class="sect-head">
					打刻
				</div>
				<div class="sect-body">
					<div class="gridform">
						<div class="gf-row">
							
							<label class="f3x">
								
									<span class="lbl">
										始業打刻
									</span>
									<span class="time">
										08:47
									</span>
								
							</label>
							
							<label class="f3x">
								
									<span class="lbl">
										終業打刻
									</span>
									<span class="time">
										--
									</span>
								
							</label>
							
									<label class="f5x">
										<span class="lbl">打刻乖離事由</span>
										<select class="InputSelect" NAME="TimecardCause">
<option value="Cause_CauseTypeTimecard_none" selected></option>
<option value="Cause_7">直行・直帰</option>
<option value="Cause_18">半日有休&#043;特休時間</option>
<option value="Cause_6">打刻もれ</option>
<option value="Cause_19">打刻取消</option>
<option value="Cause_20">システム停止</option>
<option value="Cause_22">データ取込</option>
<option value="Cause_21">その他（備考欄に詳細入力）</option>
</select>

									</label>
								
							<label class="f2x">
								
									<span class="lbl"></span>
									<button type="button" class="btn btn-Detail" onclick="top.doStampDetailPopupChild();return false;">
										詳細
									</button>
								
							</label>
							
							<label class="f4x">
								
									<span class="lbl"></span>
									<span class="error">【打刻内容確認】</span>
								
							</label>
						</div>
					</div>
				</div>
			</div>
		
	<div class="rack-sect">
		<div class="sect-head">
			始終業
		</div>
		<div class="sect-body">
			<div class="gridform">
				<div class="gf-row">
					
					<label class="f3x">
						<span class="lbl">始業時刻</span>
						
								<INPUT TYPE="text" NAME="StartTime" SIZE="5" MAXLENGTH="4" VALUE="0900" onblur="return blurChecker.checkAttendanceTime('messages', this, '');">
								
					</label>
					
					<label class="f3x">
						<span class="lbl">終業時刻</span>
						
								<INPUT TYPE="text" NAME="EndTime" SIZE="5" MAXLENGTH="4" VALUE="1750" onblur="return blurChecker.checkAttendanceTime('messages', this, '');">
								
					</label>
					
					<label class="f7x">
						<span class="lbl">勤務シフト</span>
						
							<input type="hidden" name="IntendedDaysObj" value="-1">
						
							<input type="hidden" name="IntendedDaysObj" value="-1">
						
							<input type="hidden" name="IntendedDaysObj" value="-1">
						
							<input type="hidden" name="IntendedDaysObj" value="-1">
						
							<input type="hidden" name="IntendedDaysObj" value="-1">
						
							<input type="hidden" name="IntendedDaysObj" value="-1">
						
							<input type="hidden" name="IntendedDaysObj" value="-1">
						
							<input type="hidden" name="IntendedDaysObj" value="-1">
						
							<input type="hidden" name="IntendedDaysObj" value="-1">
						
							<input type="hidden" name="IntendedDaysObj" value="-1">
						
						<input type="hidden" name="WorkDivisionCount" value="10">
<select class="InputSelect" NAME="WorkDivision" onchange="return top.doLabel('WORK');">
<option value="WorkRule_433">S08:00-16:50休11:00&#040;1h&#041;</option>
<option value="WorkRule_434">S08:00-16:50休12:00&#040;1h&#041;</option>
<option value="WorkRule_439">S08:30-17:20休12:00&#040;1h&#041;</option>
<option value="WorkRule_136" selected>S09:00-17:50休12:00&#040;1h&#041;</option>
<option value="WorkRule_446">S09:00-18:00休12:00&#040;1h&#041;</option>
<option value="WorkRule_768">S09:30-18:00休12:00&#040;1h&#041;</option>
<option value="WorkRule_452">S10:00-18:50休13:00&#040;1h&#041;</option>
<option value="WorkRule_4540">S10:00-18:50休12:30&#040;1h&#041;</option>
<option value="WorkRule_9037">S10:00-18:50休12:15&#040;1h&#041;</option>
<option value="WorkRule_459">S11:00-19:50休14:00&#040;1h&#041;</option>
</select>

					</label>

					
					<label class="f3x" style="display: none;">

							<span class="lbl">
								自動計算
							</span>
							<select name="AutoCalculate" id="AutoCalculate" onchange="return top.doLabel('AUTOCALCULATE');">
								<OPTION VALUE="-1" SELECTED>する</OPTION>
								<OPTION VALUE="0" >しない</OPTION>
							</select>
						
					</label>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="rack-row">
	<div class="rack-sect">
		<div class="sect-head">
			勤怠事由
		</div>
		<div class="sect-body">
			<div class="gridform">
				<div class="gf-row">
					
						<label class="f5x">
							<span class="lbl">遅早取消申請</span>
							<select class="InputSelect" NAME="OtherCause">
<option value="Cause_CauseTypeOther_none" selected></option>
<option value="Cause_3">交通機関遅延</option>
<option value="Cause_4">早退（会社指示）</option>
<option value="Cause_5">交通機関遅延&#043;早退（会社指示）</option>
</select>

						</label>
					
					<label class="f11x">
						<span class="lbl">備考/その他事由</span>
						<INPUT TYPE="text" NAME="Comment"
							SIZE='102'
							value=""
							maxlength="100"
							onblur="return blurChecker.checkComment('messages', this, '100', '');">
					</label>
				</div>
			</div>
		</div>
	</div>
</div>
	<div class="rack-row">
		<div class="rack-sect flip-tgl">
			<div class="sect-head">
				①休憩・休憩内勤務  ②契約&#040;有給/半休&#041;時間・特休&#040;子,家,妊,生&#041;取得時間
			</div>
			<i class="fa fa-plus-square-o fold-tgl"></i>
		</div>
		
				<div class="flip-body">
					<div class="rack-sect">
						<div class="sect-head">
							①
						</div>
						<div class="sect-body">
							<div class="gridform">
								<div class="gf-row">
									<table>
										<thead>
											<tr>

                                                <th class="c7x">
休憩 / 休憩内勤務
												</th>
												<th class="c3x">
													開始時刻
												</th>
												<th class="c3x">
													終了時刻
												</th>

                                                <th class="c3x">
時間
												</th>

											</tr>
										</thead>
										<tbody id="period-items">
											
												<tr>
													<td>
														<select class="InputSelect" NAME="PeriodItem">
<option value="" selected></option>
<option value="DeductItem_privateout">休憩時間</option>
<option value="DeductItem_7">休憩内勤務時間</option>
</select>

													</td>
													<td>
														<input type="text" NAME="PeriodStart" SIZE="5" VALUE="" MAXLENGTH="4" onBlur="return blurChecker.checkPeriodTime('messages', this);" data-message-p1="開始時刻">
													</td>
													<td>
														<input type="text" NAME="PeriodEnd" SIZE="5" VALUE="" MAXLENGTH="4" onBlur="return blurChecker.checkPeriodTime('messages', this);" data-message-p1="終了時刻">
													</td>

                                                    <td>

													</td>

												</tr>
											
												<tr>
													<td>
														<select class="InputSelect" NAME="PeriodItem">
<option value="" selected></option>
<option value="DeductItem_privateout">休憩時間</option>
<option value="DeductItem_7">休憩内勤務時間</option>
</select>

													</td>
													<td>
														<input type="text" NAME="PeriodStart" SIZE="5" VALUE="" MAXLENGTH="4" onBlur="return blurChecker.checkPeriodTime('messages', this);" data-message-p1="開始時刻">
													</td>
													<td>
														<input type="text" NAME="PeriodEnd" SIZE="5" VALUE="" MAXLENGTH="4" onBlur="return blurChecker.checkPeriodTime('messages', this);" data-message-p1="終了時刻">
													</td>

                                                    <td>

													</td>

												</tr>
											
												<tr>
													<td>
														<select class="InputSelect" NAME="PeriodItem">
<option value="" selected></option>
<option value="DeductItem_privateout">休憩時間</option>
<option value="DeductItem_7">休憩内勤務時間</option>
</select>

													</td>
													<td>
														<input type="text" NAME="PeriodStart" SIZE="5" VALUE="" MAXLENGTH="4" onBlur="return blurChecker.checkPeriodTime('messages', this);" data-message-p1="開始時刻">
													</td>
													<td>
														<input type="text" NAME="PeriodEnd" SIZE="5" VALUE="" MAXLENGTH="4" onBlur="return blurChecker.checkPeriodTime('messages', this);" data-message-p1="終了時刻">
													</td>

                                                    <td>

													</td>

												</tr>
											
												<tr>
													<td>
														<select class="InputSelect" NAME="PeriodItem">
<option value="" selected></option>
<option value="DeductItem_privateout">休憩時間</option>
<option value="DeductItem_7">休憩内勤務時間</option>
</select>

													</td>
													<td>
														<input type="text" NAME="PeriodStart" SIZE="5" VALUE="" MAXLENGTH="4" onBlur="return blurChecker.checkPeriodTime('messages', this);" data-message-p1="開始時刻">
													</td>
													<td>
														<input type="text" NAME="PeriodEnd" SIZE="5" VALUE="" MAXLENGTH="4" onBlur="return blurChecker.checkPeriodTime('messages', this);" data-message-p1="終了時刻">
													</td>

                                                    <td>

													</td>

												</tr>
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

				
					<input type="hidden" name="PeriodItem">
					<input type="hidden" name="PeriodStart" value="">
					<input type="hidden" name="PeriodEnd" value="">
				
				<span id="period-item-input">
					
						<input type="hidden" name="PeriodStartInput" value="">
						<input type="hidden" name="PeriodEndInput" value="">
					
						<input type="hidden" name="PeriodStartInput" value="">
						<input type="hidden" name="PeriodEndInput" value="">
					
						<input type="hidden" name="PeriodStartInput" value="">
						<input type="hidden" name="PeriodEndInput" value="">
					
						<input type="hidden" name="PeriodStartInput" value="">
						<input type="hidden" name="PeriodEndInput" value="">
					
					<input type="hidden" name="PeriodStartInput" value="">
					<input type="hidden" name="PeriodEndInput" value="">
				</span>

				
				<input type="hidden" name="PeriodItemLen" id="PeriodItemLen" value="4">

			
		<input type="hidden" name="P372" VALUE="">
		
		<input type="hidden" name="P373" VALUE="60">
		
					<input type="hidden" name="DeductCode" value="">
					<input type="hidden" name="DeductName" value="">
				
					<input type="hidden" name="DeductCode" value="0010">
					<input type="hidden" name="DeductName" value="半日有休取得時間">
				
					<input type="hidden" name="DeductCode" value="0200">
					<input type="hidden" name="DeductName" value="子の看護休暇&#040;遅刻免除時間&#041;">
				
					<input type="hidden" name="DeductCode" value="0210">
					<input type="hidden" name="DeductName" value="子の看護休暇&#040;早退免除時間&#041;">
				
					<input type="hidden" name="DeductCode" value="0220">
					<input type="hidden" name="DeductName" value="子の看護休暇&#040;&#043;半休取得時&#041;">
				
					<input type="hidden" name="DeductCode" value="0230">
					<input type="hidden" name="DeductName" value="家族介護休暇&#040;遅刻免除時間&#041;">
				
					<input type="hidden" name="DeductCode" value="0240">
					<input type="hidden" name="DeductName" value="家族介護休暇&#040;早退免除時間&#041;">
				
					<input type="hidden" name="DeductCode" value="0250">
					<input type="hidden" name="DeductName" value="家族介護休暇&#040;&#043;半休取得時&#041;">
				
					<input type="hidden" name="DeductCode" value="0260">
					<input type="hidden" name="DeductName" value="妊婦・生理休暇&#040;遅刻免除時間&#041;">
				
					<input type="hidden" name="DeductCode" value="0270">
					<input type="hidden" name="DeductName" value="妊婦・生理休暇&#040;早退免除時間&#041;">
				
					<input type="hidden" name="DeductCode" value="0280">
					<input type="hidden" name="DeductName" value="妊婦・生理休暇&#040;&#043;半休取得時&#041;">
				
				<input type="hidden" name="DeductMasterCount" value="11">

				<div class="flip-body">
					<div class="rack-sect">
						<div class="sect-head">
							②
						</div>
						<div class="sect-body">
							<table>
								<thead>
									<tr>
										<th class="c8x">
										</th>
										<th class="c3x">
										</th>
										<th class="c5x">
										</th>
									</tr>
								</thead>
								<tbody>
									
										<tr>
											<td>
												<select class="InputSelect" NAME="DeductItem" onchange="return top.updateActualWorking(this);">
<option value="" selected></option>
<option value="DeductItem_1">半日有休取得時間</option>
<option value="DeductItem_8">子の看護休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_9">子の看護休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_10">子の看護休暇&#040;&#043;半休取得時&#041;</option>
<option value="DeductItem_11">家族介護休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_12">家族介護休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_13">家族介護休暇&#040;&#043;半休取得時&#041;</option>
<option value="DeductItem_14">妊婦・生理休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_15">妊婦・生理休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_16">妊婦・生理休暇&#040;&#043;半休取得時&#041;</option>
</select>

											</td>
											<td>
												<input type="text" NAME="DeductItemValue" VALUE="" SIZE="5" MAXLENGTH="4"
													onblur="return blurChecker.checkDeductTime('messages', false, false, 0);">
											</td>
											<td>
											</td>
										</tr>
									
										<tr>
											<td>
												<select class="InputSelect" NAME="DeductItem" onchange="return top.updateActualWorking(this);">
<option value="" selected></option>
<option value="DeductItem_1">半日有休取得時間</option>
<option value="DeductItem_8">子の看護休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_9">子の看護休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_10">子の看護休暇&#040;&#043;半休取得時&#041;</option>
<option value="DeductItem_11">家族介護休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_12">家族介護休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_13">家族介護休暇&#040;&#043;半休取得時&#041;</option>
<option value="DeductItem_14">妊婦・生理休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_15">妊婦・生理休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_16">妊婦・生理休暇&#040;&#043;半休取得時&#041;</option>
</select>

											</td>
											<td>
												<input type="text" NAME="DeductItemValue" VALUE="" SIZE="5" MAXLENGTH="4"
													onblur="return blurChecker.checkDeductTime('messages', false, false, 1);">
											</td>
											<td>
											</td>
										</tr>
									
										<tr>
											<td>
												<select class="InputSelect" NAME="DeductItem" onchange="return top.updateActualWorking(this);">
<option value="" selected></option>
<option value="DeductItem_1">半日有休取得時間</option>
<option value="DeductItem_8">子の看護休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_9">子の看護休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_10">子の看護休暇&#040;&#043;半休取得時&#041;</option>
<option value="DeductItem_11">家族介護休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_12">家族介護休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_13">家族介護休暇&#040;&#043;半休取得時&#041;</option>
<option value="DeductItem_14">妊婦・生理休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_15">妊婦・生理休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_16">妊婦・生理休暇&#040;&#043;半休取得時&#041;</option>
</select>

											</td>
											<td>
												<input type="text" NAME="DeductItemValue" VALUE="" SIZE="5" MAXLENGTH="4"
													onblur="return blurChecker.checkDeductTime('messages', false, false, 2);">
											</td>
											<td>
											</td>
										</tr>
									
										<tr>
											<td>
												<select class="InputSelect" NAME="DeductItem" onchange="return top.updateActualWorking(this);">
<option value="" selected></option>
<option value="DeductItem_1">半日有休取得時間</option>
<option value="DeductItem_8">子の看護休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_9">子の看護休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_10">子の看護休暇&#040;&#043;半休取得時&#041;</option>
<option value="DeductItem_11">家族介護休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_12">家族介護休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_13">家族介護休暇&#040;&#043;半休取得時&#041;</option>
<option value="DeductItem_14">妊婦・生理休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_15">妊婦・生理休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_16">妊婦・生理休暇&#040;&#043;半休取得時&#041;</option>
</select>

											</td>
											<td>
												<input type="text" NAME="DeductItemValue" VALUE="" SIZE="5" MAXLENGTH="4"
													onblur="return blurChecker.checkDeductTime('messages', false, false, 3);">
											</td>
											<td>
											</td>
										</tr>
									
										<tr>
											<td>
												<select class="InputSelect" NAME="DeductItem" onchange="return top.updateActualWorking(this);">
<option value="" selected></option>
<option value="DeductItem_1">半日有休取得時間</option>
<option value="DeductItem_8">子の看護休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_9">子の看護休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_10">子の看護休暇&#040;&#043;半休取得時&#041;</option>
<option value="DeductItem_11">家族介護休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_12">家族介護休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_13">家族介護休暇&#040;&#043;半休取得時&#041;</option>
<option value="DeductItem_14">妊婦・生理休暇&#040;遅刻免除時間&#041;</option>
<option value="DeductItem_15">妊婦・生理休暇&#040;早退免除時間&#041;</option>
<option value="DeductItem_16">妊婦・生理休暇&#040;&#043;半休取得時&#041;</option>
</select>

											</td>
											<td>
												<input type="text" NAME="DeductItemValue" VALUE="" SIZE="5" MAXLENGTH="4"
													onblur="return blurChecker.checkDeductTime('messages', false, false, 4);">
											</td>
											<td>
											</td>
										</tr>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			
	</div>
<!-- 		<div class="rack-row"> -->
		<div class="rack-row" style="width: 1200px;">

			<div class="rack-sect">
				<div class="sect-head">
					稼働
				</div>
				<div class="sect-body">

<!-- 				<table> -->
					<table style="width: 1100px;">

						<thead>
							<tr>

<!-- 								<th class="c5x"> -->
								<th class="c3x" style="display:none;" >
PJコード
								</th>

<!-- 								<th class="c5x"> -->
								<th class="c3x">
管理会計/JOBコード
								</th>

<!-- 								<th class="c2x"> -->
								<th class="c1x">
作業開始
								</th>

<!-- 								<th class="c2x"> -->
								<th class="c1x">
作業終了
								</th>

<!-- 								<th class="c2x"> -->
								<th class="c1x">
作業時間
								</th>

								<th class="c4x">
									フリーコメント
								</th>

							</tr>
						</thead>
						<tbody>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(0);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(0);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '0');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '0');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 0);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(1);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(1);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '1');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '1');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 1);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(2);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(2);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '2');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '2');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 2);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(3);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(3);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '3');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '3');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 3);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(4);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(4);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '4');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '4');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 4);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(5);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(5);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '5');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '5');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 5);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(6);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(6);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '6');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '6');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 6);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(7);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(7);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '7');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '7');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 7);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(8);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(8);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '8');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '8');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 8);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(9);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(9);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '9');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '9');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 9);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(10);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(10);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '10');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '10');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 10);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(11);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(11);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '11');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '11');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 11);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(12);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(12);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '12');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '12');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 12);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(13);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(13);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '13');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '13');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 13);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(14);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(14);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '14');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '14');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 14);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(15);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(15);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '15');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '15');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 15);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(16);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(16);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '16');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '16');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 16);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(17);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(17);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '17');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '17');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 17);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(18);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(18);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '18');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '18');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 18);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(19);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(19);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '19');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '19');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 19);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(20);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(20);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '20');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '20');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 20);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(21);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(21);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '21');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '21');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 21);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(22);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(22);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '22');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '22');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 22);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(23);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(23);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '23');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '23');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 23);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(24);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(24);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '24');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '24');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 24);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(25);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(25);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '25');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '25');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 25);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(26);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(26);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '26');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '26');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 26);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(27);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(27);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '27');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '27');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 27);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(28);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(28);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '28');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '28');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 28);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(29);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(29);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '29');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '29');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 29);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(30);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(30);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '30');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '30');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 30);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(31);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(31);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '31');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '31');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 31);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(32);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(32);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '32');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '32');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 32);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(33);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(33);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '33');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '33');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 33);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(34);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(34);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '34');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '34');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 34);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(35);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(35);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '35');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '35');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 35);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(36);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(36);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '36');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '36');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 36);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(37);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(37);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '37');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '37');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 37);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(38);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(38);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '38');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '38');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 38);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(39);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(39);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '39');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '39');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 39);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(40);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(40);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '40');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '40');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 40);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(41);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(41);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '41');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '41');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 41);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(42);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(42);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '42');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '42');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 42);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(43);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(43);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '43');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '43');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 43);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(44);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(44);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '44');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '44');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 44);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(45);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(45);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '45');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '45');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 45);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(46);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(46);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '46');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '46');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 46);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(47);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(47);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '47');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '47');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 47);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(48);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(48);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '48');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '48');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 48);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(49);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(49);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '49');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '49');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 49);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(50);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(50);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '50');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '50');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 50);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(51);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(51);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '51');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '51');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 51);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(52);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(52);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '52');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '52');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 52);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(53);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(53);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '53');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '53');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 53);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(54);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(54);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '54');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '54');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 54);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(55);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(55);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '55');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '55');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 55);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(56);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(56);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '56');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '56');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 56);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(57);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(57);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '57');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '57');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 57);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(58);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(58);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '58');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '58');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 58);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(59);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(59);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '59');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '59');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 59);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(60);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(60);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '60');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '60');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 60);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(61);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(61);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '61');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '61');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 61);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(62);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(62);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '62');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '62');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 62);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(63);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(63);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '63');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '63');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 63);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(64);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(64);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '64');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '64');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 64);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(65);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(65);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '65');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '65');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 65);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(66);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(66);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '66');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '66');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 66);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(67);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(67);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '67');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '67');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 67);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(68);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(68);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '68');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '68');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 68);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(69);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(69);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '69');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '69');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 69);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(70);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(70);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '70');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '70');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 70);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(71);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(71);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '71');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '71');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 71);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(72);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(72);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '72');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '72');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 72);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(73);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(73);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '73');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '73');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 73);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(74);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(74);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '74');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '74');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 74);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(75);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(75);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '75');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '75');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 75);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(76);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(76);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '76');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '76');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 76);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(77);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(77);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '77');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '77');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 77);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(78);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(78);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '78');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '78');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 78);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(79);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(79);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '79');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '79');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 79);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(80);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(80);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '80');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '80');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 80);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(81);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(81);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '81');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '81');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 81);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(82);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(82);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '82');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '82');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 82);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(83);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(83);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '83');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '83');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 83);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(84);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(84);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '84');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '84');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 84);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(85);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(85);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '85');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '85');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 85);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(86);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(86);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '86');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '86');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 86);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(87);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(87);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '87');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '87');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 87);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(88);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(88);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '88');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '88');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 88);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(89);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(89);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '89');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '89');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 89);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(90);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(90);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '90');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '90');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 90);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(91);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(91);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '91');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '91');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 91);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(92);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(92);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '92');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '92');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 92);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(93);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(93);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '93');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '93');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 93);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(94);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(94);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '94');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '94');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 94);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(95);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(95);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '95');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '95');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 95);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(96);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(96);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '96');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '96');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 96);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(97);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(97);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '97');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '97');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 97);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
								<tr>

<!-- 									<td> -->
									<td style="display:none;">

										<select class="InputSelect" NAME="CostNoItem"  onchange="updateTotalQuantity(98);">

												<option value=""></option>
											
												<option value="CostNo_1122572" >1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課</option>
											
												<option value="CostNo_1126582" >1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用</option>
											
												<option value="CostNo_1126583" >1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務</option>
											
												<option value="CostNo_1126584" >1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議</option>
											
												<option value="CostNo_1126585" >1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用</option>
											
												<option value="CostNo_1126589" >1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用</option>
											
												<option value="CostNo_1126590" >1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修</option>
											
												<option value="CostNo_1126591" >1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス</option>
											
												<option value="CostNo_1126592" >1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス</option>
											
												<option value="CostNo_1143989" >2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）</option>
											
												<option value="CostNo_1144737" >2112671029:レッドバロン／サイト運用</option>
											
												<option value="CostNo_1144816" >2113906001:（名）オークローンマーケティング／サイト運用</option>
											
												<option value="CostNo_1146736" >2127301001:（名オ）名古屋テレビ／サイト運用</option>
											
												<option value="CostNo_1152005" >2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件</option>
											
												<option value="CostNo_1170663" >2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務</option>
											
												<option value="CostNo_1177421" >2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）</option>
											
												<option value="CostNo_1192060" >2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）</option>
											
												<option value="CostNo_1190792" >2172997001:テック情報／サイトリニューアル</option>
											
												<option value="CostNo_1191283" >2173244001:ヴィアトリス製薬／企画コンテンツ制作</option>
											
												<option value="CostNo_1191981" >2173589001:アイキャスト／ひかりＴＶ運用</option>
											
										</select>

									</td>
									<td>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 START -->
										
											<select class="InputSelect" NAME="CostNoSelect"  onchange="return top.updateTotalQuantityForJobCode(98);">

											<option value=""
												selected>
													
											</option>

											<option value="CostNo_1122572"
												>
													1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課
											</option>

											<option value="CostNo_1126582"
												>
													1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用
											</option>

											<option value="CostNo_1126583"
												>
													1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務
											</option>

											<option value="CostNo_1126584"
												>
													1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議
											</option>

											<option value="CostNo_1126585"
												>
													1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用
											</option>

											<option value="CostNo_1126589"
												>
													1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用
											</option>

											<option value="CostNo_1126590"
												>
													1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修
											</option>

											<option value="CostNo_1126591"
												>
													1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス
											</option>

											<option value="CostNo_1126592"
												>
													1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス
											</option>

											<option value="CostNo_1143989"
												>
													2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）
											</option>

											<option value="CostNo_1144737"
												>
													2112671029:レッドバロン／サイト運用
											</option>

											<option value="CostNo_1144816"
												>
													2113906001:（名）オークローンマーケティング／サイト運用
											</option>

											<option value="CostNo_1146736"
												>
													2127301001:（名オ）名古屋テレビ／サイト運用
											</option>

											<option value="CostNo_1152005"
												>
													2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件
											</option>

											<option value="CostNo_1170663"
												>
													2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務
											</option>

											<option value="CostNo_1177421"
												>
													2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）
											</option>

											<option value="CostNo_1192060"
												>
													2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）
											</option>

											<option value="CostNo_1190792"
												>
													2172997001:テック情報／サイトリニューアル
											</option>

											<option value="CostNo_1191283"
												>
													2173244001:ヴィアトリス製薬／企画コンテンツ制作
											</option>

											<option value="CostNo_1191981"
												>
													2173589001:アイキャスト／ひかりＴＶ運用
											</option>

<!-- ADD 2023/03/28 TC Ver09-00 NC-顔 End -->
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 START -->

										<input name="CostName" VALUE="" style="border:none;display:none;" tabindex="-1" readonly >
<!-- MOD 2023/03/28 TC Ver09-00 NC-顔 End -->
										<input type="hidden" name="CostId" VALUE="">

										<input type="hidden" name="CostDetailCode" VALUE="">

									</td>

									<td>

										<input type="text" NAME="CostStartTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '98');">

									</td>
									<td>

										<input type="text" NAME="CostEndTime"
											VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="return blurChecker.checkAttendanceTime('messages', this, '98');">

									</td>

									<td>

										<input type="text" NAME="CostQuantity" VALUE=""
											SIZE="5" MAXLENGTH="4"

											onblur="blurChecker.checkQuantity('messages', 98);">

									</td>

									<td>
										<input type="text" NAME="FreeComment" VALUE=""  onblur="return blurChecker.checkComment('messages', this, '400', '');">
									</td>

								</tr>
							
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="sect-summary">
				<span class="lbl">
					作業時間
				</span>
				<span class="time" id="total-quantity-label">
				</span>
				
				<INPUT TYPE="hidden" NAME="TotalQuantity" id="TotalQuantity"
					VALUE="">
			</div>
			<INPUT TYPE="hidden" NAME="Parameter189" VALUE="2">
		</div>

</div>
</div>
</div><!-- end of .desk -->

	<input type="hidden" name="hidCostDetailCodeId" value="DetailCode_75207">
	<input type="hidden" name="hidCode" value="ZZZZ">
	<input type="hidden" name="hidDescription" value="デフォルト">

	<input type="hidden" name="hidCostNoId" value="CostNo_1122572">
	<input type="hidden" name="hidCostNoCode" value="1364042000">
	<input type="hidden" name="hidAbbreviation" value="１統・Ｄ３・２">

<input type="hidden" name="hidCostDetailCodeId" value="">
<input type="hidden" name="hidCode" value="">
<input type="hidden" name="hidDescription" value="">
<input type="hidden" name="hidCostNoId" value="">
<input type="hidden" name="hidCostNoCode" value="">
<input type="hidden" name="hidAbbreviation" value="">

<input type="hidden" name="DeductItemLen" value="5">
<input type="hidden" name="AllowanceItemLen" value="0">
<input type="hidden" name="CostItemLen" value="99">
<input type="hidden" name="CostInputDivision" value="0">

	<input type="hidden" name="CostNoOptionID" value="">
	<input type="hidden" name="CostNoOptionName" value="">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1122572">
	<input type="hidden" name="CostNoOptionName" value="1364042000:ＤＩ・ＤＣ１統・ＤＭＣ３・２課">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1126582">
	<input type="hidden" name="CostNoOptionName" value="1364042016:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・未稼働費用">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1126583">
	<input type="hidden" name="CostNoOptionName" value="1364042017:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内業務">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1126584">
	<input type="hidden" name="CostNoOptionName" value="1364042018:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・社内会議">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1126585">
	<input type="hidden" name="CostNoOptionName" value="1364042019:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・ＭＧ費用">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1126589">
	<input type="hidden" name="CostNoOptionName" value="1364042023:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・キャリアモデルバッジ制度費用">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1126590">
	<input type="hidden" name="CostNoOptionName" value="1364042024:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・その他研修">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1126591">
	<input type="hidden" name="CostNoOptionName" value="1364042025:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・既存プリセールス">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1126592">
	<input type="hidden" name="CostNoOptionName" value="1364042026:ＤＩ・ＤＣ１統・ＤＭＣ３・２課・新規プリセールス">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1143989">
	<input type="hidden" name="CostNoOptionName" value="2103405001:（名）ＴＭ／オンサイト（ＳＰ部ＷＥＢ制作開発室）">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1144737">
	<input type="hidden" name="CostNoOptionName" value="2112671029:レッドバロン／サイト運用">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1144816">
	<input type="hidden" name="CostNoOptionName" value="2113906001:（名）オークローンマーケティング／サイト運用">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1146736">
	<input type="hidden" name="CostNoOptionName" value="2127301001:（名オ）名古屋テレビ／サイト運用">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1152005">
	<input type="hidden" name="CostNoOptionName" value="2143929036:ＮＴＴドコモ／Ｌｅｍｉｎｏ案件">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1170663">
	<input type="hidden" name="CostNoOptionName" value="2162938001:【３Ｇ】ＮＴＴドコモｄカード／年間プロモーション業務">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1177421">
	<input type="hidden" name="CostNoOptionName" value="2166827002:ＵＣＢ／ＳＦＭＣ運用（２４年４月～）">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1192060">
	<input type="hidden" name="CostNoOptionName" value="2172796001:コープデリ／ＬＩＮＥチャットリタゲ運用（２５年１０月～）">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1190792">
	<input type="hidden" name="CostNoOptionName" value="2172997001:テック情報／サイトリニューアル">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1191283">
	<input type="hidden" name="CostNoOptionName" value="2173244001:ヴィアトリス製薬／企画コンテンツ制作">

	<input type="hidden" name="CostNoOptionID" value="CostNo_1191981">
	<input type="hidden" name="CostNoOptionName" value="2173589001:アイキャスト／ひかりＴＶ運用">

	<input type="hidden" name="CostNoOptionID" value="">
	<input type="hidden" name="CostNoOptionName" value="">
	<input type="hidden" name="DefaultDetailCode" value="ZZZZ">

	<input type="hidden" name="DeductItem" value="">
	<input type="hidden" name="DeductItemValue" value="">

	<input type="hidden" name="CostNoItem" value="">
	<input type="hidden" name="CostDetailCode" value="">
	<input type="hidden" name="CostQuantity" value="">

	<input type="hidden" name="CostId" VALUE="">
	<input type="hidden" name="CostName" value="">
	<input type="hidden" name="CostStartTime" VALUE="">
	<input type="hidden" name="CostEndTime" value="">

	<input type="hidden" name="StartTimeCheck" value="true">

	<input type="hidden" name="DefaultStartTime" value="0900">

	<input type="hidden" name="EndTimeCheck" value="true">

	<input type="hidden" name="DefaultEndTime" value="1750">
</form>


<FORM NAME="values">
	<input type="hidden" name="StartTime" value="始業時刻">
	<input type="hidden" name="EndTime" value="終業時刻">
	<input type="hidden" name="WorkDivision" value="勤務シフト">
	<input type="hidden" name="HolidayDivision" value="休暇区分">
	
	<input type="hidden" name="SubstitutedDate" value="">
	<input type="hidden" name="CompensatoryPlanDate" value="代休予定日">
	<input type="hidden" name="DeductItemValue" value="②">
	<input type="hidden" name="AllowanceItemValue" value="回数項目">
	<input type="hidden" name="Comment" value="備考/その他事由">
	<input type="hidden" name="Comment" value="100">
	<input type="hidden" name="CostDetailCode" value="PJコード">
	<input type="hidden" name="CostDetailCode" value="4">
	<input type="hidden" name="CostQuantity" value="作業時間">

	<input type="hidden" name="CostStartTime" value="作業開始">
	<input type="hidden" name="CostEndTime" value="作業終了">

	<input type="hidden" name="FreeComment" value="フリーコメント">
	<input type="hidden" name="FreeComment" value="400">

</FORM>

<FORM NAME="FORM_INVOKER" ACTION="/Lysithea/servlet/ChildInvoker" METHOD="post">
<input type="hidden" name="StateID" value="" >
<input type="hidden" name="NextLabel" value="">
<INPUT type="hidden" name="ControlName" value="">
<INPUT type="hidden" name="CommonDateValue" value="">
<INPUT type="hidden" name="KeeperName" value="">
<INPUT type="hidden" name="FormKeeperName" value="">

<INPUT TYPE="HIDDEN" VALUE="" NAME="DisplayDate">
<INPUT TYPE="HIDDEN" VALUE="" NAME="PersonID">
</FORM>


<div id="modal-template-personlist" tabindex="-1" role="dialog"
	class="modal fade">
	<div role="document" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" class="close">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">社員リスト</h4>
			</div>
			<div class="modal-body">
				<div class="mod-table-in-modal">
					<table>
						<thead>
							<tr>
								<th><input type="checkbox" class="checkall"></th>
								<th><input type="text" placeholder="絞り込み"
									class="localfilter block"></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary modal-btn-ok">OK</button>
			</div>
		</div>
	</div>
</div>

<div id="modal-template-departmentlist" tabindex="-1" role="dialog"
	class="modal fade">
	<div role="document" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" class="close">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">原価部門リスト</h4>
			</div>
			<div class="modal-body">
				<div class="mod-table-in-modal">
					<table>
						<thead>
							<tr>
								<th></th>
								<th><input type="text" placeholder="絞り込み"
									class="localfilter block"></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary modal-btn-ok">OK</button>
			</div>
		</div>
	</div>
</div>

<div id="modal-template-costnolist" tabindex="-1" role="dialog"
	class="modal fade">
	<div role="document" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" class="close">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">管理会計コードリスト</h4>
			</div>
			<div class="modal-body">
				<div class="mod-table-in-modal">
					<table>
						<thead>
							<tr>
								<th></th>
								<th><input type="text" placeholder="絞り込み"
									class="localfilter block"></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary modal-btn-ok">OK</button>
			</div>
		</div>
	</div>
</div>

<div id="modal-template-authorityPersonlist" tabindex="-1" role="dialog"
	class="modal fade">
	<div role="document" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" class="close">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">社員リスト</h4>
			</div>
			<div class="modal-body">
				<div class="mod-table-in-modal">
					<table>
						<thead>
							<tr>
								<th></th>
								<th><input type="text" placeholder="絞り込み"
									class="localfilter block"></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary modal-btn-ok">OK</button>
			</div>
		</div>
	</div>
</div>

<div id="modal-template-leftGroupAndManagementPersonlist" tabindex="-1" role="dialog"
	class="modal fade">
	<div role="document" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" class="close">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">マイグループ／管理対象組織リスト</h4>
			</div>
			<div class="modal-body">
				<div class="mod-table-in-modal">
					<table>
						<thead>
							<tr>
								<th></th>
								<th><input type="text" placeholder="絞り込み"
									class="localfilter block"></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary modal-btn-ok">OK</button>
			</div>
		</div>
	</div>
</div>
<div id="modal-template-rightGroupAndManagementPersonlist" tabindex="-1" role="dialog"
	class="modal fade">
	<div role="document" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" class="close">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">マイグループリスト</h4>
			</div>
			<div class="modal-body">
				<div class="mod-table-in-modal">
					<table>
						<thead>
							<tr>
								<th></th>
								<th><input type="text" placeholder="絞り込み"
									class="localfilter block"></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary modal-btn-ok">OK</button>
			</div>
		</div>
	</div>
</div>

<div class="popovers">
	
	<div id="mod-hanrei-kinmulist" class="popover-hidden">
		<div class="mod-hanrei-kinmulist">
			<div class="fb">
				
			</div>
		</div>
	</div>
</div>

</div>
</div>

</div>
</BODY>
</HTML>
