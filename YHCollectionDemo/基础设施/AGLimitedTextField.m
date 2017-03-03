//
//  AGLimitedTextField.m
//  AGVideo
//
//  Created by MaoRongsen on 15/12/10.
//  Copyright © 2015年 AppGame. All rights reserved.
//

#import "AGLimitedTextField.h"
#import "UIBarButtonItem+BlocksKit.h"
@interface AGLimitedTextField()
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) UIToolbar *toolBar;
@property (nonatomic, copy) NSString *lastString;
@end
@implementation AGLimitedTextField

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
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
    self.inputAccessoryView = self.toolBar;
    __weak typeof(self) weakSelf = self;
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextFieldTextDidChangeNotification object:self] takeUntil:[self rac_willDeallocSignal]] subscribeNext:^(NSNotification* x) {
        if ([weakSelf.text ASCIILength] > weakSelf.maxWords) {
            switch (weakSelf.limitType) {
                case InterceptionString:
                    weakSelf.text = [weakSelf.text substringToIndexUsingASCII:weakSelf.maxWords];
                    break;
                case TextFieldUnableToEnter:
                    [weakSelf setLastText];
                    break;
                default:
                    break;
            }
        }
        weakSelf.lastString = weakSelf.text;
        weakSelf.countLabel.text = [NSString stringWithFormat:@"%@/%@", @([weakSelf.text ASCIILength]), @(weakSelf.maxWords)];
    }];
}

- (UIToolbar*)toolBar{
    if (!_toolBar) {
        __weak typeof(self) weakSelf = self;
        _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [AGUtilities screenWidth], 44)];
        UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"完成" style:UIBarButtonItemStylePlain handler:^(id sender) {
            [weakSelf resignFirstResponder];
        }];
        doneButtonItem.width = 44;
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
        _countLabel.textAlignment = NSTextAlignmentRight;
        _countLabel.font = [UIFont systemFontOfSize:12];
        _countLabel.textColor = [UIColor HEX:0x585858];
        _countLabel.text = [NSString stringWithFormat:@"0/%@", @(self.maxWords)];
        UIBarButtonItem *titleButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_countLabel];
        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        [self.toolBar setItems:@[spaceItem, titleButtonItem, doneButtonItem]];

    }
    return _toolBar;
}
- (void)setMaxWords:(NSInteger)maxWords{
    _maxWords = maxWords;
    _countLabel.text = [NSString stringWithFormat:@"%@/%@", @([self.text ASCIILength]), @(_maxWords)];
}
- (void)setText:(NSString *)text{
    [super setText:text];
    if (!self.lastString) {
        self.lastString = text;
    }
    _countLabel.text = [NSString stringWithFormat:@"%@/%@", @([text ASCIILength]), @(_maxWords)];
}

- (void)setToolBarHidden:(BOOL)toolBarHidden{
    _toolBarHidden = toolBarHidden;
    if (_toolBarHidden) {
        self.inputAccessoryView = nil;
    }else{
        self.inputAccessoryView = self.toolBar;
    }
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
