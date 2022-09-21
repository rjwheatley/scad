scale = 32;

firWidth = (3 / 4) * scale;
firHeight = (3 / 2) * scale;

size = 1 * scale;
rad = 2;
holeDist = firWidth / 2;

module strip(firLen)
{
    cube([firWidth,firHeight,firLen]);
}

module strip45(firLen)
{
    points = [
    [  0,  0,  0 ],  //0
    [  0,  firHeight,  0 ],  //1
    [  0,  0,  firWidth ],  //2
    [  0,  firHeight,  firWidth ],  //3
    [  firLen - firWidth,  0,  firWidth ],  //4
    [  firLen - firWidth,  firHeight,  firWidth ],  //5
    [  firLen,  0,  0 ],  //6
    [  firLen,  firHeight,  0 ]]; //7
  
    faces = [
    [0,1,3,2], //back
    [6,7,1,0],  // bottom
    [4,2,3,5], // top
    [6,4,5,7],  // front
    [0,2,4,6],  // right
    [5,3,1,7]];  // left
  
    polyhedron( points, faces );
}

module drillHole(len)
{
    translate([0,0,firWidth / 2])
    {
        rotate([0,90,0])
        {
            cylinder(len, rad, rad);
        }
    }
}

module holes(len)
{
    translate([0,holeDist,0])
    {
        drillHole(len);
    }
    translate([0,firHeight - holeDist,0])
    {
        drillHole(len);
    }  
}

module hole(len)
{
    translate([len / 2,firHeight / 2,firWidth])
    {
        rotate([0,90,0])
        {
            drillHole(firWidth);
        }
    }
}

module drillGuide()
{
    difference()
    {
        translate([0,0,firWidth])
        {
            rotate([0,90,0])
            {
                strip(size);
            }
        }
        holes(size);
    }
}

module drillGuide45()
{
    difference()
    {
        strip45(size + firWidth);
        holes(size + (firWidth / 2));
    }
}

difference()
{
    drillGuide();
    hole(size - firWidth);
}

translate([size * 3,0,0])
{
    drillGuide45();
}

