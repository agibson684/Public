function timeSource(){
   x=new Date(timeNow().getUTCFullYear(),timeNow().getUTCMonth(),timeNow().getUTCDate(),timeNow().getUTCHours(),timeNow().getUTCMinutes(),timeNow().getUTCSeconds());
   x.setTime(x.getTime()-21600000);
   return x;
}
function timeNow(){
   return new Date();
}
function leadingZero(x){
   return (x>9)?x:'0'+x;
}
function twelveHour(x){
   if(x==0){
      x=12;
   }
   if(x<0){
      x=12+x;
   }
   return (x>12)?x-=12:x;
}
function fixYear2(x){
   x=(x<500)?x+1900:x;
   return String(x).substring(2,4)
}
function displayTime(){
   document.getElementById('clock0').innerHTML=eval(outputTime0);
   document.getElementById('clock1').innerHTML=eval(outputTime1);
   document.getElementById('clock2').innerHTML=eval(outputTime2);
   document.getElementById('clock3').innerHTML=eval(outputTime3);
   setTimeout('displayTime()',1000);
}
function amPMsymbol(x){
   return (x>11)?'pm':'am';
}
var dayNames=new Array('Sun','Mon','Tue','Wed','Thu','Fri','Sat');
var monthNames=new Array('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');


var outputTime0="dayNames[timeSource().getDay()]+' '+timeSource().getDate()+' '+monthNames[timeSource().getMonth()]+' '+fixYear2(timeSource().getYear())+' '+':'+':'+' '+twelveHour(timeSource().getHours()+1)+':'+leadingZero(timeSource().getMinutes())+':'+leadingZero(timeSource().getSeconds())+' '+amPMsymbol(timeSource().getHours())";

var outputTime1="dayNames[timeSource().getDay()]+' '+timeSource().getDate()+' '+monthNames[timeSource().getMonth()]+' '+fixYear2(timeSource().getYear())+' '+':'+':'+' '+twelveHour(timeSource().getHours()+1)+':'+leadingZero(timeSource().getMinutes())+':'+leadingZero(timeSource().getSeconds())+' '+amPMsymbol(timeSource().getHours())";

var outputTime2="dayNames[timeSource().getDay()]+' '+timeSource().getDate()+' '+monthNames[timeSource().getMonth()]+' '+fixYear2(timeSource().getYear())+' '+':'+':'+' '+twelveHour(timeSource().getHours()-1)+':'+leadingZero(timeSource().getMinutes())+':'+leadingZero(timeSource().getSeconds())+' '+amPMsymbol(timeSource().getHours())";

var outputTime3="dayNames[timeSource().getDay()]+' '+timeSource().getDate()+' '+monthNames[timeSource().getMonth()]+' '+fixYear2(timeSource().getYear())+' '+':'+':'+' '+twelveHour(timeSource().getHours()-6)+':'+leadingZero(timeSource().getMinutes())+':'+leadingZero(timeSource().getSeconds())+' '+amPMsymbol(timeSource().getHours())";


// Use the following within your HTML to Start/display your clock
// <script language="JavaScript">displayTime();</script>
