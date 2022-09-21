include <scale.scad>
use <onebyfour.scad>
use <twobyfour.scad>

virtMemberHt = 40 * scale;
topNotchHt = virtMemberHt - 2b4Width - 2b4Height;

difference()
{
    twobyfour(virtMemberHt);
    translate([topNotchHt,0,2b4Height / 2])
    {
        onebyfour(2b4Width);
    }
}
