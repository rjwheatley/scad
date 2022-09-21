include <scale.scad>

thmA = 2b4W - 2b4H;
thmB = thmA / 2;

module topHorMmbr(len)
{
    points = [
    [0,0], //0
    [0,thmB], //1
    [2b4W,thmB], //2
    [2b4W,thmB + 2b4H], //3
    [0,thmB + 2b4H], //4
    [0,2b4W], //5
    [len,2b4W], //6
    [len,thmB + 2b4H], //7
    [len - 2b4W,thmB + 2b4H], //8
    [len - 2b4W,thmB], //9
    [len,thmB], //10
    [len,0]]; //11
  
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
