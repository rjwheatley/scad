// LetterBlock.scad - Basic usage of text() and linear_extrude()

// Module instantiation
//LetterBlock("M");

// Module definition.
// size=30 defines an optional parameter with a default value.
//module LetterBlock(letter, size=30) {
//    difference() {
//        translate([0,0,size/4]) cube([size,size/16,size/8], center=true);
//    }
//}

//echo(version=version());
// Written by Marius Kintel <marius@kintel.net>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

scale = 32;

firWidth = (3 / 4) * scale;
firHeight = (3 / 2) * scale;
height = 36 * scale;
width = 29 * scale;
length = 35 * scale;

module strip(firLen)
{
    cube([firWidth,firHeight,firLen]);
}

module invu(width, height)
{
    strip(height);
    translate([width - firWidth,0,0])
    {
        strip(height);
    }
    translate([0,0,height])
    {
        rotate([0,90,0])
        {
            strip(width);
        }
    }
}

module parallels(length,width,height)
{
    translate([0,length,height])
    {
        rotate([90,0,0])
        {
            strip(length);
            translate([width - firWidth,0,0])
            {
                strip(length);
            }
        }
    }
}

module frame(length,width,height)
{
    invu(width,height);
    translate([0,length,0])
    {
        invu(width,height);
    }
    translate([])
    {
        parallels(length,width,height - firHeight);
    }
}

translate([-(width / 2),-(length / 2),0])
{
    frame(length,width,height);
}