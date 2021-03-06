//
//  GJGCChatAuthorizAskCell.m
//  ZYChat
//
//  Created by ZYVincent QQ:1003081775 on 14-11-3.
//  Copyright (c) 2014年 ZYProSoft. All rights reserved.
//

#import "GJGCChatAuthorizAskCell.h"
#import "GJGCChatSystemNotiCellStyle.h"

@interface GJGCChatAuthorizAskCell ()

@end

@implementation GJGCChatAuthorizAskCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.headMargin = 8.f;
        
        /* 名片点击背景 */
        self.roleViewTapBackButton = [[GJCURoundCornerButton alloc]init];
        self.roleViewTapBackButton.highlightBackColor = [GJGCCommonFontColorStyle tapHighlightColor];
        self.roleViewTapBackButton.cornerBackView.cornerRadius = 8.f;
        self.roleViewTapBackButton.cornerBackView.roundedCorners = TKRoundedCornerTopLeft|TKRoundedCornerTopRight;
        self.roleViewTapBackButton.cornerBackView.borderColor = [GJGCCommonFontColorStyle tapHighlightColor];
        self.roleViewTapBackButton.cornerBackView.borderWidth = 1.f;
        self.roleViewTapBackButton.gjcf_left = 0;
        self.roleViewTapBackButton.gjcf_top = 0;
        self.roleViewTapBackButton.gjcf_width = self.stateContentView.gjcf_width;
        self.roleViewTapBackButton.gjcf_height = self.headMargin + self.headMargin + 48;
        GJCFWeakSelf weakSelf = self;
        [self.roleViewTapBackButton configureButtonDidTapAction:^(GJCURoundCornerButton *button) {
            [weakSelf tapOnButtonAction:button];
        }];
        [self.stateContentView addSubview:self.roleViewTapBackButton];
        
        // 头像
        self.headView = [[GJGCCommonHeadView alloc]init];
        self.headView.backgroundColor = [UIColor clearColor];
        self.headView.gjcf_left = self.contentInnerMargin;
        self.headView.gjcf_top = self.headMargin;
        self.headView.gjcf_width = 48;
        self.headView.gjcf_height = 48;
        self.headView.userInteractionEnabled = NO;
        [self.roleViewTapBackButton addSubview:self.headView];
        
        // 名字
        self.nameLabel = [[GJCFCoreTextContentView alloc]init];
        self.nameLabel.gjcf_left = self.headView.gjcf_right + self.contentInnerMargin;
        self.nameLabel.gjcf_width = self.roleViewTapBackButton.gjcf_width - self.headView.gjcf_width-3*self.contentInnerMargin;
        self.nameLabel.gjcf_top = self.contentInnerMargin;
        self.nameLabel.gjcf_height = 30;
        self.nameLabel.contentBaseWidth = self.nameLabel.gjcf_width;
        self.nameLabel.backgroundColor = [UIColor clearColor];
        [self.roleViewTapBackButton addSubview:self.nameLabel];
        
        // 群角色
        self.groupView = [[GJGCChatSystemNotiRoleGroupView alloc]init];
        self.groupView.backgroundColor = [UIColor clearColor];
        self.groupView.gjcf_left = self.nameLabel.gjcf_left;
        self.groupView.gjcf_top = self.nameLabel.gjcf_bottom + self.contentInnerMargin;
        self.groupView.gjcf_width = self.nameLabel.gjcf_width;
        self.groupView.gjcf_height = 40;
        [self.roleViewTapBackButton addSubview:self.groupView];
        
        // 个人角色
        self.personView = [[GJGCChatSystemNotiRolePersonView alloc]init];
        self.personView.backgroundColor = [UIColor clearColor];
        self.personView.gjcf_left = self.nameLabel.gjcf_left;
        self.personView.gjcf_top = self.nameLabel.gjcf_bottom + self.contentInnerMargin;
        self.personView.gjcf_width = self.nameLabel.gjcf_width;
        self.personView.gjcf_height = 40;
        [self.roleViewTapBackButton addSubview:self.personView];
        
        // 申请提示
        self.applyAuthorizLabel = [[GJCFCoreTextContentView alloc]init];
        self.applyAuthorizLabel.gjcf_top = self.roleViewTapBackButton.gjcf_bottom + self.headMargin;
        self.applyAuthorizLabel.gjcf_left = self.contentInnerMargin;
        self.applyAuthorizLabel.gjcf_width = self.roleViewTapBackButton.gjcf_width - 2*self.contentBordMargin;
        self.applyAuthorizLabel.contentBaseWidth = self.applyAuthorizLabel.gjcf_width;
        self.applyAuthorizLabel.contentBaseHeight = self.applyAuthorizLabel.gjcf_height;
        self.applyAuthorizLabel.backgroundColor = [UIColor clearColor];
        [self.stateContentView addSubview:self.applyAuthorizLabel];
        
        // 申请附加信息
        self.applyAuthorizReasonLabel = [[GJCFCoreTextContentView alloc]init];
        self.applyAuthorizReasonLabel.gjcf_top = self.applyAuthorizLabel.gjcf_bottom + 11.f;
        self.applyAuthorizReasonLabel.gjcf_left = self.applyAuthorizLabel.gjcf_left;
        self.applyAuthorizReasonLabel.gjcf_width = self.applyAuthorizLabel.gjcf_width;
        self.applyAuthorizReasonLabel.gjcf_height = self.applyAuthorizLabel.gjcf_height;
        self.applyAuthorizReasonLabel.contentBaseWidth = self.applyAuthorizReasonLabel.gjcf_width;
        self.applyAuthorizReasonLabel.contentBaseHeight = self.applyAuthorizReasonLabel.gjcf_height;
        self.applyAuthorizReasonLabel.backgroundColor = [UIColor clearColor];
        self.applyAuthorizReasonLabel.hidden = YES;
        [self.stateContentView addSubview:self.applyAuthorizReasonLabel];
        
        // 接受申请
        self.applyButton = [[GJCURoundCornerButton alloc]init];
        self.applyButton.backgroundColor = [UIColor clearColor];
        self.applyButton.gjcf_top = self.applyAuthorizReasonLabel.gjcf_bottom + self.contentInnerMargin;
        self.applyButton.gjcf_left = 0;
        self.applyButton.gjcf_width = self.stateContentView.gjcf_width/2;
        self.applyButton.gjcf_height = 44;
        self.applyButton.highlightBackColor = [GJGCCommonFontColorStyle tapHighlightColor];
        self.applyButton.titleView.contentAttributedString = [GJGCChatSystemNotiCellStyle formateButtonTitle:@"同意"];
        self.applyButton.titleView.gjcf_size = [GJCFCoreTextContentView contentSuggestSizeWithAttributedString:self.applyButton.titleView.contentAttributedString forBaseContentSize:self.applyButton.titleView.gjcf_size];
        self.applyButton.cornerBackView.cornerRadius = 8.f;
        self.applyButton.cornerBackView.borderWidth = 0.5f;
        self.applyButton.cornerBackView.borderColor = [GJGCCommonFontColorStyle mainSeprateLineColor];
        self.applyButton.cornerBackView.drawnBordersSides = TKDrawnBorderSidesTop;
        self.applyButton.cornerBackView.roundedCorners = TKRoundedCornerBottomLeft;
        [self.applyButton configureButtonDidTapAction:^(GJCURoundCornerButton *button) {
            [weakSelf tapOnButtonAction:button];
        }];
        [self.stateContentView addSubview:self.applyButton];
        
        // 拒绝申请
        self.rejectButton = [[GJCURoundCornerButton alloc]init];
        self.rejectButton.backgroundColor = [UIColor clearColor];
        self.rejectButton.gjcf_top = self.applyButton.gjcf_top;
        self.rejectButton.gjcf_left = self.applyButton.gjcf_right;
        self.rejectButton.gjcf_width = self.applyButton.gjcf_width;
        self.rejectButton.gjcf_height = self.applyButton.gjcf_height;
        self.rejectButton.titleView.alignment = NSTextAlignmentCenter;
        self.rejectButton.highlightBackColor = [GJGCCommonFontColorStyle tapHighlightColor];
        self.rejectButton.cornerBackView.borderColor = [GJGCCommonFontColorStyle tapHighlightColor];
        self.rejectButton.cornerBackView.borderWidth = 0.5f;
        self.rejectButton.cornerBackView.drawnBordersSides = TKDrawnBorderSidesTop;
        self.rejectButton.titleView.contentAttributedString = [GJGCChatSystemNotiCellStyle formateButtonTitle:@"拒绝"];
        self.rejectButton.titleView.gjcf_size = [GJCFCoreTextContentView contentSuggestSizeWithAttributedString:self.rejectButton.titleView.contentAttributedString forBaseContentSize:self.rejectButton.titleView.gjcf_size];
        self.rejectButton.cornerBackView.cornerRadius = 8.f;
        self.rejectButton.cornerBackView.roundedCorners = TKRoundedCornerBottomRight;
        [self.rejectButton configureButtonDidTapAction:^(GJCURoundCornerButton *button) {
            [weakSelf tapOnButtonAction:button];
        }];
        [self.stateContentView addSubview:self.rejectButton];
        
        // 分割线
        self.sepreteLine = [[UIImageView alloc]init];
        self.sepreteLine.backgroundColor = [GJGCCommonFontColorStyle mainSeprateLineColor];
        self.sepreteLine.gjcf_left = self.applyButton.gjcf_right;
        self.sepreteLine.gjcf_top = self.applyButton.gjcf_top + 14.5;
        self.sepreteLine.gjcf_width = 0.5;
        self.sepreteLine.gjcf_height = 15;
        [self.stateContentView addSubview:self.sepreteLine];
        
    }
    return self;
}


