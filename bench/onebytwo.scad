include <scale.scad>

module 1b2(len)
{
    cube([1b2W,1b2H,len]);
}
// 45 degree angle on 1 end
module 1b245(len)
{
    points = [
    [0,0],  //0
    [1b2H,1b2H],  //1
    [len,1b2H],  //2
    [len,0]];  //3

    translate([0,2b4H,0])
    {
        rotate([0,0,180])
        {
            linear_extrude(2b4H)
            {
                polygon(points);
            }
        }
    }  
}

//45 degree angle on both ends
module 1b22x45(len)
{
    points = [
    [0,0],  //0
    [1b2H,1b2H],  //1
    [len + 1b2H,1b2H],  //2
    [len,0]];  //3

    translate([0,0,1b2H])
    {
        rotate([-90,0,0])
        {
            linear_extrude(2b4H)
            {
                polygon(points);
            }
        }
    }  
}

//45 degree angle on both ends opposite angle
module 1b22x45Opp(len)
{
    points = [
    [0,0],  //0
    [1b2H,1b2H],  //1
    [len - 1b2H,1b2H],  //2
    [len,0]];  //3

    translate([0,1b2W,0])
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