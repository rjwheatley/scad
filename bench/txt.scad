include <scale.scad>

//function func0() = 5;
//function func1(x=3) = 2*x+1;
//function func2() = [1,2,3,4];
//function func3(y=7) = (y==7) ? 5 : 2 ;
//function func4(p0,p1,p2,p3) = [p0,p1,p2,p3];
//function add_up_to(n, sum=0) =
//    n==0 ?
//        sum :
//        add_up_to(n-1, sum+n);

function lr(len, div) = len % div;
//function lb(len, div) = len / div;
function fr(len, div) = (len / div) % (32 / div);
function in(len, div) = (((len / div) - ((len / div) % (32 / div))) / (32 / div));

function lenstr(len) =
    lr(len,32) ?
        (lr(len,16) ?
            (lr(len,8) ?
                (lr(len,4) ?
                    (lr(len,2) ?
                        str(in(len,1), " ", fr(len,1), "/32\"") :
                        str(in(len,2), " ", fr(len,2), "/16\"")) :
                str(in(len,4), " ", fr(len,4), "/8\"")) :
            str(in(len, 8), " ", fr(len,8), "/4\"")) :
        str(in(len, 16), " ", fr(len, 16), "/2\"")) :
    str(len / 32, "\"");

    