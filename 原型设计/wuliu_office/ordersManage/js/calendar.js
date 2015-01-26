function getNowDate()
{
   var nn=new Date();
   year1=nn.getYear();
   mon1=nn.getMonth()+1;
   date1=nn.getDate();
   var monstr1;
   var datestr1
   if(mon1<10) 
    monstr1="0"+mon1;
   else
    monstr1=""+mon1;
     
   if(date1<10) 
     datestr1="0"+date1;
   else
     datestr1=""+date1;
   return year1+"-"+monstr1+"-"+datestr1;
}

function getlastweekDate()
{
   var nn=new Date();
   year1=nn.getYear();
   mon1=nn.getMonth()+1;
   date1=nn.getDate();
   
   var mm=new Date(year1,mon1-1,date1);
   var tmp1=new Date(2000,1,1);
   var tmp2=new Date(2000,1,15);
   var ne=tmp2-tmp1;
   var mm2=new Date();
   mm2.setTime(mm.getTime()-ne);
   
   
   year2=mm2.getYear();
   mon2=mm2.getMonth()+1;
   date2=mm2.getDate();
    
    
     if(mon2<10) 
    monstr2="0"+mon2;
   else
    monstr2=""+mon2;
     
   if(date2<10) 
     datestr2="0"+date2;
   else
     datestr2=""+date2;
 
   
    return year2+"-"+monstr2+"-"+datestr2;
}

var gdCtrl = new Object();
var goSelectTag = new Array();
var gcGray   = "#808080";
var gcToggle = "#FB8664";
var gcBG = "#f5f5f5";
var previousObject = null;

var gdCurDate = new Date();
var giYear = gdCurDate.getFullYear();
var giMonth = gdCurDate.getMonth()+1;
var giDay = gdCurDate.getDate();

//谷文栋 2003-04-30
var closeFlag = 0;
var blnFlag = true;

function fSetDate(iYear, iMonth, iDay){
  VicPopCal.style.visibility = "hidden";
  if ((iYear == 0) && (iMonth == 0) && (iDay == 0)){
  	gdCtrl.value = "";
  }else{
  	iMonth = iMonth + 100 + "";
  	iMonth = iMonth.substring(1);
  	iDay   = iDay + 100 + "";
  	iDay   = iDay.substring(1);
  	if(gdCtrl.tagName == "INPUT"){
  	  	gdCtrl.value = iYear+"-"+iMonth+"-"+iDay;
  	}else{
  	  	gdCtrl.innerText = iYear+"-"+iMonth+"-"+iDay;
  	}
  }
  
  for (i in goSelectTag)
  	goSelectTag[i].style.visibility = "visible";
  goSelectTag.length = 0;
  
  window.returnValue=gdCtrl.value;
  //window.close();
}

function closeCalendar(setType)
{
  if(setType == "on"){
    if(closeFlag != 0){
      clearTimeout(closeFlag);
      closeFlag = 0;
    }
  }else{
    if(VicPopCal.style.visibility == "visible"){
      closeFlag = setTimeout("HiddenDiv2()",1000);
      blnFlag = true;
    }
  }
}

function HiddenDiv()
{	
	var i;
  VicPopCal.style.visibility = "hidden";
  for (i in goSelectTag)
  	goSelectTag[i].style.visibility = "visible";
  goSelectTag.length = 0;
  //closeCalendar('on');
}

function HiddenDiv2()
{	
	if(blnFlag)
	{
  	var i;
    VicPopCal.style.visibility = "hidden";
    for (i in goSelectTag)
    	goSelectTag[i].style.visibility = "visible";
    goSelectTag.length = 0;
    closeCalendar('on');
  }
}

function fSetSelected(aCell){
  var iOffset = 0;
  var iYear = parseInt(tbSelYear.value);
  var iMonth = parseInt(tbSelMonth.value);
  
  aCell.bgColor = gcBG;
  with (aCell.children["cellText"]){
  	var iDay = parseInt(innerText);
  	if (color==gcGray)
		iOffset = (Victor<10)?-1:1;
	iMonth += iOffset;
	if (iMonth<1) {
		iYear--;
		iMonth = 12;
	}else if (iMonth>12){
		iYear++;
		iMonth = 1;
	}
  }
  fSetDate(iYear, iMonth, iDay);
}

function Point(iX, iY){
	this.x = iX;
	this.y = iY;
}

