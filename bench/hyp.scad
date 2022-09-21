scale = 32;

firWidth = (3 / 4) * scale;
firHeight = (3 / 2) * scale;
prismHyp = sqrt(2 * firWidth * firWidth);
miniPrismSide = prismHyp - firWidth;
miniPrismHyp = firWidth;

size = 6 * scale;
length = 10 * scale;
tup = sqrt((length * length) / 2);

// 45 degree angle on both ends
module brace(firLen)
{
    points = [
    [  0,  0,  0 ],  //0
    [firWidth,0,firWidth], //1
    [firWidth,firHeight,firWidth], //2
    [0,firHeight,0], //3
    [  firLen - miniPrismSide,  0, 0 ],  //4
    [  firLen,  0, miniPrismSide ],  //5
    [  firLen - miniPrismSide,  firHeight, 0 ],  //6
    [  firLen - sqrt(2 * (prismHyp - firWidth) *(prismHyp - firWidth)), firHeight, firWidth ], //7
    [  firLen, firHeight, miniPrismSide  ], //8
    [  firLen - sqrt(2 * (prismHyp - firWidth) *(prismHyp - firWidth)), 0, firWidth]  ]; //9
  
    faces = [
    [0,1,2,3], //back
    [0,3,6,4],  // bottom
    [1,2,7,9], // top
    [5,9,7,8],  // front
    [4,5,8,6],  //front bezel
    [0,1,9,5,4],  // right
    [6,3,2,7,8]];  // left
  
    polyhedron( points, faces );
}

translate([0,0,tup])
{
    rotate([0,45,0])
    {
        brace(length);
    }
}