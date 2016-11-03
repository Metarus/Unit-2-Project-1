import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

Box2DProcessing box2d;

Minim minim;
AudioPlayer song;
BeatDetect beat;

float timer;
boolean outwards;
PImage bulletSprite;
PImage[] faces = new PImage[6];
int rot;

ArrayList<Head> heads = new ArrayList<Head>();
ArrayList<Border> borders = new ArrayList<Border>();

void setup()
{
  minim = new Minim(this);

  fullScreen(P2D);

  faces[0] = loadImage("Metarus.png");
  faces[1] = loadImage("Ryano_.png");
  faces[2] = loadImage("Suitability.png");
  faces[3] = loadImage("Rocktah.png");
  faces[4] = loadImage("nookaxe.png");
  faces[5] = loadImage("DudG.png");

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);
  box2d.setContinuousPhysics(true);

  //box2d.listenForCollisions();
  for (int i=8; i<width; i+=16)
  {
    borders.add(new Border(i, 8, faces[(int)random(6)]));
    borders.add(new Border(i, height-8, faces[(int)random(6)]));
  }
  for (int i=24; i<height-16; i+=16)
  {
    borders.add(new Border(8, i, faces[(int)random(6)]));
    borders.add(new Border(width-8, i, faces[(int)random(6)]));
  }
  song = minim.loadFile("Song.mp3", 2048);
  song.play();

  beat = new BeatDetect();
  for (int i=0; i<50; i++)
  {
    heads.add(new Head(width/2, height/2, faces[(int)random(6)]));
  }
}
void draw()
{
  fill(255, 60);
  rect(0, 0, width, height);
  beat.detect(song.mix);
  if (beat.isOnset()||mousePressed)
  {
    heads.add(new Head(random(width), random(height), faces[(int)random(6)]));
    outwards=true;
    timer+=30;
  }
  if (timer>0)
  {
    timer--;
  }
  if (timer<1)
  {
    outwards=false;
  }
  timer*=0.95;
  box2d.step();
  if (keyPressed)
  {
    heads.add(new Head(random(width), random(height), faces[(int)random(6)]));
  }
  for (int i=0; i<heads.size(); i++)
  {
    heads.get(i).update();
    heads.get(i).Draw();
  }
  for (int i=0; i<borders.size(); i++)
  {
    borders.get(i).Draw();
  }
}