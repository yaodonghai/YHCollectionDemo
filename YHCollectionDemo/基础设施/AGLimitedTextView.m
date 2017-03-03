//
//  AGLimitedTextView.m
//  AGVideo
//
//  Created by MaoRongsen on 15/12/10.
//  Copyright © 2015年 AppGame. All rights reserved.
//

#import "AGLimitedTextView.h"
#import "UIBarButtonItem+BlocksKit.h"
@interface AGLimitedTextView()
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, copy) NSString *lastString;
@end
@implementation AGLimitedTextView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer
{
    self = [super initWithFrame:frame textContainer:textContainer];
    if (self) {
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
    __weak typeof(self) weakSelf = self;
    self.textContainer.lineBreakMode = NSLineBreakByClipping;
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [AGUtilities screenWidth], 44)];
    UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"完成" style:UIBarButtonItemStylePlain handler:^(id sender) {
        [weakSelf resignFirstResponder];
    }];
    doneButtonItem.width = 44;
    _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    _countLabel.textAlignment = NSTextAlignmentRight;
    _countLabel.text = [NSString stringWithFormat:@"0/%@", @(self.maxWords)];
    UIBarButtonItem *titleButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_countLabel];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:@[spaceItem, titleButtonItem, doneButtonItem]];
    self.inputAccessoryView = toolBar;
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextViewTextDidChangeNotification object:self] takeUntil:[self rac_willDeallocSignal]] subscribeNext:^(NSNotification* x) {
        if (weakSelf.maxLineFeed != 0) {
            NSInteger location = [weakSelf.text locationOfSubstring:@"\n" atIndex:weakSelf.maxLineFeed - 1];
            if ( location != NSNotFound ){
                weakSelf.text = [weakSelf.text substringToIndexUsingASCII:weakSelf.maxWords];
            }
        }
        if ([weakSelf.text ASCIILength] > weakSelf.maxWords) {
            switch (weakSelf.limitType) {
                case InterceptionStringTextView:
                    weakSelf.text = [weakSelf.text substringToIndexUsingASCII:weakSelf.maxWords];
                    break;
                case TextViewUnableToEnter:
                    [weakSelf setLastText];
                    break;
                default:
                    break;
            }
        }
        weakSelf.lastString = weakSelf.text;
        [weakSelf changeCountLabel];
    }];
}
- (void)setMaxWords:(NSInteger)maxWords{
    _maxWords = maxWords;
    [self changeCountLabel];
}
- (void)setText:(NSString *)text{
    [super setText:text];
    if (!_lastString) {
        self.lastString = text;
    }
    [self changeCountLabel];
}

- (void)changeCountLabel{
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc] init];
    [aString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", @([self.text ASCIILength])] attributes:@{NSForegroundColorAttributeName : (([self.text ASCIILength] == self.maxWords) ? [UIColor redColor] : [UIColor HEX:0x585858]), NSFontAttributeName : [UIFont systemFontOfSize:12]}]];
    [aString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"/%@", @(self.maxWords)] attributes:@{NSForegroundColorAttributeName : [UIColor HEX:0x585858], NSFontAttributeName : [UIFont systemFontOfSize:12]}]];
    self.countLabel.attributedText = aString;
}

- (void)setLastText{
    UITextPosition* beginning = self.beginningOfDocument;
    UITextRange* selectedRange = self.selectedTextRange;
    UITextPosition* selectionStart = selectedRange.start;
    UITextPosition* selectionEnd = selectedRange.end;
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    NSRange range = NSMakeRange(location-(self.text.length-self.lastString.length), length);
    self.text = self.lastString;
    beginning = self.beginningOfDocument;
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition* endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange* selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}

@end








