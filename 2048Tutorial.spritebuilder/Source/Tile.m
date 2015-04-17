//
//  Tile.m
//  2048Tutorial
//
//  Created by Benjamin Encz on 07/04/14.
//  Copyright (c) 2014 MakeGamesWithUs inc. Free to use for all purposes.
//

#import "Tile.h"

@implementation Tile {
  CCSprite *_weapon;
  CCNodeColor *_backgroundNode;
}

- (id)init {
  self = [super init];

  if (self) {
    self.value = (arc4random()%2+1)*2;
  }

  return self;
}

- (void)didLoadFromCCB {
  [self updateValueDisplay];
}


- (void)updateValueDisplay {

  CCColor *backgroundColor = nil;
  CCSpriteFrame *gun = nil;

  switch (self.value) {
  case 2:
    backgroundColor = [CCColor colorWithRed:20.f/255.f green:20.f/255.f blue:80.f/255.f];
    gun = [CCSpriteFrame frameWithImageNamed:@"Guns/Zeus.png"];
    break;
  case 4:
    backgroundColor = [CCColor colorWithRed:20.f/255.f green:20.f/255.f blue:140.f/255.f];
    gun = [CCSpriteFrame frameWithImageNamed:@"Guns/Glockgo.png"];
    break;
  case 8:
    backgroundColor = [CCColor colorWithRed:20.f/255.f green:60.f/255.f blue:220.f/255.f];
    gun = [CCSpriteFrame frameWithImageNamed:@"Guns/CZ75go.png"];
    break;
  case 16:
    backgroundColor = [CCColor colorWithRed:20.f/255.f green:120.f/255.f blue:120.f/255.f];
    gun = [CCSpriteFrame frameWithImageNamed:@"Guns/Deagle.png"];
    break;
  case 32:
    backgroundColor = [CCColor colorWithRed:20.f/255.f green:160.f/255.f blue:120.f/255.f];
    gun = [CCSpriteFrame frameWithImageNamed:@"Guns/Mac10go.png"];
    break;
  case 64:
    backgroundColor = [CCColor colorWithRed:20.f/255.f green:160.f/255.f blue:60.f/255.f];
    gun = [CCSpriteFrame frameWithImageNamed:@"Guns/P90go.png"];
    break;
  case 128:
    backgroundColor = [CCColor colorWithRed:50.f/255.f green:160.f/255.f blue:60.f/255.f];
    gun = [CCSpriteFrame frameWithImageNamed:@"Guns/Auggo.png"];
    break;
  case 256:
    backgroundColor = [CCColor colorWithRed:80.f/255.f green:120.f/255.f blue:60.f/255.f];
    gun = [CCSpriteFrame frameWithImageNamed:@"Guns/M4a1-s.png"];
    break;
  case 512:
    backgroundColor = [CCColor colorWithRed:140.f/255.f green:70.f/255.f blue:60.f/255.f];
    gun = [CCSpriteFrame frameWithImageNamed:@"Guns/Ak47go.png"];
    break;
  case 1024:
    backgroundColor = [CCColor colorWithRed:170.f/255.f green:30.f/255.f blue:60.f/255.f];
    gun = [CCSpriteFrame frameWithImageNamed:@"Guns/Awpgo.png"];
    break;
  case 2048:
    backgroundColor = [CCColor colorWithRed:220.f/255.f green:30.f/255.f blue:30.f/255.f];
    gun = [CCSpriteFrame frameWithImageNamed:@"Guns/DefuseKit.png"];
    break;
  default:
    backgroundColor = [CCColor greenColor];
    gun = [CCSprite spriteWithImageNamed:@"Guns/Auggo.png"];
    break;
  }

  _backgroundNode.color = backgroundColor;
  _weapon.spriteFrame = gun;
}

@end
