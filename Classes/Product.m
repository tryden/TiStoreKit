/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2010 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "Product.h"

#import "TiUtils.h"

@implementation Product

-(id)_initWithPageContext:(id<TiEvaluator>)context
			  product:(SKProduct*)product_
{	
	if (self = [super _initWithPageContext:context]) {
		product = [product_ retain];
	}
	return self;
}

-(void)dealloc
{
	[product release];
	[super dealloc];
}

-(id)id
{
	return [[[product productIdentifier] retain] autorelease];
}

-(id)description
{
	return [[[product localizedDescription] retain] autorelease];
}

-(id)price
{
	return [[[product price] retain] autorelease];
}

-(id)title
{
	return [[[product localizedTitle] retain] autorelease];
}

-(id)priceLocale
{
	return [[[[product priceLocale] localeIdentifier] retain] autorelease];
}

- (id)priceAsString
{
  NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
  [formatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
  [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
  [formatter setLocale:[product priceLocale]];
    
  NSString *str = [formatter stringFromNumber:[product price]];
  [formatter release];
  return str;
}

@end
