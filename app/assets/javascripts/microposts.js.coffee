updateCountdown = ->
remaining = 140 - jQuery("#micropost_content").val().length
jQuery(".countdown").text remaining + " characters remaining"

jQuery(".countdown").css.scss "color", (if (remaining >= 21) then "gray")
jQuery(".countdown").css.scss "color", (if  (remaining >= 11) then "black")
jQuery(".countdown").css.scss "color", (if ( 11 > remaining)  then "red")

jQuery ->
updateCountdown()
$("micropost_content").change updateCountdown
$("micropost_content").keyup updateCountdown
