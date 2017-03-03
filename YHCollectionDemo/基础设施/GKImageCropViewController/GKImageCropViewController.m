//
//  GKImageCropViewController.m
//  GKImagePicker
//
//  Created by Georg Kitz on 6/1/12.
//  Copyright (c) 2012 Aurora Apps. All rights reserved.
//

#import "GKImageCropViewController.h"
#import "GKImageCropView.h"
#import "UIView+EasyLayout.h"

@interface GKImageCropViewController ()

@property (nonatomic, strong) GKImageCropView *imageCropView;
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *useButton;

- (void)_actionCancel;
- (void)_actionUse;
- (void)_setupNavigationBar;
- (void)_setupCropView;

@end

@implementation GKImageCropViewController

#pragma mark -
#pragma mark Getter/Setter

@synthesize sourceImage, cropSize, delegate;
@synthesize imageCropView;
@synthesize toolbar;
@synthesize cancelButton, useButton;

#pragma mark -
#pragma Private Methods


- (void)_actionCancel{
    [self.delegate imageCropController:self didFinishWithCroppedImage:nil];
}

- (void)_actionUse{
    _croppedImage = [self.imageCropView croppedImage];
    [self.delegate imageCropController:self didFinishWithCroppedImage:_croppedImage];
}


- (void)_setupNavigationBar{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
                                                                                          target:self 
                                                                                          action:@selector(_actionCancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self 
                                                                             action:@selector(_actionUse)];
}


- (void)_setupCropView{
    
    self.imageCropView = [[GKImageCropView alloc] initWithFrame:self.view.bounds];
    [self.imageCropView setImageToCrop:sourceImage];
    [self.imageCropView setCropSize:cropSize];
    [self.view addSubview:self.imageCropView];
}

- (void)_setupCancelButton{
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
		
        [[self.cancelButton titleLabel] setFont:[UIFont boldSystemFontOfSize:16]];
        [[self.cancelButton titleLabel] setShadowOffset:CGSizeMake(0, -1)];
        [self.cancelButton setFrame:CGRectMake(0, 0, 58, 30)];
        [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelButton setTitleShadowColor:[UIColor colorWithRed:0.118 green:0.247 blue:0.455 alpha:1] forState:UIControlStateNormal];
        [self.cancelButton  addTarget:self action:@selector(_actionCancel) forControlEvents:UIControlEventTouchUpInside];
}

- (void)_setupUseButton{
        self.useButton = [UIButton buttonWithType:UIButtonTypeCustom];
		
        [[self.useButton titleLabel] setFont:[UIFont boldSystemFontOfSize:16]];
        [[self.useButton titleLabel] setShadowOffset:CGSizeMake(0, -1)];
        [self.useButton setFrame:CGRectMake(0, 0, 58, 30)];
        [self.useButton setTitle:@"确定" forState:UIControlStateNormal];
        [self.useButton setTitleShadowColor:[UIColor colorWithRed:0.118 green:0.247 blue:0.455 alpha:1] forState:UIControlStateNormal];
        [self.useButton  addTarget:self action:@selector(_actionUse) forControlEvents:UIControlEventTouchUpInside];
}
- (void)_setupToolbar{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectZero];
        self.toolbar.translucent = YES;
        self.toolbar.barStyle = UIBarStyleBlackOpaque;
        [self.view addSubview:self.toolbar];
        self.toolbar.el_edgesToSuperView(EL_INGNORE, 0, 0, 0).el_toHeight(AGTabBarHeight);
        [self _setupCancelButton];
        [self _setupUseButton];
        
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithCustomView:self.cancelButton];
        UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *use = [[UIBarButtonItem alloc] initWithCustomView:self.useButton];
        [self.toolbar setItems:[NSArray arrayWithObjects:cancel, flex, use, nil]];

    }
}

#pragma mark -
#pragma Super Class Methods

- (id)init{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = NSLocalizedString(@"GKIchoosePhoto", @"");

    [self _setupNavigationBar];
    [self _setupCropView];
    [self _setupToolbar];

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self.navigationController setNavigationBarHidden:YES];
    } else {
        [self.navigationController setNavigationBarHidden:NO];
    }
}

- (void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.imageCropView.frame = self.view.bounds;
    self.toolbar.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - 54, 320, 54);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
