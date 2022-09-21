include <scale.scad>
include <sqrMmbr.scad>
include <horMmbr.scad>
include <topHorMmbr.scad>
include <onebytwo.scad>
include <twobyfour.scad>

ht = 36 * scale;
dpth = 30 * scale;
//wdth = 136 * scale;
wdth = 105 * scale;
chklen = 6 * scale;

A = (wdth / 3) - (2b4H / 2);
B = (2 * (wdth / 3)) - (2b4H / 2);
C = 2b4H - ((2b4W - 2b4H) / 2);
D = ht - (2 * 2b4W) - (2 * 2b4H);
E = sqrt(2 * D * D);
F = sqrt(2 * 1b2H * 1b2H);
G = sqrt((1b2H * 1b2H) / 2);
H = (2 * chklen) + D;
I = (2 * 2b4H) + 2b4W;
//J = (wdth / 3) - 2b4H - (2 * G);
J = (wdth - H + (2 * 1b2H)) - (D + chklen - 1b2H + chklen - F);
K = J / 2;
L = sqrt(2 * K * K);

translate([2b4H,0,0])
{
    sqrMmbr(ht,dpth);
}
translate([A, 0, 0])
{
    sqrMmbr(ht,dpth);
}
translate([B, 0, 0])
{
    sqrMmbr(ht,dpth);
}
translate([wdth - (2 * 2b4H), 0, 0])
{
    sqrMmbr(ht,dpth);
}
translate([0,dpth - 2b4H,ht - 2b4H - 2b4W + 2b4H])
{
    horMmbr(wdth);
}
translate([0,dpth - 2b4H,2b4H + 2b4H])
{
    horMmbr(wdth);
}
translate([0,0,ht - 2b4H - 2b4W + 2b4H])
{
    horMmbr(wdth);
}
translate([C,2b4H,ht - 2b4H])
{
    rotate([90,0,90])
    {
        topHorMmbr(dpth - (2 * 2b4H));
    }
}
translate([C - 2b4H + A,2b4H,ht - 2b4H])
{
    rotate([90,0,90])
    {
        topHorMmbr(dpth - (2 * 2b4H));
    }
}
translate([C - 2b4H + B,2b4H,ht - 2b4H])
{
    rotate([90,0,90])
    {
        topHorMmbr(dpth - (2 * 2b4H));
    }
}
translate([wdth - 2b4W - C,2b4H,ht - 2b4H])
{
    rotate([90,0,90])
    {
        topHorMmbr(dpth - (2 * 2b4H));
    }
}
translate([chklen,dpth,2b4H + 2b4W + 1b2H])
{
    rotate([90,0,0])
    {
        1b245(chklen);
    }
}
translate([chklen + F - 1b2H,dpth - 1b2W,2b4H + 2b4W + 2b4H])
{
    rotate([0,-45,0])
    {
        translate([-1b2H,0,0])
        {
            1b22x45(E);
        }
    }
}
translate([wdth - chklen,dpth - 1b2W,2b4H + 2b4W + 1b2H])
{
    rotate([90,0,180])
    {
        1b245(chklen);
    }
}
translate([wdth - chklen - D + 1b2H,dpth - 1b2W,I + D])
{
    rotate([180,45,0])
    {
        translate([-1b2H,-1b2W,0])
        {
            1b22x45(E);
        }
    }
}
translate([chklen - 1b2H + D,dpth - 1b2W,I + D - 1b2H])
{
    1b22x45Opp(chklen);
}
translate([wdth - H + 1b2H,dpth - 1b2W,I + D - 1b2H])
{
    1b22x45Opp(chklen);
}
translate([wdth - H + (2 * 1b2H),dpth - 1b2W,I + D])
{
    rotate([0,-45,0])
    {
        translate([0,0,(2 * 1b2H)])
        {
            rotate([-90,0,0])
            {
                1b245(L - 1b2H);
            }
        }
    }
}
translate([G + chklen + D,dpth - 1b2W,-G + I])
{
    rotate([0,-45,0])
    {
        translate([0,0,-1b2H])
        {
            rotate([90,0,180])
            {
                1b245(L - 1b2H);
            }
        }
    }
}
translate([H - 1b2H,dpth - 1b2W,I + D])
{
    rotate([180,45,0])
    {
        translate([-1b2H,-1b2W,0])
        {
            1b22x45(E);
        }
    }
}
translate([2 *(chklen + D - 1b2H),dpth - 1b2W,2b4H + 2b4W + 1b2H])
{
    rotate([90,0,180])
    {
        1b245(chklen);
    }
}
translate([chklen + D + 1b2H,dpth,-1b2H + I])
{
    rotate([90,0,0])
    {
        1b245(chklen);
    }
}
translate([(2 * 2b4H),(dpth / 3) + (2b4H / 2),ht - 2b4W - 2b4H])
{
    rotate([90,0,0])
    {
        twobyfour((wdth / 3) + (2b4H / 2) - (3 * 2b4H));
    }
}
translate([(2 * 2b4H),2 * (dpth / 3) + (2b4H / 2),ht - 2b4W - 2b4H])
{
    rotate([90,0,0])
    {
        twobyfour((wdth / 3) + (2b4H / 2) - (3 * 2b4H));
    }
}
translate([(2 * 2b4H) + (wdth / 3) + (2b4H / 2) - (2 *2b4H),(dpth / 2) + (2b4H / 2),ht - 2b4W - 2b4H])
{
    rotate([90,0,0])
    {
        twobyfour((wdth / 3) - 2b4H);
    }
}
translate([(2 * (wdth / 3)) + (2b4H / 2),(dpth / 3) + (2b4H / 2),ht - 2b4W - 2b4H])
{
    rotate([90,0,0])
    {
        twobyfour((wdth / 3) + (2b4H / 2) - (3 * 2b4H));
    }
}
translate([(2 * (wdth / 3)) + (2b4H / 2),(2 * (dpth / 3)) + (2b4H / 2),ht - 2b4W - 2b4H])
{
    rotate([90,0,0])
    {
        twobyfour((wdth / 3) + (2b4H / 2) - (3 * 2b4H));
    }
}
translate([(2 * (wdth / 3)) + (2b4H / 2),(dpth / 6) + (2b4H / 2),ht - 2b4W - 2b4H])
{
    rotate([90,0,0])
    {
        twobyfour((wdth / 3) + (2b4H / 2) - (3 * 2b4H));
    }
}
translate([(3 * (wdth / 3)) - (2 * 2b4H) - ((2b4W - 2b4H) / 2),2b4H,ht - 2b4H])
{
    rotate([0,0,90])
    {
        twobyfour((dpth / 3) - (2b4H / 2));
    }
}
translate([(3 * (wdth / 3)) - (2 * 2b4H) - ((2b4W - 2b4H) / 2) - 2b4W,2b4H,ht - 2b4H])
{
    rotate([0,0,90])
    {
        twobyfour((dpth / 3) - (2b4H / 2));
    }
}
translate([(3 * (wdth / 3)) - (2 * 2b4H) - ((2b4W - 2b4H) / 2) - (2 * 2b4W),2b4H,ht - 2b4H])
{
    rotate([0,0,90])
    {
        twobyfour((dpth / 3) - (2b4H / 2));
    }
}
translate([(3 * (wdth / 3)) - (2 * 2b4H) - ((2b4W - 2b4H) / 2) - (3 * 2b4W),2b4H,ht - 2b4H])
{
    rotate([0,0,90])
    {
        twobyfour((dpth / 3) - (2b4H / 2));
    }
}
translate([0,0,ht])
{
    cube([wdth,dpth,(3 / 4) * scale]);
}