#pragma mark - 内部接口
- (void)setContentModel:(GJGCChatContentBaseModel *)contentModel
{
    if (!contentModel) {
        return;
    }
    
    [super setContentModel:contentModel];
    
    GJGCChatSystemNotiModel *notiModel = (GJGCChatSystemNotiModel *)contentModel;
    
    [self.nameLabel setContentAttributedString:notiModel.name];
    CGSize nameSuggestSize = [GJCFCoreTextContentView contentSuggestSizeWithAttributedString:notiModel.name forBaseContentSize:self.nameLabel.contentBaseSize];
    self.nameLabel.gjcf_size = nameSuggestSize;

    [self.applyAuthorizLabel setContentAttributedString:notiModel.applyTip];
    self.applyAuthorizLabel.gjcf_size = [GJCFCoreTextContentView contentSuggestSizeWithAttributedString:notiModel.applyTip forBaseContentSize:self.applyAuthorizLabel.contentBaseSize];

    /* 是否有申请附加信息 */
    if (notiModel.applyReason) {
        
        [self.applyAuthorizReasonLabel setContentAttributedString:notiModel.applyReason];
        self.applyAuthorizReasonLabel.gjcf_size = [GJCFCoreTextContentView contentSuggestSizeWithAttributedString:notiModel.applyReason forBaseContentSize:self.applyAuthorizReasonLabel.contentBaseSize];

        self.applyAuthorizReasonLabel.hidden = NO;
    }
    
    /* 群组设置 */
    if (notiModel.isGroupContent) {
        
        self.groupView.gjcf_top = self.nameLabel.gjcf_bottom + 11;
        
        self.groupView.level = notiModel.groupLevel;
        self.groupView.memberCount = notiModel.groupMemberCount;
        self.personView.hidden = YES;
        self.groupView.hidden = NO;
        
        /* 公用 */
        [self.headView setHeadUrl:notiModel.headUrl];
        
    }
    
    /* 个人认证 */
    if (notiModel.isUserContent) {
        
        self.personView.gjcf_top = self.nameLabel.gjcf_bottom + 11;
        self.personView.sex = GJCFStringToInt(notiModel.userSex);
        self.personView.age = notiModel.userAge;
        self.personView.starName = notiModel.userStarName;
        self.personView.hidden = NO;
        self.groupView.hidden = YES;
        
        /* 个人头像不一样 */
        NSString *headerUrl = @"";
        [self.headView setHeadUrl:headerUrl];

    }
    
    /* 重新设置文本内容之后就需要调整可变文本高度对应的高度 */
    
    /* 是否有验证附加信息 */
    if (self.applyAuthorizReasonLabel.hidden) {
        self.applyButton.gjcf_top = self.applyAuthorizLabel.gjcf_bottom + self.contentInnerMargin;
    }else{
        self.applyAuthorizReasonLabel.gjcf_top = self.applyAuthorizLabel.gjcf_bottom + self.contentInnerMargin/2;
        self.applyButton.gjcf_top = self.applyAuthorizReasonLabel.gjcf_bottom + self.contentInnerMargin;
    }
    self.rejectButton.gjcf_top = self.applyButton.gjcf_top;
    self.sepreteLine.gjcf_top = self.applyButton.gjcf_top + 14.5;
    self.stateContentView.gjcf_height = self.rejectButton.gjcf_bottom;
    
}

- (void)tapOnButtonAction:(GJCURoundCornerButton *)button
{
    if (button == self.applyButton) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(systemNotiBaseCellDidTapOnAcceptApplyButton:)]) {
            [self.delegate systemNotiBaseCellDidTapOnAcceptApplyButton:self];
        }
        return;
    }
    
    if (button == self.rejectButton) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(systemNotiBaseCellDidTapOnRejectApplyButton:)]) {
            [self.delegate systemNotiBaseCellDidTapOnRejectApplyButton:self];
        }
        return;
    }
    
    if (button == self.roleViewTapBackButton) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(systemNotiBaseCellDidTapOnRoleView:)]) {
            [self.delegate systemNotiBaseCellDidTapOnRoleView:self];
        }
        return;
    }
}

- (CGFloat)heightForContentModel:(GJGCChatSystemNotiModel *)notiModel
{    
    return [self cellHeight];
}

@end
