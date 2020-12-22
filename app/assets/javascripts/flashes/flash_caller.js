var flashes = [];
var counter = 0;
$(document).ready( function(){
    flashes = $(".flash-tag").toArray();
    counter = 0;
    for(var ii = 0; ii < flashes.length; ii++)
    {
      setTimeout(function () {
      triggerNotif();
    }, (300 * (ii +1)));
  }
});

function triggerNotif()
{
  var m_this = $(flashes[counter]);
  var type = m_this.attr("data-type");
  var mssg = m_this.text();
//  console.log(type + ": " + mssg);
  filterNotifType(type, mssg);
  counter ++;
}

function filterNotifType(type, mssg)
{
  if (type == "error" || type == "danger")
    showErrorNotif("", mssg);

  else if (type == "warning")
    showWarningNotif("", mssg);

  else if (type == "notice" || type == "success")
    showSuccessNotif("", mssg);

  else showUndefinedNotif("", mssg);

}

function showErrorNotif(title, message)
{
    var nPos = "right";
    var nType = "danger";
    var nDelay = 10000;
    var nIcon = "fire";

    onNotif(title, message, nPos, nType, nDelay, nIcon); 
}

function showErrorNotifAndTime(title, message, milis)
{
    var nPos = "right";
    var nType = "danger";
    var nIcon = "fire";

    onNotif(title, message, nPos, nType, nDelay, nIcon); 
}

function showWarningNotif(title, message)
{
    var nPos = "right";
    var nType = "warning";
    var nDelay = 10000;
    var nIcon = "warning";

    onNotif(title, message, nPos, nType, nDelay, nIcon); 
}

function showSuccessNotif(title, message)
{
    var nPos = "right";
    var nType = "success";
    var nDelay = 10000;
    var nIcon = "check-circle";

    onNotif(title, message, nPos, nType, nDelay, nIcon); 
}

function showUndefinedNotif(title, message)
{
    var nPos = "right";
    var nType = "purple";
    var nDelay = 5000;
    var nIcon = "comment";

    onNotif(title, message, nPos, nType, nDelay, nIcon); 
}


function onNotif(m_title, m_message, m_pos, m_type, m_delay, m_icon)
{
  $.notify({
    icon: 'font-icon font-icon-' + m_icon,
    title: '<strong>' + m_title + '</strong>',
    message: m_message,
  },
  {
    type: m_type,
    delay: m_delay,
    placement: {
      from: "top",
      align: m_pos,
    },   
    animate: {
    enter: 'animated fadeInDown',
    exit: 'animated fadeOut'
  }
  });

}

