include <scale.scad>

module horMmbr(len)
{
    A = (len / 3) + (2b4H / 2);
    B = (2 * (len / 3)) + (2b4H / 2);
    C = 2b4W - 2b4H;
    
    points = [
    [0,0], //0
    [0,2b4W], //1
    [len,2b4W], //2
    [len,0], //3
    [len - 2b4H,0], //4
    [len - 2b4H,C], //5
    [len - (2 * 2b4H),C], //6
    [len - (2 * 2b4H),0], //7
    [B,0], //8
    [B,C], //9
    [B - 2b4H,C], //10
    [B - 2b4H,0], //11
    [A, 0], //12
    [A, C], //13
    [A - 2b4H, C], //14
    [A - 2b4H,0], //15
    [2 * 2b4H,0], //16
    [2 * 2b4H,C], //17
    [2b4H,C], //18
    [2b4H,0]]; //19

    translate([0,2b4H,0])
    {
        rotate([90,0,0])
        {
            linear_extrude(2b4H)
            {
                polygon(points);
            }
        }
    }
}

