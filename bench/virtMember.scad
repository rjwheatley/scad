include <scale.scad>

module virtMmbr(virtMmbrLen)
{
    points = [
    [0,0], //0
    [0,2b4H], //1
    [2b4H,2b4H], //2
    [2b4H,2b4H / 2], //3
    [2b4H + 2b4W,2b4H / 2], //4
    [2b4H + 2b4W,2b4H], //5
    [virtMmbrLen - 2b4H - 2b4W,2b4H], //7
    [virtMmbrLen - 2b4H - 2b4W,2b4H / 2], //6
    [virtMmbrLen - 2b4H,2b4H / 2], //8
    [virtMmbrLen - 2b4H,2b4H], //9
    [virtMmbrLen,2b4H], //11
    [virtMmbrLen,0]]; //10
  
    linear_extrude(2b4W)
    {
        polygon(points);
    }
}
