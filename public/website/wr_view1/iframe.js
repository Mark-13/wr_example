//Enables display of an html web page within a WordRad web page



function getBrowserType() {
  return navigator.appName;
}

function getBrowserName() {
  return navigator.userAgent;
}

function removeIFrame(iFrameId) {
  var frameContainerRef=document.getElementById("iFrameContainer");
  var divFrameId = "c" + iFrameId;
  var divFrame=document.getElementById(divFrameId);
  frameContainerRef.removeChild(divFrame);
}

function moveIFrame(iFrameId,x,y,w,h) {
  var divFrameId = "c" + iFrameId;
  var divFrame=document.getElementById(divFrameId);
  if (divFrame == null) return;
  divFrame.style.left=x;
  divFrame.style.top=y;
  var iFrameRef=document.getElementById(iFrameId);
  iFrameRef.width=w;
  iFrameRef.height=h;
}

function hideIFrame(iFrameId){
  var divFrameId = "c" + iFrameId;
  var divFrame=document.getElementById(divFrameId);
  if (divFrame == null) return;
  divFrame.style.visibility="hidden";
}

function showIFrame(iFrameId){
  var divFrameId = "c" + iFrameId;
  var divFrame=document.getElementById(divFrameId);
  if (divFrame == null) return;
  divFrame.style.visibility="visible";
}

function loadIFrame(iFrameId,url,border){

  var iFrameSrc = "<iframe id='" + iFrameId + "' src='" + url + "' frameborder='" + border + "'></iframe>"
  var divFrameId = "c" + iFrameId;

  if (navigator.appName == 'Netscape') {
	var divFrame = document.createElement('div');
	divFrame.setAttribute('id',divFrameId);
	divFrame.setAttribute('style','position:absolute;background-color:transparent;border:' + border + 'px;visibility:hidden;');
  } else {
	var divFrame = document.createElement("<div id='"+ divFrameId + "' style='position:absolute;background-color:transparent;border:" + border + "px;visibility:hidden;'></div>");
  }

  document.getElementById("iFrameContainer").appendChild(divFrame);
  document.getElementById(divFrameId).innerHTML = iFrameSrc;

}
