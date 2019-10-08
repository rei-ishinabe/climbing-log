//= require jquery
//= require jquery.turbolinks
//= require rails-ujs
//= require_tree .
//= require Chart.bundle
//= require chartkick
//= require clipboard

$(document).ready(function(){

  var clipboard = new Clipboard('.clipboard-btn');
  console.log(clipboard);

});

// Tooltip

$('.clipboard-btn').tooltip({
  trigger: 'click',
  placement: 'bottom'
});

function setTooltip(btn, message) {
  $(btn).tooltip('show')
    .attr('data-original-title', message)
    .tooltip('show');
}

function hideTooltip(btn) {
  setTimeout(function() {
    $(btn).tooltip('hide');
  }, 1000);
}

// Clipboard

var clipboard = new Clipboard('.clipboard-btn');

clipboard.on('success', function(e) {
  setTooltip(e.trigger, 'Copied!');
  hideTooltip(e.trigger);
});

clipboard.on('error', function(e) {
  setTooltip(e.trigger, 'Failed!');
  hideTooltip(e.trigger);
});
