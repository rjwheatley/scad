include <scale.scad>

module cmnMmbr(cmnMmbrLen)
{
    points = [
    [0,0], //0
    [0,2b4H], //1
    [2b4H,2b4H], //2
    [2b4H,2b4H / 2], //3
    [2b4H + 2b4W,2b4H / 2], //4
    [2b4H + 2b4W,2b4H], //5
    [cmnMmbrLen - 2b4H - 2b4W,2b4H], //7
    [cmnMmbrLen - 2b4H - 2b4W,2b4H / 2], //6
    [cmnMmbrLen - 2b4H,2b4H / 2], //8
    [cmnMmbrLen - 2b4H,2b4H], //9
    [cmnMmbrLen,2b4H], //11
    [cmnMmbrLen,0]]; //10
  
    linear_extrude(2b4W)
    {
        polygon(points);
    }
}