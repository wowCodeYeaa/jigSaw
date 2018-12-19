//
//  JigsawLevelSelectTableViewDataSource.m
//  JigSaw
//
//  Created by jianfang zhang on 2018/6/4.
//  Copyright © 2018年 jianfang zhang. All rights reserved.
//

#import "JigsawLevelSelectTableViewDataSource.h"
#import "JigsawLevelSelectTableViewCell.h"


#define JIGSAW_LEVEL_SELECT_SECTION_NUMBER 3

typedef NS_ENUM(NSUInteger, JIGSAW_LEVEL_SELECT_SECTION)
{
    JIGSAW_LEVEL_SELECT_SECTION_EASY,     //esay mode
    JIGSAW_LEVEL_SELECT_SECTION_NORMAL,   //normal mode
    JIGSAW_LEVEL_SELECT_SECTION_HARD      //hard mode
};

#define JIGSAW_EASY_SECTION_TITLE @"简单模式"
#define JIGSAW_NORMAL_SECTION_TITLE @"一般模式"
#define JIGSAW_HARD_SECTION_TITLE @"困难模式"

@implementation JigsawLevelSelectTableViewDataSource

- (instancetype)init //NS_DESIGNATED_INITIALIZER
{
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark -
#pragma mark JigsawLevelSelectTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"DigsawLevelSelectCellReuseIdentifier"];
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2
                                      reuseIdentifier:@"DigsawLevelSelectCellReuseIdentifier"];
    }
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    cell.detailTextLabel.textColor = [UIColor blackColor];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return JIGSAW_LEVEL_SELECT_SECTION_NUMBER;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle = @"";
    switch (section) {
        case JIGSAW_LEVEL_SELECT_SECTION_EASY:
            sectionTitle = JIGSAW_EASY_SECTION_TITLE;
            break;
        case JIGSAW_LEVEL_SELECT_SECTION_NORMAL:
            sectionTitle = JIGSAW_NORMAL_SECTION_TITLE;
            break;
        case JIGSAW_LEVEL_SELECT_SECTION_HARD:
            sectionTitle = JIGSAW_HARD_SECTION_TITLE;
            break;
        default:
            break;
    }
    return sectionTitle;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //TODO
    //testcode
    return 20;
}

@end
