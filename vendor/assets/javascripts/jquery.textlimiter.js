
function($) {
2
    $.fn.extend( {
3
        limiter: function(limit, elem) {
4
            $(this).on("keyup focus", function() {
5
                setCount(this, elem);
6
            });
7
            function setCount(src, elem) {
8
                var chars = src.value.length;
9
                if (chars > limit) {
10
                    src.value = src.value.substr(0, limit);
11
                    chars = limit;
12
                }
13
                elem.html( limit - chars );
14
            }
15
            setCount($(this)[0], elem);
16
        }
17
    });
18
})(jQuery);

var elem = $("#chars");
2
$(".field#chars").limiter(140, chars);
