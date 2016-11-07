#import <Foundation/Foundation.h>
#import "wrapper.h"
#import "test.hpp"


@implementation TestClassCpp
{
    TestClass *testClass;
}

-(id)init {
    self = [super init];
    self->testClass = new TestClass();
    return self;
}

-(void)dealloc {
    // Delete needed to destroy the instance (otherwise leads to memory leak)
    delete self->testClass;
    // Dealloc handle by ACR (-fno-objc-arc flag for this file to disable, no performance hit detected)
    //[super dealloc];
}

-(int)hello {
    return self->testClass->hello();
}

-(void)process
{
    return self->testClass->process();
}

@end
