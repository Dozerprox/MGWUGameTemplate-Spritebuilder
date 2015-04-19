//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Benjamin Encz on 10/10/13.
//  Copyright (c) 2014 MakeGamesWithUs inc. Free to use for all purposes.
//

#import "MainScene.h"
#import "Grid.h"

@implementation MainScene {
  Grid *_grid;
  CCLabelTTF *_scoreLabel;
  CCLabelTTF *_highscoreLabel;
  CCTime _gameTime;
    double _time;
    struct timeval tv;
    struct timeval cv;
    NSDate *start;
    bool _planted;
    OALSimpleAudio *audio;
}

- (void)dealloc {
  [_grid removeObserver:self forKeyPath:@"score"];
}

- (void)didLoadFromCCB {
  [_grid addObserver:self forKeyPath:@"score" options:0 context:NULL];

  [[NSUserDefaults standardUserDefaults]addObserver:self
  forKeyPath:@"highscore"
  options:0
  context:NULL];

  // load highscore
  [self updateHighscore];
    //gettimeofday(&tv,NULL);
    start = [NSDate date];
    _planted = false;
    audio = [OALSimpleAudio sharedInstance];
    [audio preloadEffect:@"Resources/Audio/planted.mp3"];
    [audio preloadEffect:@"Resources/Audio/bomb.wav"];
}

- (void)updateHighscore {
  NSNumber *newHighscore = [[NSUserDefaults standardUserDefaults]objectForKey:@"highscore"];
  if (newHighscore) {
    _highscoreLabel.string = [NSString stringWithFormat:@"%d", [newHighscore intValue]];
  }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
  ofObject:(id)object
  change:(NSDictionary *)change
  context:(void *)context {
  if ([keyPath isEqualToString:@"score"]) {
    _scoreLabel.string = [NSString stringWithFormat:@"%d", _grid.score];
  } else if ([keyPath isEqualToString:@"highscore"]) {
    [self updateHighscore];
  }
}

float roundToN(float num, int decimals)
{
    int tenpow = 1;
    for (; decimals; tenpow *= 10, decimals--);
    return round(tenpow * num) / tenpow;
}

- (void)update:(CCTime)delta {
    NSTimeInterval timeInterval = [start timeIntervalSinceNow];
    if (roundToN(timeInterval * -1,2 ) == 5.0f ) {
        //_planted = true;
        [audio playEffect:@"planted.mp3"];
        NSLog(@"%f", timeInterval);
    }
    
    if (roundToN(timeInterval * -1,2 ) == 10.0f ) {
        //_planted = true;
        [audio playEffect:@"bomb.wav"];
        NSLog(@"%f", timeInterval);
    }
}

@end