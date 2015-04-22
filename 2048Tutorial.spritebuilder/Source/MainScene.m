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

/* 
 PLACEHOLDER CODE FOR FUTURE IMPLEMENTATION ADDONS!!!
 
 NSString *post = [NSString stringWithFormat:@”&Username=%@&Password=%@”,@”username”,@”password”];
 NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
 NSString *postLength = [NSString stringWithFormat:@”%d”,[postData length]];
 NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
 [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@”http://www.mycsgoserver.com;
 [request setHTTPMethod:@”POST”];
 [request setValue:postLength forHTTPHeaderField:@”Content-Length”];
 [request setValue:@”application/x-www-form-urlencoded” forHTTPHeaderField:@”Current-Type”];
 [request setHTTPBody:postData];
 NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
 if(conn)
 {
 NSLog(@”Connection Successful”)
 }
 else
 {
 NSLog(@”Connection could not be made”);
 }
 – (void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data
 – (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
 – (void)connectionDidFinishLoading:(NSURLConnection *)connection
*/


@end