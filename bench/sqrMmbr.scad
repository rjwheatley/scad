include <scale.scad>
include <cmnMember.scad>

module virtMmbr(mbrlen)
{
    translate([0,2b4W,mbrlen])
    {
        rotate([90,90,0])
        {
            cmnMmbr(mbrlen);
        }
    }
}

module horizMmbr(mbrlen)
{
    translate([2b4H,mbrlen,2b4W])
    {
        rotate([0,180,90])
        {
            cmnMmbr(mbrlen);
        }
    }
}

module sqrMmbr(vlen,hlen)
{
    translate([0,2b4H,0])
    {
        virtMmbr(vlen);
    }
    translate([0,hlen - 2b4H - 2b4W,0])
    {
        virtMmbr(vlen);
    }
    translate([0,0,2b4H])
    {
        horizMmbr(hlen);
    }
    translate([0,0,vlen - 2b4H - 2b4W])
    {
        horizMmbr(hlen);
    }
}