/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// When the user scrolls down 20px from the top of the document, show the button
//smooth scrolling
$(document).ready(function(){
// Add smooth scrolling to all links in navbar + footer link
    $(".navbar a, footer a[href='#mypage']").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {

        // Prevent default anchor click behavior
        event.preventDefault();

        // Store hash
        var hash = this.hash;

        // Using jQuery's animate() method to add smooth page scroll
        // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
        $('html, body').animate({
        scrollTop: $(hash).offset().top
        }, 900, function(){

        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
        });
        } // End if
    });
});
//slide animation
$(window).scroll(function() {
    $(".slideanim").each(function(){
        var pos = $(this).offset().top;

        var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
        $(this).addClass("slide");
        }
    });
});
window.onscroll = function() {scrollFunction();};

function scrollFunction() {
	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	document.getElementById("myBtn").style.display = "block";
	} else {
	document.getElementById("myBtn").style.display = "none";
	}
}
$(window).scroll(function() {
    $(".slideanim").each(function(){
        var pos = $(this).offset().top;

        var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
        $(this).addClass("slide");
        }
    });
});
// When the user clicks on the button, scroll to the top of the document
function topFunction() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}