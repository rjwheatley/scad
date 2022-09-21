
scale = 32;

firWidth = (3 / 4) * scale;
firHeight = (3 / 2) * scale;

size = 6 * scale;

module strip(firLen)
{
    cube([firWidth,firHeight,firLen]);
}

// 45 degree angle on 1 end
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
    [0,1,7,6],  // bottom
    [4,2,3,5], // top
    [6,4,5,7],  // front
    [0,2,4,6],  // right
    [7,1,3,5]];  // left
  
    polyhedron( points, faces );
}

//45 degree angle on both ends
module strip45x2(firLen)
{
    points = [
    [  0,  0,  0 ],  //0
    [firWidth,0,firWidth], //1
    [firWidth,firHeight,firWidth], //2
    [0,firHeight,0], //3
    [  firLen - firWidth,  0,  firWidth ],  //4
    [  firLen - firWidth,  firHeight,  firWidth ],  //5
    [  firLen,  firHeight,  0 ],  //6
    [  firLen,  0,  0 ]]; //7
  
    faces = [
    [0,1,2,3], //back
    [0,3,6,7],  // bottom
    [1,2,5,4], // top
    [4,5,6,7],  // front
    [0,1,4,7],  // right
    [3,2,5,6]];  // left
  
    polyhedron( points, faces );
}

module corner45(sideLen)
{
    strip45(sideLen);
    translate([0, (firHeight / 2), 0])
    {
        rotate([0,180,180])
        {
            color("black") text(str("   ", sideLen / scale ," inches"));
        }
    }
    translate([0,firHeight,firWidth])
    {
        rotate([0,-90,180])
        {
            strip45(sideLen - firWidth);
            translate([0, (firHeight / 2), 0])
            {
                rotate([0,180,180])
                {
                    color("black") text(str("   ", (sideLen - firWidth) / scale ," inches"));
                }
            }
        }
    }
}

corner45(size);
translate([0,firHeight,size + sqrt(2 * firWidth * firWidth)])
{
    rotate([180,45,0])
    {
        sizep = size + sqrt(2 * firWidth * firWidth);
        hyp = sqrt(2 * sizep * sizep);
        truncHyp = round((hyp / scale) - 0.5);
        thirty2nds = round((hyp - (truncHyp * scale)) - 0.5); 
        strip45x2(hyp);
        translate([0,20,0])
        {
            rotate([180,0,0])
            {
                color("black") text(str("   ", truncHyp, " ", thirty2nds, "/32 inches"));
            }
        }
    }
}
