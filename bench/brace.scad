scale = 32;

firWidth = (3 / 4) * scale;
firHeight = (3 / 2) * scale;
prismHyp = sqrt(2 * firWidth * firWidth);
miniPrismSide = prismHyp - firWidth;
miniPrismHyp = firWidth;

size = 6 * scale;
length = 20.375 * scale;

module strip(firLen)
{
    translate([0, 0, firWidth])
    {
        rotate([0,90,0])
        {
            cube([firWidth,firHeight,firLen]);
        }
    }
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

// 45 degree angle on both ends
module strip45x2(firLen)
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

module invu45(sideLen,longLen)
{
    strip(longLen);
    sizep = sqrt(2 * firWidth * firWidth);
    hyp = sqrt(2 * sizep * sizep);
    translate([sideLen - firWidth + 15, 0, firWidth])
    {
        topStripLen = longLen - (sideLen * 2) + (2 * firWidth) - 30;
        tsBL = round((topStripLen / scale) - 0.5);
        thirty2nds = round((topStripLen - (tsBL * scale)) - 0.5); 
        strip(topStripLen);
        color("black") text(str("   ", topStripLen, " ", thirty2nds, "/32 inches"));
    }
    translate([0, (firHeight / 2), 0])
    {
        longBL = round((longLen / scale) - 0.5);
        thirty2nds = round((longLen - (longBL * scale)) - 0.5);
        rotate([0,180,180])
        {
            color("black") text(str("   ", longBL, " ", thirty2nds, "/32 inches"));
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
    translate([longLen,0,firWidth])
    {
    rotate([0,-90,0])
        {
            strip45(sideLen);
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

//corner45(size);
invu45(size,length);
smallSizep = sqrt(2 * firWidth * firWidth);
smallHyp = sqrt(2 * smallSizep * smallSizep);        
translate([0,firHeight,size + sqrt(2 * firWidth * firWidth)])
{
    rotate([180,45,0])
    {
        sizep = size + sqrt(2 * firWidth * firWidth);
        hyp = sqrt(2 * sizep * sizep);
        bracketLen = hyp - prismHyp - miniPrismHyp;
        truncBL = round((bracketLen / scale) - 0.5);
        thirty2nds = round((bracketLen - (truncBL * scale)) - 0.5); 
        strip45x2(bracketLen);
        translate([0,20,0])
        {
            rotate([180,0,0])
            {
                color("black") text(str("   ", truncBL, " ", thirty2nds, "/32 inches"));
            }
        }
    }
}
translate([length,0,size + sqrt(2 * firWidth * firWidth)])
{
    rotate([0,135,0])
    {
        sizep = size + sqrt(2 * firWidth * firWidth);
        hyp = sqrt(2 * sizep * sizep);
        bracketLen = hyp - smallHyp;
        truncBL = round((bracketLen / scale) - 0.5);
        thirty2nds = round((bracketLen - (truncBL * scale)) - 0.5); 
        strip45x2(hyp - smallHyp);
        translate([0,20,0])
        {
            rotate([180,0,0])
            {
                color("black") text(str("   ", truncBL, " ", thirty2nds, "/32 inches"));
            }
        }
    }
}