function fBuildCal(iYear, iMonth) {
  var aMonth=new Array();
  for(i=1;i<7;i++)
  	aMonth[i]=new Array(i);
  
  var dCalDate=new Date(iYear, iMonth-1, 1);
  var iDayOfFirst=dCalDate.getDay();
  var iDaysInMonth=new Date(iYear, iMonth, 0).getDate();
  var iOffsetLast=new Date(iYear, iMonth-1, 0).getDate()-iDayOfFirst+1;
  var iDate = 1;
  var iNext = 1;

  for (d = 0; d < 7; d++)
	aMonth[1][d] = (d<iDayOfFirst)?-(iOffsetLast+d):iDate++;
  for (w = 2; w < 7; w++)
  	for (d = 0; d < 7; d++)
		aMonth[w][d] = (iDate<=iDaysInMonth)?iDate++:-(iNext++);
  return aMonth;
}

function fDrawCal(iYear, iMonth, iCellHeight, sDateTextSize) {
  var WeekDay = new Array("日","一","二","三","四","五","六");
  var styleTD = " bgcolor='"+gcBG+"' bordercolor='"+gcBG+"' valign='middle' align='center' height='"+iCellHeight+"' style='font: arial "+sDateTextSize+";";            //Coded by Liming Weng(Victor Won) email:victorwon@sina.com

  with (document) {
	write("<tr>");
	for(i=0; i<7; i++){
		write("<td bgcolor=#000000 "+styleTD+"color:#ffffff' >"+ WeekDay[i] + "</td>");
	}
	write("</tr>");

  	for (w = 1; w < 7; w++) {
		write("<tr>");
		for (d = 0; d < 7; d++) {
			write("<td id=calCell "+styleTD+"cursor:hand;' onMouseOver='this.bgColor=gcToggle' onMouseOut='this.bgColor=gcBG' onclick='fSetSelected(this)'>");
			write("<font id=cellText Victor='Liming Weng'> </font>");			
			write("</td>")
		}
		write("</tr>");
	}
  }
}

function fUpdateCal(iYear, iMonth) {
  myMonth = fBuildCal(iYear, iMonth);
  var i = 0;
  for (w = 0; w < 6; w++)
	for (d = 0; d < 7; d++)
		with (cellText[(7*w)+d]) {
			Victor = i++;
			if (myMonth[w+1][d]<0) {
				color = gcGray;
				innerText = -myMonth[w+1][d];
			}else{
				color = ((d==0)||(d==6))?"red":"black";
				innerText = myMonth[w+1][d];
			}
		}
}

function fSetYearMon(iYear, iMon){
  tbSelMonth.options[iMon-1].selected = true;
  for (i = 0; i < tbSelYear.length; i++)
	if (tbSelYear.options[i].value == iYear)
		tbSelYear.options[i].selected = true;
  fUpdateCal(iYear, iMon);
}

function fPrevMonth(){
  var iMon = tbSelMonth.value;
  var iYear = tbSelYear.value;
  
  if (--iMon<1) {
	  iMon = 12;
	  iYear--;
  }
  
  fSetYearMon(iYear, iMon);
}

function fNextMonth(){
  var iMon = tbSelMonth.value;
  var iYear = tbSelYear.value;
  
  if (++iMon>12) {
	  iMon = 1;
	  iYear++;
  }
  
  fSetYearMon(iYear, iMon);
}

function fToggleTags(){
  with (document.all.tags("SELECT")){
 	for (i=0; i<length; i++)
 		if ((item(i).Victor!="Won")&&fTagInBound(item(i))){
 			item(i).style.visibility = "hidden";
 			goSelectTag[goSelectTag.length] = item(i);
 		}
  }
}

function fTagInBound(aTag){
  with (VicPopCal.style){
  	var l = parseInt(left);
  	var t = parseInt(top);
  	var r = l+parseInt(width);
  	var b = t+parseInt(height);
	var ptLT = fGetXY(aTag);
	return !((ptLT.x>r)||(ptLT.x+aTag.offsetWidth<l)||(ptLT.y>b)||(ptLT.y+aTag.offsetHeight<t));
  }
}

function fGetXY(aTag){
  var oTmp = aTag;
  var pt = new Point(0,0);
  do {
  	pt.x += oTmp.offsetLeft;
  	pt.y += oTmp.offsetTop;
  	oTmp = oTmp.offsetParent;
  } while(oTmp.tagName!="BODY");
  return pt;
}

// Main: popCtrl is the widget beyond which you want this calendar to appear;
//       dateCtrl is the widget into which you want to put the selected date.
// i.e.: <input type="text" name="dc" style="text-align:center" readonly><INPUT type="button" value="V" onclick="fPopCalendar(dc,dc);return false">
function fPopCalendar(popCtrl, dateCtrl, leftn, strDate){		//增加了lenftn 水平坐标参数，用来控制位置

  if (popCtrl == previousObject){
	  	if (VicPopCal.style.visibility == "visible"){
  		HiddenDiv();
  		//return true;    //谷文栋去掉 2003-02-10
  	}
  }
  
  previousObject = popCtrl;
  gdCtrl = dateCtrl;
  fInitialDate(strDate);
  fSetYearMon(giYear, giMonth); 
  var point = fGetXY(popCtrl);
  with (VicPopCal.style) {
  	left = point.x;
    left = leftn;    //谷文栋添加 2003-02-10
  	top  = point.y+popCtrl.offsetHeight;
  	//width = VicPopCal.offsetWidth;
  	//height = VicPopCal.offsetHeight;
  	fToggleTags(point); 	
  	visibility = 'visible';
  }
  blnFlag = false;
}

