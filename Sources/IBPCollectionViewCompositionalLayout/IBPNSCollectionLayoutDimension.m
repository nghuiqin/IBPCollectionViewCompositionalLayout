#import "IBPNSCollectionLayoutDimension.h"

typedef NS_ENUM(NSUInteger, IBPNSCollectionLayoutDimensionSemantic) {
    IBPNSCollectionLayoutDimensionSemanticFractionalWidth,
    IBPNSCollectionLayoutDimensionSemanticFractionalHeight,
    IBPNSCollectionLayoutDimensionSemanticAbsolute,
    IBPNSCollectionLayoutDimensionSemanticEstimated,
};

@interface IBPNSCollectionLayoutDimension()

@property (nonatomic, readwrite) CGFloat dimension;
@property (nonatomic) IBPNSCollectionLayoutDimensionSemantic semantic;

@end

@implementation IBPNSCollectionLayoutDimension

+ (instancetype)fractionalWidthDimension:(CGFloat)fractionalWidth {
	return [self dimensionWithDimension:fractionalWidth semantic:IBPNSCollectionLayoutDimensionSemanticFractionalWidth];
}

+ (instancetype)fractionalHeightDimension:(CGFloat)fractionalHeight {
	return [self dimensionWithDimension:fractionalHeight semantic:IBPNSCollectionLayoutDimensionSemanticFractionalHeight];
}

+ (instancetype)absoluteDimension:(CGFloat)absoluteDimension {
	return [self dimensionWithDimension:absoluteDimension semantic:IBPNSCollectionLayoutDimensionSemanticAbsolute];
}

+ (instancetype)estimatedDimension:(CGFloat)estimatedDimension {
	return [self dimensionWithDimension:estimatedDimension semantic:IBPNSCollectionLayoutDimensionSemanticEstimated];
}

+ (instancetype)dimensionWithDimension:(CGFloat)dimension semantic:(IBPNSCollectionLayoutDimensionSemantic)semantic {
    return [[self alloc] initWithDimension:dimension semantic:semantic];
}

- (instancetype)initWithDimension:(CGFloat)dimension semantic:(IBPNSCollectionLayoutDimensionSemantic)semantic {
    self = [super init];
    if (self) {
        self.dimension = dimension;
        self.semantic = semantic;
    }
    return self;
}

- (BOOL)isFractionalWidth {
    return self.semantic == IBPNSCollectionLayoutDimensionSemanticFractionalWidth;
}

- (BOOL)isFractionalHeight {
    return self.semantic == IBPNSCollectionLayoutDimensionSemanticFractionalHeight;
}

- (BOOL)isAbsolute {
    return self.semantic == IBPNSCollectionLayoutDimensionSemanticAbsolute;
}

- (BOOL)isEstimated {
    return self.semantic == IBPNSCollectionLayoutDimensionSemanticEstimated;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return [IBPNSCollectionLayoutDimension dimensionWithDimension:self.dimension semantic:self.semantic];
}

@end