// Added by Danian Zhang/SUI
function fInitialDate(strDate){
	if( strDate == null || strDate.length != 10 )
		return false;

	var sYear  = strDate.substring(0,4);
	var sMonth = strDate.substring(5,7);
	var sDay   = strDate.substring(8,10);

	if( sMonth.charAt(0) == '0' ) { sMonth = sMonth.substring(1,2); }
	if( sDay.charAt(0)   == '0' ) { sDay   = sDay.substring(1,2);   }

	var nYear  = parseInt(sYear );
	var nMonth = parseInt(sMonth);
	var nDay   = parseInt(sDay  );
	
	if ( isNaN(nYear ) )	return false;
	if ( isNaN(nMonth) )	return false;
	if ( isNaN(nDay  ) )	return false;

	var arrMon = new Array(12);
	arrMon[ 0] = 31;	arrMon[ 1] = nYear % 4 == 0 ? 29:28;
	arrMon[ 2] = 31;	arrMon[ 3] = 30;
	arrMon[ 4] = 31;	arrMon[ 5] = 30;
	arrMon[ 6] = 31;	arrMon[ 7] = 31;
	arrMon[ 8] = 30;	arrMon[ 9] = 31;
	arrMon[10] = 30;	arrMon[11] = 31;

	if ( nYear  < 1900 || nYear > 2100 )			return false;
	if ( nMonth < 1 || nMonth > 12 )				return false;
	if ( nDay < 1 || nDay > arrMon[nMonth - 1] )	return false;

	giYear  = nYear;
	giMonth = nMonth;
	giDay   = nDay;
	return true;
}

var gMonths = new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");

with (document) {
//*******  样式名称,在下面用引号不成功,所以做成变量  *********
var button1;
var button2;
button1 = "button1"
button2 = "button2"
//************************************************************
write("<link href='style_css/button.css' rel='stylesheet' type='text/css'>");
write("<Div id='VicPopCal' style='OVERFLOW:hidden;POSITION:absolute;VISIBILITY:hidden;border:1px ridge;z-index:100;'>");
write("<table id='TableCal' border='0' bgcolor='#f5f5f5'>");
write("<TR>");
write("<td valign='middle' align='center'><input type='button' class='button1' onMouseOver='this.className=button2' onMouseOut='this.className=button1' name='PrevMonth' value='<' style='height:20;width:20;' onClick='fPrevMonth()'>");
//write("<td valign='middle' align='center'><input type='button' name='PrevMonth' value='<' style='height:20;width:20;' onClick='fPrevMonth()'>");
write("&nbsp;<SELECT name='tbSelYear' onChange='fUpdateCal(tbSelYear.value, tbSelMonth.value)' Victor='Won'>");
for(i=1950;i<2015;i++)
	write("<OPTION value='"+i+"'>"+i+" 年</OPTION>");
write("</SELECT>");
write("&nbsp;<select name='tbSelMonth' onChange='fUpdateCal(tbSelYear.value, tbSelMonth.value)' Victor='Won'>");
for (i=0; i<12; i++)
	write("<option value='"+(i+1)+"'>"+gMonths[i]+"</option>");
write("</SELECT>");
write("&nbsp;<input type='button' class='button1' onMouseOver='this.className=button2' onMouseOut='this.className=button1' name='PrevMonth' value='>' style='height:20;width:20;' onclick='fNextMonth()'>");
write("</td>");
write("</TR><TR>");
write("<td align='center'>");
write("<DIV style='background-color:#cccccc'><table width='100%' border='0'>");
fDrawCal(giYear, giMonth, 20, '12');
write("</table></DIV>");
write("</td>");
write("</TR><TR><TD align='center'>");
write("<TABLE width='100%'><TR><TD align='center'>");
//write("<B style='cursor:hand' onclick='fSetDate(0,0,0)' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=0'>清空</B>");
write("<font style='cursor:hand' onclick='HiddenDiv()' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=0'>关闭</font>");   //谷文栋添加 2003-02-10
write("</td><td algin='center'>");
write("<font style='cursor:hand' onclick='fSetDate(giYear,giMonth,giDay)' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=0'>今天: "+giYear+"-"+giMonth+"-"+giDay+"</font>");
write("</td></tr></table>");
write("</TD></TR>");
write("</TABLE></Div>");
}